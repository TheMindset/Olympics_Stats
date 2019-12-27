# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  validates :name, presence: true

  has_many :competitors, dependent: :destroy

  def total_medal
    competitors
      .joins(:events)
      .merge(CompetitorEvent.event_with_medal)
      .count
  end

  def count_medal(medal)
    competitors
      .joins(:events)
      .where(competitor_events: { medal: medal })
      .count
  end
end
