# frozen_string_literal: true

class AddCompetitorToTeams < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :competitor, foreign_key: true
  end
end
