class UsersController < ApplicationController
def index
	@users = User.all
end

def new
	
    if current_user
        redirect_to buddies_path
    else
        @user = User.new
    end
end

def create
	@user = User.new(user_params)

	if @user.save
		session[:user_id] = @user.id
		redirect_to @user, notice: "Thank you for signing up for Barkit!"
	else
		render 'new'
	end

end

def show
	@user = User.find(params[:id])
	@bark = Bark.new

	@relationship = Relationship.where(
	    follower_id: current_user.id,
	    followed_id: @user.id
	).first_or_initialize if current_user

end
def buddies
    if current_user
        @bark = Bark.new
        buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
        @barks = Bark.find_all_by_user_id buddies_ids
    else
        redirect_to root_url
    end
end


private

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
	end
end