package manaus.market

matchedMoneyline := {
	"id": "2",
	"matchedAmount": 100.0,
	"type": "moneyline",
	"runners": [
		{
			"name": "Banik Ostrava",
			"matchedAmount": 40.0,
		},
		{
			"name": "Sparta Prague",
			"matchedAmount": 60.0,
		},
	],
}

test_runnerMatched {
	runnerMatchedAmount with input as market
	runnerMatchedAmount with input as matchedMoneyline
	bothMatched := {"type": "moneyline", "runners": [{"matchedAmount": 5.0}, {"matchedAmount": 10.0}]}
	runnerMatchedAmount with input as bothMatched
	oneUnmatched := {"type": "moneyline", "runners": [{"matchedAmount": 0.0}, {"matchedAmount": 10.0}]}
	not runnerMatchedAmount with input as oneUnmatched
}

test_denyRunnerMatched {
	unmatched := {"type": "moneyline", "runners": [{"matchedAmount": 0.0}]}
	deny["positive matched amout for all runners required for the type: moneyline"] with input as unmatched
}
