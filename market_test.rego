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

test_lookAhead {
	now := time.parse_rfc3339_ns("2020-03-07T00:00:00.00Z")
	okDate := time.parse_rfc3339_ns("2020-03-10T00:00:00.00Z")
	past := time.parse_rfc3339_ns("2020-03-05T00:00:00.00Z")
	farFuture := time.parse_rfc3339_ns("2020-03-30T00:00:00.00Z")
	_lookAhead with input as {"openDate": okDate, "now": now}
	not _lookAhead with input as {"openDate": past, "now": now}
	not _lookAhead with input as {"openDate": farFuture, "now": now}
}

test_runnerName {
	runnerName with input as market
}

test_matchedAmount {
	matchedAmount with input as {"matchedAmount": 100}
	not matchedAmount with input as {}
	not matchedAmount with input as {"matchedAmount": 0}
}

test_denyMarketType {
	deny["unsupported market type: unsupported_type"] with input as {"type": "unsupported_type"}
}

test_denyOpenDate {
	some msg
	deny[msg] with input as {"event": {"openDate": "2010-03-05T00:00:00.00Z"}}
	startswith(msg, "open date")
}

test_denyRunnerName {
	deny["missing runner: draw"] with input as {"runners": [{"name": "Sparta"}]}
}
