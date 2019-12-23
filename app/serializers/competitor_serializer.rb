# frozen_string_literal: true

class CompetitorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :age,
             :name,
             :sports,
             :team

  attribute :total_medal_count, &:total_medal_count
end
