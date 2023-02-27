class Public::CustomersController < ApplicationController

def show
  @customers = Customer.all
#   @customer = current_customer
end

end
