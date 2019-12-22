# frozen_string_literal: true

class CreateCompetitorSports < ActiveRecord::Migration[5.2]
  def change
    create_table :competitor_sports do |t|
      t.belongs_to :competitor
      t.belongs_to :sport
      t.timestamps
    end
  end
end
