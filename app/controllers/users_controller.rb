class UsersController < ApplicationController
  before_action :require_same_user, except: [:new, :create]
  before_action :require_user, except: [:new, :create]

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Something went wrong. Please try again"
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Account successfully updated"
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def show
    @user=User.find(params[:id])
  end
    


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    # binding.pry
    @user=User.find(params[:id])
    if current_user.id != @user.id
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end


end