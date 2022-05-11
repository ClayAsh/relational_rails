class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.boolean :registered
      t.integer :hours_available
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
