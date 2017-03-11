module Api::V1

  class SnippetsController < ApplicationController

    def index
      @snippets = Snippet.all
      render json: @snippets, each_serializer: SnippetSerializer
    end

    def new
      find_snippet
    end

    def create
      find_snippet
      @snippet = Snippet.create(snippet_params)
      render json: @snippet, serializer: SnippetSerializer
    end

    def show
      render json: find_snippet
    end

    def edit
      find_snippet
    end

    def update
      find_snippet
      @snippet = Snippet.update(snippet_params)
      render json: @snippet
    end

    def delete
      find_snippet
      @snippet.destroy
      @snippets = Snippets.all
      render json: @snippets
    end

    def destroy
    end

    private

    def snippet_params
      params.require(:snippets).permit(:name, :artist, :notes, :date, :user_id)
    end

    def find_snippet
      @snippet = Snippet.find(params[:id])
    end

  end

end
