module Mutations
  class CreateProject < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(name:, description: nil)
      user = context[:current_user]
      project =
        Project.create(name: name, user_id: user.id, description: description)
    end
  end
end
