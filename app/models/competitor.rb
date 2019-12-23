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
end
