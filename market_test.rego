package manaus.market

test_marketType {
	marketType with input as {"type": "mAtch_odds"}
	marketType with input as {"type": "moneYline"}
	not marketType with input as {"type": "other"}
}

test_lookAhead {
	lookAhead with input as {"event": {"openDate": "2020-03-10T23:08:44.773196400Z"}}
	not lookAhead with input as {"event": {"openDate": "2030-03-10T23:08:44.773196400Z"}}
}
