# parent de tous les controllers de l'application
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale # set_locale va etre executee avant chaque action de chaque controller

    def default_url_options # donne les parametres par defaut a passer dans l'url
        { locale: I18n.locale } # permet de maintenir la locale courante (laisser le site en francais s'il a utilise le bouton de langue)
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    end

    private
    def set_locale # fait en sorte de definir la locale pour chaque requete
        locale = params[:locale] || cookies[:locale] || I18n.default_locale
        # la locale courante est celle que l'on a passe en parametre ; si elle n'est pas passee en parametre on la recupere depuis default_locale (que l'on veut mettre par defaut en francais)
        # voir /config/initializers/locale.rb
        # locale recoit donc soit le parametre locale precise (si on clique sur le lien EN ou FR), sinon il prend la locale sauvegardee par le cookie, sinon il prend la locale par defaut (qui est "fr")
        I18n.locale = locale
        cookies[:locale] = { value: locale, expires: 30.days }
        # permet de maintenir le parametre de langue pendant 30 jours (si on ferme le navigateur) grace a un cookie
    end
end
