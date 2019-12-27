# Olympics Stats 

## About

Welcome to Olympics Stats, JSON:API. It expose endpoints about data and statistics from the 2016 Summer Olympic games.

The deployed site's endpoints can be consumed at:

https://olympics-stats.herokuapp.com/

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
