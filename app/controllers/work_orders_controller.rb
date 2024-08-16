class WorkOrdersController < ApplicationController
  def index
    @technicians = Technician.includes(:work_orders)
  end
end