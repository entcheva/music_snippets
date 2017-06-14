require "rails_helper"

RSpec.describe ApplicationController do
  it { is_expected.to use_before_action(:require_login) }
end
