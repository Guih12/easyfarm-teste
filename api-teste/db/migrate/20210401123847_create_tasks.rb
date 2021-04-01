class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.date :date
      t.string :description
      t.string :status
      t.integer :project_id

      t.timestamps
    end
  end
end
