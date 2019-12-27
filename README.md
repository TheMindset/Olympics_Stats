# Olympics Stats 

## About

Welcome to Olympics Stats, JSON:API. It expose endpoints about data and statistics from the 2016 Summer Olympic games.

The deployed site's endpoints can be consumed at:

https://olympics-stats.herokuapp.com/

## Schema

[Olympics_stats schema](/public/images/olympics_stats_schema.png)

## Endpoints

### GET /api/v1/competitors

Returns a list of all Competitors in the database, with their name, age, team, sports and the total medals won.

#### Example of expected response:

```json
{
    "data": [
        {
            "id": "1",
            "type": "competitor",
            "attributes": {
                "id": 1,
                "age": 22,
                "name": "Andreea Aanei",
                "sports": [
                    {
                        "id": 1,
                        "name": "Weightlifting",
                        "created_at": "2019-12-22T09:52:09.490Z",
                        "updated_at": "2019-12-22T09:52:09.490Z"
                    }
                ],
                "team": {
                    "id": 1,
                    "name": "Romania",
                    "created_at": "2019-12-22T09:52:09.265Z",
                    "updated_at": "2019-12-22T09:52:09.265Z"
                },
                "total_medal_count": 0
            }
        },
        {
            "id": "2",
            "type": "competitor",
            "attributes": {
                "id": 2,
                "age": 23,
                "name": "Nstor Abad Sanjun",
                "sports": [
                    {
                        "id": 2,
                        "name": "Gymnastics",
                        "created_at": "2019-12-22T10:52:43.015Z",
                        "updated_at": "2019-12-22T10:52:43.015Z"
                    }
                ],
                "team": {
                    "id": 2,
                    "name": "Spain",
                    "created_at": "2019-12-22T10:52:42.978Z",
                    "updated_at": "2019-12-22T10:52:42.978Z"
                },
                "total_medal_count": 0
            }
        }
  ]
}
```
Also accepts the query param `age`. `/api/v1/competitors?age=youngest` will return the youngest Competitor and `/api/v1/competitors?age=youngest` will return the oldest Competitor.

#### Example of expected response:

```json
{
    "data": {
        "id": "2190",
        "type": "competitor",
        "attributes": {
            "id": 2190,
            "age": 13,
            "name": "Ana Iulia Dascl",
            "sports": [
                {
                    "id": 18,
                    "name": "Swimming",
                    "created_at": "2019-12-22T10:52:46.058Z",
                    "updated_at": "2019-12-22T10:52:46.058Z"
                }
            ],
            "team": {
                "id": 1,
                "name": "Romania",
                "created_at": "2019-12-22T09:52:09.265Z",
                "updated_at": "2019-12-22T09:52:09.265Z"
            },
            "total_medal_count": 0
        }
    }
}
```
### GET `/api/v1/competitors_stats`

Returns statistcs for all competitors (total Olympics competitors, avarage age, weight and height).

#### Example of expected response:

```json
{
    "data": {
        "id": null,
        "type": "competitors_stats",
        "attributes": {
            "total_competitors": 2850,
            "average_age": 26,
            "average_height": {
                "unit": "cm",
                "female_competitors": 167,
                "male_competitors": 179
            },
            "average_weight": {
                "unit": "kg",
                "female_competitors": 61,
                "male_competitors": 77
            }
        }
    }
}
```

### GET `/api/v1/events`

Returns a list of all events for each Sport.

#### Example of expected response:

```json
{
    "data": [
        {
            "id": "3",
            "type": "sports",
            "attributes": {
                "name": "Athletics",
                "events": [
                    "Athletics Men's 5,000 metres",
                    "Athletics Men's 400 metres",
                    "Athletics Men's 10,000 metres",
                    "Athletics Women's 200 metres",
                    "Athletics Men's Decathlon",
                    "Athletics Men's Marathon",
                    "Athletics Women's Shot Put",
                    "Athletics Women's 400 metres",
                    "Athletics Men's Shot Put",
                    "Athletics Women's Marathon",
                    "Athletics Men's 100 metres",
                    "Athletics Women's 100 metres",
                    "Athletics Women's 4 x 100 metres Relay",
                    "Athletics Men's 200 metres",
                    "Athletics Men's 4 x 100 metres Relay",
                    "Athletics Men's High Jump",
                    "Athletics Men's Triple Jump",
                    "Athletics Women's Heptathlon",
                    "Athletics Women's Javelin Throw",
                    "Athletics Women's Pole Vault",
                    "Athletics Women's 20 kilometres Walk",
                    "Athletics Women's 3,000 metres Steeplechase",
                    "Athletics Men's 3,000 metres Steeplechase",
                    "Athletics Women's 800 metres",
                    "Athletics Women's 1,500 metres",
                    "Athletics Men's Discus Throw",
                    "Athletics Men's 1,500 metres",
                    "Athletics Men's 400 metres Hurdles",
                    "Athletics Women's Long Jump",
                    "Athletics Men's 110 metres Hurdles",
                    "Athletics Women's 100 metres Hurdles",
                    "Athletics Women's 5,000 metres",
                    "Athletics Men's 4 x 400 metres Relay",
                    "Athletics Men's Long Jump",
                    "Athletics Men's 800 metres",
                    "Athletics Women's High Jump",
                    "Athletics Men's Javelin Throw",
                    "Athletics Women's 4 x 400 metres Relay",
                    "Athletics Women's 400 metres Hurdles",
                    "Athletics Women's Discus Throw",
                    "Athletics Men's Hammer Throw",
                    "Athletics Women's 10,000 metres",
                    "Athletics Men's 50 kilometres Walk",
                    "Athletics Men's 20 kilometres Walk",
                    "Athletics Men's Pole Vault",
                    "Athletics Women's Triple Jump",
                    "Athletics Women's Hammer Throw"
                ]
            }
        }
    ]
}
```
### GET `/api/v1/medalists`

Returns a list of all medalists by event

#### Example of expected response

```json
{
    "data": {
        "id": null,
        "type": "events",
        "attributes": {
            "event_medalists": [
                {
                    "event_name": "Taekwondo Women's Flyweight",
                    "medalists": [
                        {
                            "name": "Patimat Abakarova",
                            "age": 21,
                            "team": "Azerbaijan",
                            "medal": "Bronze"
                        },
                        {
                            "name": "Tijana Bogdanovi",
                            "age": 18,
                            "team": "Serbia",
                            "medal": "Silver"
                        }
                    ]
                }
            ]
        }
    }
}
```

### GET `/api/v1/medal_count`

Returns a list of teams with the total medal won

#### Example of expected response

```json
{
    "data": {
        "id": null,
        "type": "teams",
        "attributes": {
            "medals_by_team": [
                {
                    "team": "Romania",
                    "total_medal_count": 7,
                    "medals": {
                        "bronze": 5,
                        "silver": 0,
                        "gold": 2
                    }
                }
            ]
        }
    }
}
```

### GET `/api/v1/event_participation`

Returns a list of teams with the total event participation

#### Example of expected response

```json
{
    "data": {
        "id": null,
        "type": "team_participation",
        "attributes": {
            "participations_by_team": [
                {
                    "team": "Romania",
                    "event_participation": "29 of 305 events",
                    "events": [
                        "Weightlifting Women's Super-Heavyweight",
                        "Rowing Men's Coxless Fours",
                        "Wrestling Men's Heavyweight, Greco-Roman",
                        "Athletics Women's 20 kilometres Walk",
                        "Handball Women's Handball",
                        "Tennis Women's Singles",
                        "Tennis Mixed Doubles",
                        "Tennis Women's Doubles",
                        "Rowing Women's Lightweight Double Sculls",
                        "Rowing Women's Coxless Pairs",
                        "Rowing Women's Coxed Eights",
                        "Athletics Women's 800 metres",
                        "Athletics Women's 3,000 metres Steeplechase",
                        "Fencing Women's epee, Individual",
                        "Fencing Women's epee, Team",
                        "Athletics Women's Triple Jump",
                        "Fencing Women's Foil, Individual",
                        "Judo Women's Lightweight",
                        "Weightlifting Men's Middleweight",
                        "Judo Women's Half-Lightweight",
                        "Athletics Women's Marathon",
                        "Athletics Men's 50 kilometres Walk",
                        "Swimming Men's 4 x 100 metres Freestyle Relay",
                        "Table Tennis Men's Singles",
                        "Swimming Women's 100 metres Freestyle",
                        "Fencing Men's Sabre, Individual",
                        "Gymnastics Men's Floor Exercise",
                        "Gymnastics Men's Horse Vault",
                        "Gymnastics Men's Horizontal Bar"
                    ]
                },
                {
                    "team": "Spain",
                    "event_participation": "87 of 305 events",
                    "events": [
                        "Gymnastics Men's Individual All-Around",
                        "Gymnastics Men's Floor Exercise",
                        "Gymnastics Men's Parallel Bars",
                        "Gymnastics Men's Horizontal Bar",
                        "Gymnastics Men's Rings",
                        "Gymnastics Men's Pommelled Horse",
                        "Athletics Men's 5,000 metres",
                        "Badminton Men's Singles",
                        "Basketball Men's Basketball",
                        "Athletics Women's Marathon",
                        "Water Polo Men's Water Polo",
                        "Handball Women's Handball",
                        "Rhythmic Gymnastics Women's Group",
                        "Sailing Women's Windsurfer",
                        "Triathlon Men's Olympic Distance",
                        "Swimming Men's 4 x 100 metres Freestyle Relay",
                        "Hockey Men's Hockey",
                        "Equestrianism Mixed Jumping, Individual",
                        "Equestrianism Mixed Jumping, Team",
                        "Archery Men's Individual",
                        "Archery Men's Team",
                        "Athletics Men's 800 metres",
                        "Athletics Men's 20 kilometres Walk",
                        "Swimming Men's 1,500 metres Freestyle",
                        "Athletics Women's Discus Throw",
                        "Water Polo Women's Water Polo",
                        "Beach Volleyball Women's Beach Volleyball",
                        "Tennis Men's Singles",
                        "Tennis Men's Doubles",
                        "Athletics Women's High Jump",
                        "Swimming Women's 400 metres Freestyle",
                        "Swimming Women's 800 metres Freestyle",
                        "Swimming Women's 200 metres Butterfly",
                        "Swimming Women's 200 metres Individual Medley",
                        "Swimming Women's 400 metres Individual Medley",
                        "Canoeing Men's Canadian Singles, 200 metres",
                        "Judo Women's Middleweight",
                        "Sailing Women's Skiff",
                        "Sailing Men's One Person Dinghy",
                        "Rowing Women's Coxless Pairs",
                        "Athletics Women's 400 metres",
                        "Hockey Women's Hockey",
                        "Sailing Men's Skiff",
                        "Weightlifting Men's Bantamweight",
                        "Rugby Sevens Women's Rugby Sevens",
                        "Athletics Men's 1,500 metres",
                        "Golf Men's Individual",
                        "Taekwondo Women's Featherweight",
                        "Cycling Women's Sprint",
                        "Cycling Women's Keirin",
                        "Cycling Women's Team Sprint",
                        "Synchronized Swimming Women's Duet",
                        "Boxing Men's Light-Flyweight",
                        "Canoeing Men's Kayak Fours, 1,000 metres",
                        "Shooting Men's Air Pistol, 10 metres",
                        "Shooting Men's Free Pistol, 50 metres",
                        "Rugby Sevens Men's Rugby Sevens",
                        "Athletics Men's 3,000 metres Steeplechase",
                        "Athletics Men's Discus Throw",
                        "Triathlon Women's Olympic Distance",
                        "Equestrianism Mixed Dressage, Individual",
                        "Equestrianism Mixed Dressage, Team",
                        "Athletics Men's Marathon",
                        "Swimming Women's 200 metres Freestyle",
                        "Swimming Women's 4 x 100 metres Freestyle Relay",
                        "Swimming Women's 4 x 200 metres Freestyle Relay",
                        "Cycling Men's Road Race, Individual",
                        "Cycling Men's Individual Time Trial",
                        "Sailing Women's One Person Dinghy",
                        "Canoeing Women's Kayak Singles, Slalom",
                        "Athletics Men's Hammer Throw",
                        "Golf Women's Individual",
                        "Cycling Men's Mountainbike, Cross-Country",
                        "Athletics Men's 110 metres Hurdles",
                        "Sailing Women's Two Person Dinghy",
                        "Canoeing Men's Kayak Singles, 200 metres",
                        "Canoeing Men's Kayak Doubles, 200 metres",
                        "Basketball Women's Basketball",
                        "Swimming Women's 100 metres Backstroke",
                        "Swimming Women's 200 metres Backstroke",
                        "Shooting Men's Air Rifle, 10 metres",
                        "Athletics Men's 50 kilometres Walk",
                        "Swimming Men's 400 metres Freestyle",
                        "Swimming Men's 4 x 200 metres Freestyle Relay",
                        "Table Tennis Women's Singles",
                        "Sailing Mixed Multihull",
                        "Canoeing Men's Canadian Singles, Slalom"
                    ]
                }
            ]
        }
    }
}
```

## Get Started

### Requirements

* [Ruby 2.6.3](https://www.ruby-lang.org/en/downloads/) - Ruby Version
* [Rails 5.2.3](https://rubyonrails.org/) - Rails Version

```
$ git clone git@github.com:TheMindset/Olympics_Stats.git
$ cd Olympics_stats
$ bundle install
```

### Setup Database

* Install [PostgresQL](https://www.postgresql.org/download/)
Run this commands:

```
$ rails db:create db:migrate
$ rake import_olympic_data:persit_data_in_db  

```


### API Exploration

Once installation and database setup are complete, explore the various API endpoints with the following steps:
* `$ rails s`
* Open your browser, and visit `http://localhost:3000/`
* In a separate terminal window, query the available endpoints by running `rails routes`
* Copy any of the URIs displayed and append to `http://localhost:3000/` in your browser

### Running Tests

`$ rails rspec`.
