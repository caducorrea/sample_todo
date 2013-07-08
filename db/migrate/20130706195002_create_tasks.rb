class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer  :user_id
      t.string   :name
      t.text     :description
      t.boolean  :done, default: false

      t.timestamps
    end
  end
end
