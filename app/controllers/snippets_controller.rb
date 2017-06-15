class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = current_user.snippets.new(snippet_params)
    if @snippet.save
      redirect_to dashboard_url
    else
      render :new
    end
  end

  def edit
    @snippet = current_user.snippets.find(params[:id])
  end

  def update
    @snippet = current_user.snippets.find(params[:id])

    if @snippet.update(snippet_params)
      redirect_to dashboard_url, notice: "Snippet created! You rock."
    else
      render :edit
    end
  end

  def destroy
    @snippet = current_user.snippets.find(params[:id])
    @snippet.destroy!
    redirect_to dashboard_url, notice: "Your snippet has been deleted."
  end

  private

  def snippet_params
    params.require(:snippet).permit(:artist, :title, :notes)
  end
end
