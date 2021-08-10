# frozen_string_literal: true

class CreateNpis < ActiveRecord::Migration[6.1]
  def change
    create_table :npis do |t|
      t.bigint :number, limit: 10, null: false
      t.jsonb :data

      t.timestamps
    end
    add_index :npis, :number, length: 10, unique: true
  end
end
