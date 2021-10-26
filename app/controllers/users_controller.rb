class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :check_is_admin, only: :index
# GET /users or /users.json
def index
  @users = User.all
  set_meta_tags site: 'User all'
   # ap @users
end

# GET /users/1 or /users/1.json
def show
  set_meta_tags title: @user.name,
  site: 'User Form',
  reverse: true
  @microposts = @user.microposts.paginate(page:params[:page])
end

# GET /users/new
def new
  @user = User.new
  set_meta_tags site: 'New user'
end

# GET /users/1/edit
def edit
  @user = User.find(params[:id])
  set_meta_tags title: @user.name,
  site: 'Edit Form',
  reverse: true
end

# POST /users or /users.json
def create
  set_meta_tags title: @user.name,
  site: 'Edit Form',
  everse: true
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      format.html { redirect_to @user, notice: "User was successfully created." }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /users/1 or /users/1.json
def update
  respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to @user, notice: "User was successfully updated." }
      format.json { render :show, status: :ok, location: @user }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /users/1 or /users/1.json
def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def check_is_admin
      redirect_to root_path, notice: "you are not admin" unless current_user&.is_admin?
    end
end
