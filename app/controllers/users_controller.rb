class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def create; end

  def set_user
    @user = User.find(params[:id])
  end
end
