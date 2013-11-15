class BarksController < ApplicationController
  def index
    @barks = Bark.all include: :user
    @bark = Bark.new
  end

  def create
    @bark = Bark.new(bark_params)
    @bark.user_id = current_user.id
   
    if @bark.save
        redirect_to current_user 
    else
        flash[:error] = "Problem!"
        redirect_to current_user
    end
  end





private

	def bark_params
		params.require(:bark).permit(:content, :user_id)
	end


end
