Koroibos-API is a take home challenge which creates a RESTful API. Lesson can be seen [here](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module4/projects/take_home_challenge/prompts/olympic_spec.md)

[Production link](https://logan-pile-koroibos-api.herokuapp.com/)

Table of Contents
=================

##### [Olympian Endpoints](#olympian-endpoints)
  * [Get all olympians](#get-all-olympians)
  * [Get youngest olympian](#get-youngest-olympian)
  * [Get oldest olympian](#get-oldest-olympian)
  * [Get all olympians stats](#get-all-olympians-stats)

##### [Event Endpoints](#event-endpoints)
  * [Get all events](#get-all-events)
  * [Get medalists for event](#get-medalists-for-events)

##### [Local Installation](#local-installation)
  * [Requirements](#requirements)
  * [Clone](#clone)
  * [Setup Database](#setup-database)


Olympian Endpoints
==================
Get all olympians
-----------------
Request
```
GET https://logan-pile-koroibos-api.herokuapp.com/api/v1/olympians
```
Response
```
{
  "olympians": [
    {
      "name": "Andreea Aanei",
      "team": "Romania",
      "age": 22,
      "sport": "Weightlifting",
      "total_medals_won": 0
    },
    {
      "name": "Nstor Abad Sanjun",
      "team": "Spain",
      "age": 23,
      "sport": "Gymnastics",
      "total_medals_won": 0
    },
    {...}
  ]
}
```

Get youngest olympian
-----------------
Request
```
GET https://logan-pile-koroibos-api.herokuapp.com/api/v1/olympians?age=youngest
```
Response
```
[
  {
    "name": "Ana Iulia Dascl",
    "team": "Romania",
    "age": "13",
    "sport": "Swimming",
    "total_medals_won": 0
  }
]
```

Get oldest olympian
-----------------
Request
```
GET https://logan-pile-koroibos-api.herokuapp.com/api/v1/olympians?age=oldest
```
Response
```
[
  {
    "name": "Julie Brougham",
    "team": "New Zealand",
    "age": "62",
    "sport": "Equestrianism",
    "total_medals_won": 0
  }
]
```

Get all olympians stats
-----------------
Request
```
GET https://logan-pile-koroibos-api.herokuapp.com/api/v1/olympian_stats
```
Response
```
{
  "olympian_stats": {
    "total_competing_olympians": 2856,
    "average_weight": {
      "unit": "kg",
      "male_olympians": 77.9,
      "female_olympians": 61.4
    },
    "average_age": 26.4
  }
}
```

Event Endpoints
===============
Get all events
--------------
Request
```
GET https://logan-pile-koroibos-api.herokuapp.com/api/v1/events
```
Response
```
{
  "events": [
    {
      "sport": "Basketball",
      "events": [
        "Basketball Men's Basketball",
        "Basketball Women's Basketball"
      ]
    },
    {
      "sport": "Beach Volleyball",
      "events": [
        "Beach Volleyball Men's Beach Volleyball",
        "Beach Volleyball Women's Beach Volleyball"
      ]
    },
    {...}
  ]
}
```

Get medalists for event
--------------
Request
```
GET https://logan-pile-koroibos-api.herokuapp.com/api/v1/events/{EVENT_ID}/medalists
```
Response
```
{
  "event": "Equestrianism Mixed Three-Day Event, Team",
  "medalists": [
    {
      "name": "Sandra Auffarth",
      "team": "Germany",
      "age": 29,
      "medal": "Silver"
    },
    {
      "name": "Christopher Burton",
      "team": "Australia",
      "age": 34,
      "medal": "Bronze"
    }
  ]
}
```

Local Installation
==================
Requirements
------------
* [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby Version
* [Rails 5.2.3](https://rubyonrails.org/) - Rails Version

Clone
-----
```
$ git clone https://github.com/lpile/koroibos-api.git
$ cd koroibos-api
$ bundle install
```

Setup Database
--------------
```
$ rails db:{create,migrate}
$ rake import:data
```
**Note: The rake task will take awhile to load data into database**
