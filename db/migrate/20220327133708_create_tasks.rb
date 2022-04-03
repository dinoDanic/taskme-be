class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_enum :priority_enum, ["urgent", "high", "low", "none"]
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.enum :priority, enum_type: "priority_enum", default: "none", null: false


      t.timestamps
    end
  end
end
