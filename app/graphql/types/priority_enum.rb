# First, a base class
# app/graphql/types/base_enum.rb
class Types::BaseEnum < GraphQL::Schema::Enum
end

# app/graphql/types/media_category.rb
class Types::PriorityEnum < Types::BaseEnum
  value "URGENT"
  value "HIGH"
  value "LOW"
end