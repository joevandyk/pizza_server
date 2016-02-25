module Commands
  class CreatePizza
    include Wisper.publisher

    SUCCESS = :create_pizza_success
    ERROR   = :create_pizza_error

    def initialize
    end

    def call(pizza:)
      validator = Validators::Pizza.new.call(pizza)
      if validator.messages.blank?
        pizza = Pizza.create!(validator.params)
        broadcast(SUCCESS, pizza)
        return pizza
      else
        broadcast(ERROR, validator.errors)
        return validator.errors
      end
    end
  end
end
