class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :active
      t.integer :funding

      t.timestamps
    end
  end
end
