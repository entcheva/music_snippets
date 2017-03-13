class SnippetsController < ApplicationController

    def index
      @snippets = Snippet.all
    end

    def new
      @snippet = Snippet.new
    end

    def create
      @snippet = Snippet.update(snippet_params)
      redirect_to dashboard_path
    end

    def show
      find_snippet
    end

    private

    def snippet_params
      params.require(:snippet).permit(:name, :artist, :notes, :user_id)
    end

    def find_snippet
      @snippet = Snippet.find(params[:id])
    end

  end
