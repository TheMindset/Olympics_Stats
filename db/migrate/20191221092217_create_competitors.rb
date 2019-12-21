# frozen_string_literal: true

class CreateCompetitors < ActiveRecord::Migration[5.2]
  def change
    create_table :competitors do |t|
      t.string :name
      t.string :sex
      t.integer :age
      t.string :height
      t.string :weight

      t.timestamps
    end
  end
end
