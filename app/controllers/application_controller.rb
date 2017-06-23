class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def record_activity(subject:, status:)
    Activity.create!(
      subject: subject,
      user: current_user,
      status: status,
    )
  end
end
