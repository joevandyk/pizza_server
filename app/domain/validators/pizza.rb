module Validators
  class Pizza < Dry::Validation::Schema::Form
    key(:name) { |value| value.str? & value.filled? }
    key(:description) { |value| value.str? & value.filled? }
  end
end

