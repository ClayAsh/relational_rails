class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :active
      t.float :funding
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
