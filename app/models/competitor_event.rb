# frozen_string_literal: true

# == Schema Information
#
# Table name: competitor_events
#
#  id            :bigint           not null, primary key
#  medal         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competitor_id :bigint
#  event_id      :bigint
#
# Indexes
#
#  index_competitor_events_on_competitor_id  (competitor_id)
#  index_competitor_events_on_event_id       (event_id)
#

class CompetitorEvent < ApplicationRecord
  belongs_to :competitor
  belongs_to :event

  enum medal: { NA: 0, Bronze: 1, Silver: 2, Gold: 3 }

  scope :event_with_medal, -> { where.not(medal: 0) }
end
