class SnippetsController < ApplicationController

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user_id = current_user.id
    # binding.pry
    @snippet.save
    redirect_to dashboard_path
  end


  private

  def snippet_params
    params.require(:snippet).permit(:name, :artist, :notes)
  end

end
