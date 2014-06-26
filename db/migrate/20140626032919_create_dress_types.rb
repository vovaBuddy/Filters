class CreateDressTypes < ActiveRecord::Migration
  def change
    create_table :dress_types do |t|
      t.string :name
      t.references :dress, index: true

      t.timestamps
    end
  end
end
