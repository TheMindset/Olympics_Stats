# frozen_string_literal: true

# == Schema Information
#
# Table name: sports
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sport < ApplicationRecord
  validates :name, presence: true

  has_many :events
  has_many :competitor_sports
  has_many :competitors, through: :competitor_sports
end
