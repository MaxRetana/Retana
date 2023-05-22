class CreateAnticipos < ActiveRecord::Migration[7.0]
  def change
    create_table :anticipos do |t|
      t.string :arquitecto
      t.string :obra
      t.string :fecha
      t.integer :cantidad
      t.string :concepto

      t.timestamps
    end
  end
end
