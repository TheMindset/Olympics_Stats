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

FactoryBot.define do
  factory :sport do
    name { Faker::Sports::Football.team }
  end
end
