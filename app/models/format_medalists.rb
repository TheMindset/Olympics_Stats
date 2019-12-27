# frozen_string_literal: true

class FormatMedalists
  attr_reader :name, :age, :medal, :team

  def initialize(medalist)
    @name = medalist.name
    @age = medalist.age
    @medal = medalist.medal
    @team = medalist.team
  end

  def format_madalists_by_events
    {
      name: @name,
      age: @age,
      team: @team.name,
      medal:
      case @medal
      when 1
        'Bronze'
      when 2
        'Silver'
      when 3
        'Gold'
      end
    }
  end
end
