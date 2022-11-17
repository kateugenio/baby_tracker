class FoodsController < ApplicationController
  before_action :log_request
  before_action :parse_json_request, only: :create

  def create
    food = Food.new(food_params)
    if food.save
      msg = "Successfully logged food"
    else
      # TODO: Output each error as meaningful error message speech
      msg = "There was a problem with your request, please try again."
    end

    render json: alexa_response(msg)
  end

  private

  def log_request; end

  def parse_json_request
    @req = JSON.parse(request.body.read, symbolize_names: true)
  end

  def build_attributes
    slots = @req[:request][:intent][:slots]
    attributes = slots.each_with_object({}) do |slot, h|
      h[slot[0]] = slot[1][:value]
    end
    ActionController::Parameters.new(attributes)
  end

  def params
    build_attributes
  end

  def food_params
    params.permit(:food, :measurement, :amount)
  end

  def alexa_response(msg)
    { 
      version: "1.0",
      response: {
        outputSpeech: {
          type: "PlainText",
          text: msg
        }
      }
    }
  end
end
