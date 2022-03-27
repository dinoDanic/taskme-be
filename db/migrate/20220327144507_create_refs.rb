class CreateRefs < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :project, foreign_key: true
    add_reference :projects, :user, foreign_key: true
    add_reference :tasks, :user, foreign_key: true
    add_reference :tasks, :assignee, foreign_key: { to_table: :users }
    add_reference :tasks, :parent, foreign_key: { to_table: :tasks }
  end
end
