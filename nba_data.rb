# // 20190212100907
# // https://api.the-odds-api.com/v3/odds?sport=basketball_nba&region=uk&mkt=h2h&apiKey=57c0bfae95b7cb8dc7b24729437c70f3

require 'pry'



NBA_data = {
  "success": true,
  "data": [
    {
      "sport_key": "basketball_nba",
      "sport_nice": "NBA",
      "teams": [
        "Atlanta Hawks",
        "Los Angeles Lakers"
      ],
      "commence_time": 1550018400,
      "home_team": "Atlanta Hawks",
      "sites": [
        {
          "site_key": "williamhill",
          "site_nice": "William Hill",
          "last_update": 1549983827,
          "odds": {
            "h2h": [
              2.7,
              1.5
            ]
          }
        },
        {
          "site_key": "paddypower",
          "site_nice": "Paddy Power",
          "last_update": 1549983893,
          "odds": {
            "h2h": [
              2.9,
              1.43
            ]
          }
        },
        {
          "site_key": "betvictor",
          "site_nice": "Bet Victor",
          "last_update": 1549983897,
          "odds": {
            "h2h": [
              2.63,
              1.5
            ]
          }
        },
        {
          "site_key": "betfred",
          "site_nice": "Betfred",
          "last_update": 1549983900,
          "odds": {
            "h2h": [
              2.63,
              1.5
            ]
          }
        },
        {
          "site_key": "ladbrokes",
          "site_nice": "Ladbrokes",
          "last_update": 1549984096,
          "odds": {
            "h2h": [
              2.75,
              1.48
            ]
          }
        },
        {
          "site_key": "nordicbet",
          "site_nice": "Nordic Bet",
          "last_update": 1549983769,
          "odds": {
            "h2h": [
              2.65,
              1.48
            ]
          }
        },
        {
          "site_key": "onexbet",
          "site_nice": "1xBet",
          "last_update": 1549983764,
          "odds": {
            "h2h": [
              2.83,
              1.57,
              17
            ]
          }
        },
        {
          "site_key": "bet365",
          "site_nice": "Bet365",
          "last_update": 1549983918,
          "odds": {
            "h2h": [
              2.75,
              1.47
            ]
          }
        },
        {
          "site_key": "betfair",
          "site_nice": "Betfair",
          "last_update": 1549984123,
          "odds": {
            "h2h": [
              2.86,
              1.52
            ]
          }
        },
        {
          "site_key": "marathonbet",
          "site_nice": "Marathon Bet",
          "last_update": 1549984134,
          "odds": {
            "h2h": [
              2.72,
              1.52
            ]
          }
        },
        {
          "site_key": "unibet",
          "site_nice": "Unibet",
          "last_update": 1549984077,
          "odds": {
            "h2h": [
              2.7,
              1.49
            ]
          }
        },
        {
          "site_key": "sport888",
          "site_nice": "888sport",
          "last_update": 1549983777,
          "odds": {
            "h2h": [
              2.7,
              1.49
            ]
          }
        },
        {
          "site_key": "matchbook",
          "site_nice": "Matchbook",
          "last_update": 1549984047,
          "odds": {
            "h2h": [
              2.85,
              1.53
            ]
          }
        }
      ],
      "sites_count": 13
    },
    {
      "sport_key": "basketball_nba",
      "sport_nice": "NBA",
      "teams": [
        "New Orleans Pelicans",
        "Orlando Magic"
      ],
      "commence_time": 1550020200,
      "home_team": "New Orleans Pelicans",
      "sites": [
        {
          "site_key": "williamhill",
          "site_nice": "William Hill",
          "last_update": 1549983827,
          "odds": {
            "h2h": [
              1.53,
              2.6
            ]
          }
        },
        {
          "site_key": "paddypower",
          "site_nice": "Paddy Power",
          "last_update": 1549983893,
          "odds": {
            "h2h": [
              1.53,
              2.6
            ]
          }
        },
        {
          "site_key": "betvictor",
          "site_nice": "Bet Victor",
          "last_update": 1549983897,
          "odds": {
            "h2h": [
              1.53,
              2.55
            ]
          }
        },
        {
          "site_key": "betfred",
          "site_nice": "Betfred",
          "last_update": 1549983900,
          "odds": {
            "h2h": [
              1.5,
              2.63
            ]
          }
        },
        {
          "site_key": "ladbrokes",
          "site_nice": "Ladbrokes",
          "last_update": 1549984096,
          "odds": {
            "h2h": [
              1.53,
              2.65
            ]
          }
        },
        {
          "site_key": "nordicbet",
          "site_nice": "Nordic Bet",
          "last_update": 1549983769,
          "odds": {
            "h2h": [
              1.51,
              2.55
            ]
          }
        },
        {
          "site_key": "onexbet",
          "site_nice": "1xBet",
          "last_update": 1549983764,
          "odds": {
            "h2h": [
              1.62,
              2.77,
              16
            ]
          }
        },
        {
          "site_key": "bet365",
          "site_nice": "Bet365",
          "last_update": 1549983918,
          "odds": {
            "h2h": [
              1.5,
              2.7
            ]
          }
        },
        {
          "site_key": "betfair",
          "site_nice": "Betfair",
          "last_update": 1549984123,
          "odds": {
            "h2h": [
              1.57,
              2.64
            ]
          }
        },
        {
          "site_key": "marathonbet",
          "site_nice": "Marathon Bet",
          "last_update": 1549984134,
          "odds": {
            "h2h": [
              1.55,
              2.63
            ]
          }
        },
        {
          "site_key": "unibet",
          "site_nice": "Unibet",
          "last_update": 1549984077,
          "odds": {
            "h2h": [
              1.57,
              2.48
            ]
          }
        },
        {
          "site_key": "sport888",
          "site_nice": "888sport",
          "last_update": 1549983777,
          "odds": {
            "h2h": [
              1.57,
              2.45
            ]
          }
        },
        {
          "site_key": "matchbook",
          "site_nice": "Matchbook",
          "last_update": 1549984047,
          "odds": {
            "h2h": [
              1.56,
              2.71
            ]
          }
        }
      ],
      "sites_count": 13
    },
    {
      "sport_key": "basketball_nba",
      "sport_nice": "NBA",
      "teams": [
        "Boston Celtics",
        "Philadelphia 76ers"
      ],
      "commence_time": 1550020200,
      "home_team": "Philadelphia 76ers",
      "sites": [
        {
          "site_key": "williamhill",
          "site_nice": "William Hill",
          "last_update": 1549983827,
          "odds": {
            "h2h": [
              3.2,
              1.36
            ]
          }
        },
        {
          "site_key": "paddypower",
          "site_nice": "Paddy Power",
          "last_update": 1549983893,
          "odds": {
            "h2h": [
              3.3,
              1.36
            ]
          }
        },
        {
          "site_key": "betvictor",
          "site_nice": "Bet Victor",
          "last_update": 1549983897,
          "odds": {
            "h2h": [
              3.2,
              1.36
            ]
          }
        },
        {
          "site_key": "betfred",
          "site_nice": "Betfred",
          "last_update": 1549983900,
          "odds": {
            "h2h": [
              3.1,
              1.38
            ]
          }
        },
        {
          "site_key": "ladbrokes",
          "site_nice": "Ladbrokes",
          "last_update": 1549984096,
          "odds": {
            "h2h": [
              3.2,
              1.38
            ]
          }
        },
        {
          "site_key": "nordicbet",
          "site_nice": "Nordic Bet",
          "last_update": 1549983769,
          "odds": {
            "h2h": [
              3.1,
              1.38
            ]
          }
        },
        {
          "site_key": "onexbet",
          "site_nice": "1xBet",
          "last_update": 1549983764,
          "odds": {
            "h2h": [
              3.44,
              1.45,
              16
            ]
          }
        },
        {
          "site_key": "bet365",
          "site_nice": "Bet365",
          "last_update": 1549983918,
          "odds": {
            "h2h": [
              3.1,
              1.4
            ]
          }
        },
        {
          "site_key": "betfair",
          "site_nice": "Betfair",
          "last_update": 1549984123,
          "odds": {
            "h2h": [
              3.35,
              1.42
            ]
          }
        },
        {
          "site_key": "marathonbet",
          "site_nice": "Marathon Bet",
          "last_update": 1549984134,
          "odds": {
            "h2h": [
              3.22,
              1.4
            ]
          }
        },
        {
          "site_key": "unibet",
          "site_nice": "Unibet",
          "last_update": 1549984077,
          "odds": {
            "h2h": [
              3.15,
              1.38
            ]
          }
        },
        {
          "site_key": "sport888",
          "site_nice": "888sport",
          "last_update": 1549983777,
          "odds": {
            "h2h": [
              3.15,
              1.38
            ]
          }
        },
        {
          "site_key": "matchbook",
          "site_nice": "Matchbook",
          "last_update": 1549984047,
          "odds": {
            "h2h": [
              3.36,
              1.4
            ]
          }
        }
      ],
      "sites_count": 13
    },
    {
      "sport_key": "basketball_nba",
      "sport_nice": "NBA",
      "teams": [
        "Memphis Grizzlies",
        "San Antonio Spurs"
      ],
      "commence_time": 1550020200,
      "home_team": "Memphis Grizzlies",
      "sites": [
        {
          "site_key": "williamhill",
          "site_nice": "William Hill",
          "last_update": 1549983827,
          "odds": {
            "h2h": [
              2.45,
              1.6
            ]
          }
        },
        {
          "site_key": "paddypower",
          "site_nice": "Paddy Power",
          "last_update": 1549983893,
          "odds": {
            "h2h": [
              2.47,
              1.57
            ]
          }
        },
        {
          "site_key": "betvictor",
          "site_nice": "Bet Victor",
          "last_update": 1549983897,
          "odds": {
            "h2h": [
              2.45,
              1.57
            ]
          }
        },
        {
          "site_key": "betfred",
          "site_nice": "Betfred",
          "last_update": 1549983900,
          "odds": {
            "h2h": [
              2.4,
              1.57
            ]
          }
        },
        {
          "site_key": "ladbrokes",
          "site_nice": "Ladbrokes",
          "last_update": 1549984096,
          "odds": {
            "h2h": [
              2.5,
              1.59
            ]
          }
        },
        {
          "site_key": "nordicbet",
          "site_nice": "Nordic Bet",
          "last_update": 1549983769,
          "odds": {
            "h2h": [
              2.4,
              1.58
            ]
          }
        },
        {
          "site_key": "onexbet",
          "site_nice": "1xBet",
          "last_update": 1549983764,
          "odds": {
            "h2h": [
              2.7,
              1.65,
              15
            ]
          }
        },
        {
          "site_key": "bet365",
          "site_nice": "Bet365",
          "last_update": 1549983918,
          "odds": {
            "h2h": [
              2.45,
              1.6
            ]
          }
        },
        {
          "site_key": "betfair",
          "site_nice": "Betfair",
          "last_update": 1549984123,
          "odds": {
            "h2h": [
              2.5,
              1.64
            ]
          }
        },
        {
          "site_key": "marathonbet",
          "site_nice": "Marathon Bet",
          "last_update": 1549984134,
          "odds": {
            "h2h": [
              2.54,
              1.58
            ]
          }
        },
        {
          "site_key": "unibet",
          "site_nice": "Unibet",
          "last_update": 1549984077,
          "odds": {
            "h2h": [
              2.43,
              1.6
            ]
          }
        },
        {
          "site_key": "sport888",
          "site_nice": "888sport",
          "last_update": 1549983777,
          "odds": {
            "h2h": [
              2.4,
              1.6
            ]
          }
        },
        {
          "site_key": "matchbook",
          "site_nice": "Matchbook",
          "last_update": 1549984047,
          "odds": {
            "h2h": [
              2.51,
              1.62
            ]
          }
        }
      ],
      "sites_count": 13
    },
    {
      "sport_key": "basketball_nba",
      "sport_nice": "NBA",
      "teams": [
        "Golden State Warriors",
        "Utah Jazz"
      ],
      "commence_time": 1550029200,
      "home_team": "Golden State Warriors",
      "sites": [
        {
          "site_key": "williamhill",
          "site_nice": "William Hill",
          "last_update": 1549983827,
          "odds": {
            "h2h": [
              1.22,
              4.5
            ]
          }
        },
        {
          "site_key": "paddypower",
          "site_nice": "Paddy Power",
          "last_update": 1549983893,
          "odds": {
            "h2h": [
              1.22,
              4.1
            ]
          }
        },
        {
          "site_key": "betvictor",
          "site_nice": "Bet Victor",
          "last_update": 1549983897,
          "odds": {
            "h2h": [
              1.22,
              4.5
            ]
          }
        },
        {
          "site_key": "betfred",
          "site_nice": "Betfred",
          "last_update": 1549983900,
          "odds": {
            "h2h": [
              1.22,
              4.33
            ]
          }
        },
        {
          "site_key": "ladbrokes",
          "site_nice": "Ladbrokes",
          "last_update": 1549984096,
          "odds": {
            "h2h": [
              1.22,
              4.33
            ]
          }
        },
        {
          "site_key": "nordicbet",
          "site_nice": "Nordic Bet",
          "last_update": 1549983769,
          "odds": {
            "h2h": [
              1.22,
              4.35
            ]
          }
        },
        {
          "site_key": "onexbet",
          "site_nice": "1xBet",
          "last_update": 1549983764,
          "odds": {
            "h2h": [
              1.25,
              4.9,
              18
            ]
          }
        },
        {
          "site_key": "bet365",
          "site_nice": "Bet365",
          "last_update": 1549983918,
          "odds": {
            "h2h": [
              1.22,
              4.5
            ]
          }
        },
        {
          "site_key": "betfair",
          "site_nice": "Betfair",
          "last_update": 1549984123,
          "odds": {
            "h2h": [
              1.25,
              4.8
            ]
          }
        },
        {
          "site_key": "marathonbet",
          "site_nice": "Marathon Bet",
          "last_update": 1549984134,
          "odds": {
            "h2h": [
              1.24,
              4.55
            ]
          }
        },
        {
          "site_key": "sport888",
          "site_nice": "888sport",
          "last_update": 1549983777,
          "odds": {
            "h2h": [
              1.23,
              4.35
            ]
          }
        },
        {
          "site_key": "unibet",
          "site_nice": "Unibet",
          "last_update": 1549984077,
          "odds": {
            "h2h": [
              1.23,
              4.35
            ]
          }
        },
        {
          "site_key": "matchbook",
          "site_nice": "Matchbook",
          "last_update": 1549984047,
          "odds": {
            "h2h": [
              1.25,
              4.8
            ]
          }
        }
      ],
      "sites_count": 13
    },
    {
      "sport_key": "basketball_nba",
      "sport_nice": "NBA",
      "teams": [
        "Team USA",
        "Team World"
      ],
      "commence_time": 1550282400,
      "home_team": "Team USA",
      "sites": [
        {
          "site_key": "unibet",
          "site_nice": "Unibet",
          "last_update": 1549984077,
          "odds": {
            "h2h": [
              1.43,
              2.9
            ]
          }
        },
        {
          "site_key": "sport888",
          "site_nice": "888sport",
          "last_update": 1549983777,
          "odds": {
            "h2h": [
              1.43,
              2.9
            ]
          }
        }
      ],
      "sites_count": 2
    }
  ]
}

NBA_data[:data].each do |game_data|
  Game.find_or_create_by(team1: game_data["teams"][0], sport_key: "basketball_nba")
  Game.find_or_create_by(team: game_data["teams"][1], sport_key: "basketball_nba")
  game_data[:sites].each do |site_data|
    Website.find_or_create_by(name: site_data[:site_nice])
  end
end
