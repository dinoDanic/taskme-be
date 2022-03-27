module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask
    field :create_project, mutation: Mutations::CreateProject
  end
end
