# frozen_string_literal: true

class CompetitorStatFacade
  attr_reader :id

  def initialize
    @id = nil
  end

  def total_competitors
    Competitor.total_competitors
  end

  def average_age
    Competitor.competitors_average([0, 1], 'age')
  end

  def average_height
    {
      female_competitors: Competitor.competitors_average(0, "height"),
      male_competitors: Competitor.competitors_average(1, "height")
    }
  end

  def average_weight
    {
      female_competitors: Competitor.competitors_average(0, "weight"),
      male_competitors: Competitor.competitors_average(1, "weight")
    }
  end
end
