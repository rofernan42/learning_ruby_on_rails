class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy] # on cree find_book seulement pour les actions show edit update et destroy (pour eviter les duplications de code)
    before_action :store_editor_name, only: [:create, :update] # pareil mais pour create et update

    def index
        @books = Book.page(params[:page]) # utilise le helper du gem kaminari pour faire la pagination des livres automatiquement
    end

    def show
    end

    def new
        @book = Book.new
    end

    def edit
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = I18n.t("books.created") # affiche un message a la creation du livre
            redirect_to books_path # retour vers l'index
        else
            render :new
        end
    end

    def update
        if @book.update(book_params)
            flash[:notice] = I18n.t("books.update") # affiche un message a l'edition du livre
            redirect_to books_path # retour vers l'index
        else
            render :edit
        end
    end

    def destroy
        @book.destroy # voir app/views/books/destroy.js.erb et _book.html.erb
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :description, :pages_count, :published_at, :editor_name)
    end

    def find_book # va s'executer avant show edit update et destroy ; effectue la lecture d'une ressource de type Book
        # avant callbacks:
        # @book = Book.find(params[:id])
        # apres callbacks:
        @book = Book.find_by_id(params[:identifier])
        # = Book.where(id: params[:identifier]).first
        @book ||= Book.find_by_slug(params[:identifier])
        raise ActionController::RoutingError.new("Not found") unless @book
        # unless @book = if @book.nil?
    end

    def store_editor_name # va s'executer avant create et update ; permet de preremplir le champ "editor name" avec le dernier qui a ete precise
        session[:editor_name] = book_params[:editor_name]
    end
end
