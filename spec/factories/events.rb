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

FactoryBot.define do
  factory :event do
    events = [
      "Gymnastics Men's Rings", "Gymnastics Men's Pommelled Horse",
      "Gymnastics Men's Rings", "Gymnastics Men's Pommelled Horse",
      "Athletics Women's 5,000 metres",     "Rowing Men's Coxless Pairs",
      "Athletics Women's 5,000 metres",     "Rowing Men's Coxless Pairs",
      "Taekwondo Women's Flyweight",        "Handball Men's Handball",
      "Taekwondo Women's Flyweight",        "Handball Men's Handball",
      "Boxing Women's Middleweight",        "Athletics Men's 400 metres",
      "Boxing Women's Middleweight",        "Athletics Men's 400 metres",
      "Handball Women's Handball",          "Cycling Women's Road Race",
      "Handball Women's Handball",          "Cycling Women's Road Race",
      "Diving Women's Platform",            "Shooting Men's Air Pistol",
      "Diving Women's Platform",            "Shooting Men's Air Pistol",
      "Shooting Men's Free Pistol",         "Shooting Women's Air Rifle",
      "Shooting Men's Free Pistol",         "Shooting Women's Air Rifle",
      "Boxing Men's Lightweight",           "Judo Men's Half-Middleweight",
      "Boxing Men's Lightweight",           "Judo Men's Half-Middleweight",
      "Weightlifting Women's Middleweight", "Weightlifting Men's Middle-Heavyweight",
      "Weightlifting Women's Middleweight", "Weightlifting Men's Middle-Heavyweight",
      "Football Men's Football",            "Synchronized Swimming Women's Team",
      "Football Men's Football",            "Synchronized Swimming Women's Team",
      "Judo Men's Extra-Lightweight",       "Wrestling Men's Middleweight, Greco-Roman",
      "Judo Men's Extra-Lightweight",       "Wrestling Men's Middleweight, Greco-Roman",
      "Athletics Men's 10,000 metres",      "Volleyball Women's Volleyball",
      "Athletics Men's 10,000 metres",      "Volleyball Women's Volleyball"
    ]

    name { events.pop }
    sport { FactoryBot.create(:sport) }
  end
end
