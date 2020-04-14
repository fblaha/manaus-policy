package manaus.market

test_lookAhead {
	now := time.parse_rfc3339_ns("2020-03-07T00:00:00.00Z")
	okDate := time.parse_rfc3339_ns("2020-03-10T00:00:00.00Z")
	past := time.parse_rfc3339_ns("2020-03-05T00:00:00.00Z")
	farFuture := time.parse_rfc3339_ns("2020-03-30T00:00:00.00Z")
	_lookAhead with input as {"openDate": okDate, "now": now}
	not _lookAhead with input as {"openDate": past, "now": now}
	not _lookAhead with input as {"openDate": farFuture, "now": now}
}

test_denyOpenDate {
	some msg
	deny[msg] with input as {"event": {"openDate": "2010-03-05T00:00:00.00Z"}}
	startswith(msg, "open date")
}
