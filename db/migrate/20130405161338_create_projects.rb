class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :team_id
      t.string :name
      t.text :description

      t.timestamps
    end

    add_index :projects, :team_id
    add_index :projects, :name
  end
end
