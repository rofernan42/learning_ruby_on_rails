class Book < ApplicationRecord
    validates :title, :author, :slug, presence: true
    validates :pages_count, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true

    before_validation :set_slug, if: :should_set_slug? # voir Callbacks
    # le slug est utilise pour pouvoir aller sur la page d'un livre en faisant l'url /books/titre-du-livre

    private
    def should_set_slug?
        title.present? && (slug.blank? || title_changed?) # methode avec '_' -> voir methode 'dirty'
    end

    def set_slug
        self.slug = title.parameterize
        # "self" sert a modifier la variable de l'instance. S'il n'y avait pas "self", on creerait en fait une nouvelle variable "slug" qui serait supprimee a la fin de la fonction.
        # parameterize permet de parametrer un titre de livre avec des caracteres speciaux pour qu'il fonctionne dans une url.
        # exeple: titre: l'ane trotro -> va etre change en: l-ane-trotro
        counter = 1
        while Book.exists?(slug: slug) do # = while Book.where(slug: slug).count >= 1 do
            self.slug = "#{title.parameterize}-#{counter}"
            counter += 1
            # ~ tant qu'il existe avec ce slug on incremente le compteur et on cree un nouveau slug avec le compteur au bout
            # utilise pour le cas ou plusieurs livres ont le meme titre
        end
    end
end
