module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask
    field :create_project, mutation: Mutations::CreateProject
    field :toggle_task_status, mutation: Mutations::ToggleTaskStatus
  end
end
