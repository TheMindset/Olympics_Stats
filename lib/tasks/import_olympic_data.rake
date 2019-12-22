# frozen_string_literal: true

require 'csv'

namespace :import_olympic_data do
  desc "Import data from csv file"

  task persit_data_in_db: :environment do
    options = {
      header_converters: :symbol,
      headers: true
    }

    CSV.foreach('./db/data/olympic_data_2016.csv', options) do |row|
      team = Team.find_or_create_by(
        name: sanitaze_team_name(row[:team])
      )

      competitor = Competitor.find_or_create_by(name: row[:name]) do |new_attribute|
        new_attribute.age = row[:age]
        new_attribute.height = row[:height]
        new_attribute.sex = enum_sex(row[:sex])
        new_attribute.weight = row[:weight]
        new_attribute.team = team
      end

      sport = Sport.find_or_create_by(
        name: row[:sport]
      )

      event = Event.find_or_create_by(name: row[:event]) do |new_attribute|
        new_attribute.sport = sport
      end

      competitor.competitor_sports.find_or_create_by(sport: sport)

      competitor.competitor_events.find_or_create_by(event: event) do |new_attribute|
        new_attribute.medal = enum_medal(row[:medal])
      end
    end

    puts "Created #{Team.count} Teams."
    puts "Created #{Competitor.count} Competitors."
    puts "Created #{Sport.count} Sports."
    puts "Created #{CompetitorSport.count} Competitor Sports."
    puts "Created #{Event.count} Events."
    puts "Created #{CompetitorEvent.count} Competitor events."
  end

  def sanitaze_team_name(team_name)
    team_name.split('-')[0]
  end

  def enum_sex(sex)
    sex == 'M' ? 1 : 0
  end

  def enum_medal(medal)
    case medal
    when 'Bronze'
      1
    when 'Silver'
      2
    when 'Gold'
      3
    else
      0
    end
  end
end
