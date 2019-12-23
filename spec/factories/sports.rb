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
  sports = [
    'Weightlifting', 'Gymnastics',
    'Weightlifting', 'Gymnastics',
    'Athletics',     'Rowing',
    'Athletics',     'Rowing',
    'Taekwondo',     'Boxing',
    'Taekwondo',     'Boxing',
    'Equestrianism', 'Cycling',
    'Equestrianism', 'Cycling',
    'Badminton',     'Rugby Sevens',
    'Badminton',     'Rugby Sevens',
    'Table Tennis',  'Water Polo',
    'Table Tennis',  'Water Polo',
    'Trampolining',  'Basketball',
    'Trampolining',  'Basketball',
    'Triathlon',     'Modern Pentathlon',
    'Triathlon',     'Modern Pentathlon',
    'Sailing',       'Beach Volleyball',
    'Sailing',       'Beach Volleyball',
    'Golf',          'Rhythmic Gymnastics',
    'Golf',          'Rhythmic Gymnastics',
    'Hockey',        'Gymnastics',
    'Hockey',        'Gymnastics',
    'Archery',       'Tennis',
    'Archery',       'Tennis'
  ]

  factory :sport do
    name { sports.pop }
  end
end
