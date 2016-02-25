module Values
  class Pizza < Dry::Data::Struct
    attribute :name, String
    attribute :description, String
  end
end
