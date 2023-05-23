class CreateObras < ActiveRecord::Migration[7.0]
  def change
    create_table :obras do |t|
      t.string :nombre
      t.string :estado

      t.timestamps
    end
  end
end
