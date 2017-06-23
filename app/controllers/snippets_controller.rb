class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = current_user.snippets.new(snippet_params)
    if @snippet.save
      record_activity(subject: @snippet, status: "created")
      redirect_to dashboard_url, notice: "Snippet created! You rock."
    else
      render :new, status: 400
    end
  end

  def edit
    @snippet = current_user.snippets.find(params[:id])
  end

  def update
    @snippet = current_user.snippets.find(params[:id])
    if @snippet.update(snippet_params)
      record_activity(subject: @snippet, status: "updated")
      redirect_to dashboard_url, notice: "Snippet updated successfully."
    else
      render :edit, status: 400
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
