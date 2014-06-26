class CreateLengths < ActiveRecord::Migration
  def change
    create_table :lengths do |t|
      t.string :name
      t.references :dress, index: true

      t.timestamps
    end
  end
end
