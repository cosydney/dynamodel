class ClientController < ApplicationController

  before_action :set_client, only: [:show]

  def show
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)


  end

  def edit
  end

  def update
  end


  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:company_name, :website, :user_id) #how to pass user_id
  end

end
