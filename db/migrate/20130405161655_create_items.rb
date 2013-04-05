class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.id :project_id
      t.string :title
      t.text :description
      t.boolean :completed, default: false

      t.timestamps
    end

    add_index :items, :project_id
    add_index :items, :title
  end
end
