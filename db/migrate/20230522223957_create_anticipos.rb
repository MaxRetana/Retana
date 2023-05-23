class CreateAnticipos < ActiveRecord::Migration[7.0]
  def change
    create_table :anticipos do |t|
      t.references :arquitecto, null: false, foreign_key: true
      t.references :obra, null: false, foreign_key: true
      t.string :fecha
      t.integer :cantidad
      t.string :concepto

      t.timestamps
    end
  end
end
