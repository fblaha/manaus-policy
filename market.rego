package manaus.market

allowedMarketTypes := ["match_odds", "three_way", "rt_match_odds", "moneyline"]

default marketType = false

marketType {
	lower(input.type) == allowedMarketTypes[_]
}

lookAheadPer := time.parse_duration_ns("336h") # 14 days

_lookAhead {
	maxFuture := input.now + lookAheadPer
	openDate := time.parse_rfc3339_ns(input.event.openDate)
	openDate <= maxFuture
	openDate > input.now
}

default lookAhead = false

lookAhead {
	_lookAhead with input.now as time.now_ns()
}

default allow = false

allow {
	marketType
	lookAhead
}
