class Admin::ClientsController < Admin::ApplicationController
  def index
    @clients = Client.all.order(id: :desc)
  end
end
