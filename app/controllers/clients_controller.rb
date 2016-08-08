class ClientsController < ApplicationController

  before_action :find_client, only: [:edit, :show]
  before_action :set_client, only: [:update, :create]

  def show
  end

  def new
    @client = Client.new
  end

  def create

    if @client.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
    @client = Client.new
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
    @client = Client.new(client_params)
  end

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:company_name, :website, :user_id) #how to pass user_id
  end

end
