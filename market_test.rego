package manaus.market

test_marketType {
	marketType with input as {"type": "mAtch_odds"}
	marketType with input as {"type": "moneYline"}
	not marketType with input as {"type": "other"}
}

test_lookAhead {
	now := time.parse_rfc3339_ns("2020-03-10T23:00:00.00Z")
	okDate := "2020-03-15T23:00:00.00Z"
	past := "2020-03-05T23:00:00.00Z"
	farFuture := "2020-06-05T23:00:00.00Z"
	_lookAhead with input as {"event": {"openDate": okDate}, "now": now}
	not _lookAhead with input as {"event": {"openDate": past}, "now": now}
	not _lookAhead with input as {"event": {"openDate": farFuture}, "now": now}
}
