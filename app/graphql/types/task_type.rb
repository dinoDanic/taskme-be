module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :project_id, ID, null: false
    field :project_name, String, null: false
    field :assignee_name, String, null: true
    field :assignee_id, ID, null: true
    field :description, String, null: true
    field :priority, Types::PriorityEnum, null: false
    field :status, Types::TaskStatusEnum, null: false
  end
end
