module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :login, String, null: true, description: 'Login a user' do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false

    def logout
      Session.where(id: context[:session_id]).destroy_all
    end

    field :get_projects, [Types::ProjectType], null: true

    def get_projects
      user = context[:current_user]
      Project.where(user_id: user.id)
    end

    field :get_project_by_id, Types::ProjectType, null: true do
      argument :id, ID, required: true
    end

    def get_project_by_id(id:)
      user = context[:current_user]
      project = user.projects.find(id)
    end

    field :get_all_users, [Types::UserType], null: true

    def get_all_users
      User.all
    end

    field :get_project_tasks, [Types::TaskType], null: true do
      argument :id, ID, required: true
    end

    def get_project_tasks(id:)
      tasks = Task.where(project_id: id, parent_id: nil)
    end

    field :get_task_by_id, Types::TaskType, null: false do
      argument :id, ID, required: true
    end

    def get_task_by_id(id:)
      task = Task.find(id)
    end

    field :get_task_by_parent_and_project, [Types::TaskType], null: true do
      argument :parent_id, ID, required: true
      argument :project_id, ID, required: true
    end

    def get_task_by_parent_and_project(parent_id:, project_id:)
      user = context[:current_user]
      tasksss = Task.where(project_id: project_id, parent_id: parent_id)
    end

    field :get_assigned_tasks, [Types::TaskType], null: true

    def get_assigned_tasks
      user = context[:current_user]
      tasks = user.tasks.where(assignee_id: user.id)
      tasks
    end
  end
end
