class Admin::AccessesController < Admin::ApplicationController
  def index
    @accesses = Access.all.order(id: :desc)
  end
end
