class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.decimal :completion
      t.integer :estimate
      t.integer :importance
      t.integer :urgency
      t.string :ancestry

      t.timestamps
    end
    add_index :tasks, :ancestry
  end
end
