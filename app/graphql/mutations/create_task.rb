module Mutations
  class CreateTask < BaseMutation
    argument :name, String, required: true
    argument :project_id, ID, required: true
    argument :assignee_id, ID, required: true
    argument :parent_id, ID, required: true

    type Types::TaskType

    def resolve(name:, project_id:, assignee_id:, parent_id:)
      user = context[:current_user]
      if assignee_id
        task =
          Task.create(
            name: name,
            user_id: user.id,
            project_id: project_id,
            assignee_id: assignee_id,
            parent_id: parent_id,
          )
      else
        task =
          Task.create(
            name: name,
            user_id: user.id,
            project_id: project_id,
            assignee_id: user.id,
            parent_id: parent_id,
          )
      end
    end
  end
end