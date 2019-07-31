# Koroibos

## Challenge Description

> Thank you for taking the time to apply to our Junior Developer position here at Koroibos. Our company is currently working to build a live Olympic Analytics tracker for the 2020 Summer Games. As part of our application, we want to include historical data from the 2016 Summer Olympics. We have provided you a sample of the data [here](./olympic_data_2016.csv). For your technical challenge, we would like to see you use this data to build out some analytical endpoints. We have provided specifications for the endpoints that we are looking for, and would love to see your initiative for any other endpoints you think could provide interesting data analysis. We will meet on Wednesday to discuss your process, decisions, and code quality. Looking forward to our review!


## Built with

- [Elixir 1.91](https://elixir-lang.org/install.html)
- [Phoenix 1.49](https://hexdocs.pm/phoenix/installation.html)

## Setup

Install the latest Elixir and Phoenix versions via the links above.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Populate database with CSV data with `mix run priv/repo/seeds.exs`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit endpoints at [`localhost:4000`](http://localhost:4000) from your browser.

## Testing

Built-in [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html), testing framework shipped with Elixir & Phoenix

  * Run test suite with `mix test`
  * Generate test coverage report from ExCoveralls with `MIX_ENV=test mix coveralls.html`
  * View test coverage report with `open cover/excoveralls.html` 


## [Database Schema](https://dbdiagram.io/d/5d3f59eaced98361d6dd1d07)

<img width="1073" alt="Screen Shot 2019-07-29 at 2 40 03 PM" src="https://user-images.githubusercontent.com/36040194/62081040-09317300-b20f-11e9-8d34-ef85b87ebb10.png">


## Endpoint Specifications

* `GET api/v1/olympians`

```javascript
//Response Format
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```

* `GET api/v1/olympians?age=youngest`

```javascript
//Response Format
{
  [
    {
      "name": "Ana Iulia Dascl",
      "team": "Romania",
      "age": 13,
      "sport": "Swimming"
      "total_medals_won": 0
    }
  ]
}
```

* `GET api/v1/olympians?age=oldest`

```javascript
//Response Format
{
  [
    {
      "name": "Julie Brougham",
      "team": "New Zealand",
      "age": 62,
      "sport": "Equestrianism"
      "total_medals_won": 0
    }
  ]
}
```

* `GET api/v1/olympian_stats`

```javascript
  {
    "olympian_stats": {
      "total_competing_olympians": 3120
      "average_weight:" {
        "unit": "kg",
        "male_olympians": 75.4,
        "female_olympians": 70.2
      }
      "average_age:" 26.2
    }
  }
```

* `GET api/v1/events`

```javascript
//Response Format
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

* `GET api/v1/events/:id/medalists`

_This is sample data and it is incomplete. You may not have all medalists for a particular event._

```javascript
//Response Format
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
