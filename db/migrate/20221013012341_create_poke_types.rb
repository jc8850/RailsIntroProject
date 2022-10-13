class CreatePokeTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :poke_types do |t|
      t.references :Pokemon, null: false, foreign_key: true
      t.references :Type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
