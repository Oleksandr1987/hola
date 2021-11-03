class SecretsController < ApplicationController
  before_action :chek_current_user

    def index
      set_meta_tags site: 'Secrets post'
    end

    private

    def chek_current_user
      redirect_to root_path, notice: 'you are not login' unless current_user&.present?
    end
  end
