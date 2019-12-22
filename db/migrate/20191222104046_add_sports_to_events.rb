# frozen_string_literal: true

class AddSportsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :sport, foreign_key: true
  end
end
