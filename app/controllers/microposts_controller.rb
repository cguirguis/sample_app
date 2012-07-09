class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
  	if @micropost.save
  		flash[:success] = "Micropost created!"
  		redirect_to root_path
	else
		@feed_items = [] # needed so page doesn't break on failed submission
		render 'static_pages/home'
	end
  end

  def destroy
  	@micropost.destroy
  	redirect_to root_path
  end

  private

  	def correct_user
  		@micropost = current_user.microposts.find_by_id(params[:id])
  		# Could do '= Micropost.find_by_id(..)' but always better to 
  		# run lookups through association for security purposes
  		# Could do .find but that raises an exception when micropost 
  		# doesn't exist instead of returning nil
  		redirect_to root_path if @micropost.nil?
  	end
end
