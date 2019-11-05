class UsersController < ApplicationController
  
	def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  
    @user = User.new(first_name: params[:first_name], 
    last_name: params[:last_name], age: params[:age],
    email: params[:email], description: params[:description],
    password: params[:password])
   
    if @user.save 
      flash[:success] = "Bienvenue sur notre site."
      redirect_to "/"
    else
      flash.now[:error]
      render action: "new"
    end
  end
end


end

