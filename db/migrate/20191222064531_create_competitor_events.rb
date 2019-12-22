# frozen_string_literal: true

class CreateCompetitorEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :competitor_events do |t|
      t.belongs_to :event
      t.belongs_to :competitor

      t.timestamps
    end
  end
end
