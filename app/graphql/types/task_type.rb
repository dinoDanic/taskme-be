module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :project_id, ID, null: false
    field :assignee_id, ID, null: false
  end
end