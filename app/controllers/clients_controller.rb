class ClientsController < ApplicationController

  # before_action :find_client, only: [:edit, :show]
  before_action :set_client, only: [:show, :edit, :update]

  def show
  end

  # def new
  #   @client = Client.new
  # end

  # def create

  #   if @client.save
  #     redirect_to client_path(@client)
  #   else
  #     render :new
  #   end
  # end

  def edit
    # @client = Client.new
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render :edit
    end
  end


  private

  def set_client
    # @client = Client.new(client_params)
    @client = current_user.client
  end

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:company_name, :website, :first_name, :last_name, :phone, :email) #how to pass user_id
  end

end
