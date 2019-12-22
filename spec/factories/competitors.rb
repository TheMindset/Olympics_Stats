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

FactoryBot.define do
  factory :competitor do
    age { rand(10..40) }
    height { rand(160..220) }
    weight { rand(40..110) }
    sex { ["M", "F"].sample }
    name { Faker::Name.unique.name }
    team { FactoryBot.create(:team) }
  end
end
