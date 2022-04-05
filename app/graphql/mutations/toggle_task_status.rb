module Mutations
  class ToggleTaskStatus < BaseMutation
    argument :status, Types::TaskStatusEnum, required: true
    argument :task_id, ID, required: true


    type Types::TaskType

    def resolve(status:, task_id:)
      task = Task.find(task_id)
      task.status = status
      task.save
      task
    end
  end
end