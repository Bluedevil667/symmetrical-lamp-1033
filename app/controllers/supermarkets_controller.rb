class SupermarketsController < ApplicationController

  def show
    @supermarket = Supermarket.find(params[:id])
    @customer_items = CustomerItem.where(item_id: @supermarket.items.pluck(:id))
    @customers = @customer_items.distinct.pluck(:customer_id)
    @customer_records = Customer.where(id: @customers)
  end
end