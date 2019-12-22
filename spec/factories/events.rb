# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :event do
    name { ["Gymnastics Men's Floor Exercise", "Athletics Men's 5,000 metres"].sample }
  end
end
