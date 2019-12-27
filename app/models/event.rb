# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sport_id   :bigint
#
# Indexes
#
#  index_events_on_sport_id  (sport_id)
#
# Foreign Keys
#
#  fk_rails_...  (sport_id => sports.id)
#

class Event < ApplicationRecord
  validates :name, presence: true

  belongs_to :sport
  has_many :competitor_events
  has_many :competitors, through: :competitor_events

  def self.team_events(team_id)
    select("events.*")
      .joins(competitors: :team)
      .where(teams: { id: team_id })
      .uniq.pluck(:name)
  end
end
