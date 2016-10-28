class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name 
      t.boolean :done
      t.timestamps
      # Completa con las columnas que necesites
    end
  end
end
