class RelationshipsController < ApplicationController
before_action :set_user

  def create
      user = User.find(params[:followed_id])
      current_user.follow(@user)
      respond_to do |format|
          format.html { redirect_to @user }
          format.js
        end
    end

    def destroy
      user = Relationship.find(params[:id]).followed
      current_user.unfollow(@user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    end
  end


    private
    def set_user
      @user = User.find(params[:relationships][:followed_id])
    end
