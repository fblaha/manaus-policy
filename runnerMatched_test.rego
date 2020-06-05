package manaus.market

matchedMoneyline := {
	"id": "2",
	"matchedAmount": 100.0,
	"type": "moneyline",
	"prices": [
		{"matchedAmount": 40.0},
		{"matchedAmount": 60.0},
	],
}

test_runnerMatched {
	runnerMatchedAmount with input as matchedMoneyline
	bothMatched := {"type": "moneyline", "prices": [{"matchedAmount": 5.0}, {"matchedAmount": 10.0}]}
	runnerMatchedAmount with input as bothMatched
	oneUnmatched := {"type": "moneyline", "prices": [{"matchedAmount": 0.0}, {"matchedAmount": 10.0}]}
	not runnerMatchedAmount with input as oneUnmatched
}

test_denyRunnerMatched {
	unmatched := {"type": "moneyline", "prices": [{"matchedAmount": 0.0}]}
	deny["positive matched amout for all runners required for the type: moneyline"] with input as unmatched
}
