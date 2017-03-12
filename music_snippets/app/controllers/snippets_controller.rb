class SnippetsController < ApplicationController

    def index
      @snippets = Snippet.all
    end

    def new
      find_snippet
    end

    def create
      @snippet = Snippet.create(snippet_params)
      # @snippet.user_id = @user.id
    end

    def show
      find_snippet
    end

    private

    def snippet_params
      params.require(:snippets).permit(:name, :artist, :notes, :user_id)
    end

    def find_snippet
      @snippet = Snippet.find(params[:id])
    end

  end
