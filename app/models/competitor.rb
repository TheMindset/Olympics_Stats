# frozen_string_literal: true

# == Schema Information
#
# Table name: competitors
#
#  id         :bigint           not null, primary key
#  age        :integer
#  height     :integer
#  name       :string
#  sex        :integer
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :bigint
#
# Indexes
#
#  index_competitors_on_team_id  (team_id)
#

class Competitor < ApplicationRecord
  validates :name, presence: true

  belongs_to :team
  has_many :competitor_sports
  has_many :sports, through: :competitor_sports

  has_many :competitor_events
  has_many :events, through: :competitor_events

  enum sex: { F: 0, M: 1 }

  def total_medal_count
    competitor_events.where.not(medal: 0).count
  end

  def self.youngest_competitor
    find_by(age: minimum(:age))
  end

  def self.oldest_competitor
    find_by(age: maximum(:age))
  end

  def self.total_competitors
    Competitor.count
  end

  def self.competitors_average(gender, attribute)
    where(sex: gender)
      .average(attribute)
  end

  def self.medalists_competitors(event_id)
    select('competitors.*, competitor_events.medal AS medal')
      .joins(:events)
      .where('events.id = ?', event_id)
      .where.not('competitor_events.medal = ?', 0)
  end
end
