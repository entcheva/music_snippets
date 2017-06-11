class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user_id = current_user.id
    if @snippet.save
      redirect_to dashboard_path
    else
      redirect_to new_snippet_path, notice: @snippet.errors.messages
    end
  end

  def edit
    @snippet = current_user.snippets.find(params[:id])
  end

  def update
    @snippet = current_user.snippets.find(params[:id])

    if @snippet.update(snippet_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @snippet = current_user.snippets.find(params[:id])
    @snippet.destroy!
    flash[:notice] = "Your snippet has been deleted."
    redirect_to dashboard_path
  end

  private

  def snippet_params
    params.require(:snippet).permit(:artist, :title, :notes)
  end
end
