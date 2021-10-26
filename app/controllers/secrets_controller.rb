class SecretsController < ApplicationController
  before_action :check_current_user
  def index
  end
  private
  def check_current_user
    redirect_to root_path, notice: "you are not login in" unless current_user&.present?
  end
end
