package manaus.market

allowedMarketTypes := ["match_odds", "three_way", "rt_match_odds", "moneyline"]

default marketType = false

marketType {
	lowerType := lower(input.type)
	allowedMarketTypes[_] == lowerType
}

lookAheadPer := time.parse_duration_ns("336h") # 14 days

lookAhead {
	maxFuture := time.now_ns() + lookAheadPer
	openDate := time.parse_rfc3339_ns(input.event.openDate)
	openDate <= maxFuture
}

default allow = false

allow {
	marketType
	lookAhead
}
