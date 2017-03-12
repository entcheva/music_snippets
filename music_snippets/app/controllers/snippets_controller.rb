class SnippetsController < ApplicationController

    def index
      @snippets = Snippet.all
    end

    def new
      find_snippet
    end

    def create
      @snippet = Snippet.create(snippet_params)
    end

    def edit
      find_snippet
    end

    def update
      find_snippet
      @snippet = Snippet.update(snippet_params)
    end

    def delete
      find_snippet
      @snippet.destroy
      @snippets = Snippets.all
    end

    private

    def snippet_params
      params.require(:snippets).permit(:name, :artist, :notes, :user_id)
    end

    def find_snippet
      @snippet = Snippet.find(params[:id])
    end

  end
