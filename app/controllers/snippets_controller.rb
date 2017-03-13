class SnippetsController < ApplicationController

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.create(snippet_params)
    @snippet.user = current_user
    redirect_to dashboard_path
  end


  private

  def snippet_params
    params.require(:snippet).permit(:name, :artist, :notes, :user_id)
  end

end
