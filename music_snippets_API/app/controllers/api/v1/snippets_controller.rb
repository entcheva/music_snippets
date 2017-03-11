module Api::V1

  class SnippetsController < ApplicationController

    def index
      @snippets = Snippet.all
      render json: @snippets, each_serializer: SnippetSerializer
    end

    def new
      @snippet = Snippet.create(snippet_params)
      render json: @snippet, serializer: SnippetSerializer
    end

    def create
    end

    def edit
    end

    def update
    end

    def delete
    end

    def destroy
    end

    private

    def user_params
      params.require(:snippets).permit(:name, :artist, :notes, :date, :user_id)
    end

  end

end
