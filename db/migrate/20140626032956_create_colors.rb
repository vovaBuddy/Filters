class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.references :dress, index: true

      t.timestamps
    end
  end
end
