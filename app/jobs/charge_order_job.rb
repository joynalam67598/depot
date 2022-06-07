class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def perform(order, pay_type_params)
    order.charge!(pay_type_params)
  end
end
