# frozen_string_literal: true

# == Schema Information
#
# Table name: competitor_events
#
#  id            :bigint           not null, primary key
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
end