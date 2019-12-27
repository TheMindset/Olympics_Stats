# frozen_string_literal: true

class CompetitorsStatsSerializer
  include FastJsonapi::ObjectSerializer

  set_type :competitors_stats
  set_id :id

  attribute :total_competitors

  attribute :average_age do |object|
    object.average_age.to_i
  end

  attribute :average_height do |object|
    {
      unit: 'cm',
      female_competitors: object.average_height[:female_competitors].to_i,
      male_competitors: object.average_height[:male_competitors].to_i
    }
  end

  attribute :average_weight do |object|
    {
      unit: 'kg',
      female_competitors: object.average_weight[:female_competitors].to_i,
      male_competitors: object.average_weight[:male_competitors].to_i
    }
  end
end
