class PizzaTopping < ActiveRecord::Base
  belongs_to :pizza
  belongs_to :topping

  validates :pizza, presence: true
  validates :topping, presence: true

  def name
    topping.name
  end

  def to_json
    attributes.merge({name: name})
  end
end
