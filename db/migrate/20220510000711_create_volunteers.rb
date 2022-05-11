class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.boolean :registeres
      t.integer :hours_available
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :project_id
    end
  end
end
