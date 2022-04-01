module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :role, String, null: true
    field :name, String, null: false
  end
end
