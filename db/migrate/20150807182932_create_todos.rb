class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :desc
      t.date :due_date
      t.boolean :completed, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :todos, :user_id
  end
end
