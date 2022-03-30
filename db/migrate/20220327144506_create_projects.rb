class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description, null: true
      t.string :visibility

      t.timestamps
    end
  end
end
