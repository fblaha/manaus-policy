package manaus.market

test_runnerName {
	runnerName with input as market
}

test_denyRunnerName {
	deny["missing at least one of the runners: draw"] with input as {"type": "match_odds", "runners": [{"name": "Sparta"}]}
	errors := deny with input as {"type": "three_way", "runners": [{"name": "Sparta"}]}
	count(errors) == 0
}