package manaus.market

test_runnerName {
	runnerName with input as market
}

test_denyRunnerName {
	deny["missing at least one of the runners: draw"] with input as {"type": "match_odds", "matchedAmount": 10.0, "runners": [{"name": "Sparta"}]}
	errors := deny with input as {"type": "three_way", "matchedAmount": 10.0, "runners": [{"name": "Sparta"}]}
	count(errors) == 0
}
