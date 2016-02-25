
class PizzasController < ApplicationController
  def index
    Commands::GetPizzas.run do |pizzas|
      render json: pizzas
    end
  end

  def create
    command = Commands::CreatePizza.new
    command.on Commands::CreatePizza::SUCCESS do |pizza|
      render(json: pizza.to_json)
    end
    command.on Commands::CreatePizza::ERROR do |errors|
      render(json: errors.to_json, status: 422)
    end
    command.call(pizza: params[:pizza])
  end

  private

  def pizza_params
    params.require(:pizza).permit(:name, :description)
  end
end
