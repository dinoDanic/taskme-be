module Mutations
  class CreateProject < BaseMutation
    argument :name, String, required: true

    type Types::ProjectType

    def resolve(name:)
      user = context[:current_user]
      project = Project.create(name: name, user_id: user.id)
    end
  end
end
