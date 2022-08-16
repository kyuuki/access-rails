class Admin::ApplicationController < ApplicationController
  layout "admin"

  #before_action :authenticate_admin_user!

  # Devise の authenticate_user! のまね
  # def authenticate_admin_user!
  # end
end
