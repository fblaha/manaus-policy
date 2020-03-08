package manaus.market

test_marketType {
	marketType with input as {"type": "mAtch_odds"}
	marketType with input as {"type": "moneYline"}
	not marketType with input as {"type": "other"}
}
