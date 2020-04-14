package manaus.market

market := {
	"id": "2",
	"name": "Match Odds",
	"matchedAmount": 100,
	"inPlay": true,
	"type": "match_odds",
	"eventType": {
		"id": "1000",
		"name": "soccer",
	},
	"competition": {
		"id": "100",
		"name": "Czech League",
	},
	"event": {
		"id": "100",
		"name": "Banik Ostrava vs Sparta Prague",
		"countryCode": "cz",
		"timezone": "CET",
		"venue": "bazaly",
		"openDate": "2020-03-10T23:08:44.773196400Z",
	},
	"runners": [
		{
			"selectionId": 100,
			"name": "Banik Ostrava",
			"handicap": 0,
			"sortPriority": 0,
		},
		{
			"selectionId": 200,
			"name": "Sparta Prague",
			"handicap": 0,
			"sortPriority": 1,
		},
		{
			"selectionId": 300,
			"name": "The Draw",
			"handicap": 0,
			"sortPriority": 2,
		},
	],
}

test_marketType {
	marketType with input as {"type": "mAtch_odds"}
	marketType with input as {"type": "moneYline"}
	not marketType with input as {"type": "other"}
}

test_denyMarketType {
	deny["unsupported market type: unsupported_type"] with input as {"type": "unsupported_type"}
}

test_deny {
	errors := deny with input as market
	count(errors) == 1 # open date
}
