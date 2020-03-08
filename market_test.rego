package manaus.market

test_allowed {
	allow with input as {"type": "mAtch_odds"}
	not allow with input as {"type": "other"}
}
