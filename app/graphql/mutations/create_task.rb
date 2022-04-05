module Mutations
  class CreateTask < BaseMutation
    argument :name, String, required: true
    argument :project_id, ID, required: true
    argument :assignee_id, ID, required: false
    argument :parent_id, ID, required: true
    argument :priority, Types::PriorityEnum, required: true
    argument :status, Types::TaskStatusEnum, required: true
    argument :description, String, required: false

    type Types::TaskType

    def resolve(name:, project_id:, assignee_id:, parent_id:, priority:, description:, status:)
      user = context[:current_user]
      task = Task.create(
          name: name,
          user_id: user.id,
          project_id: project_id,
          assignee_id: assignee_id,
          parent_id: parent_id,
          priority: priority,
          description: description,
          status: status
      )
    end
  end
end
