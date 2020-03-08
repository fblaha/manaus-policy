package manaus.market

allowedMarketTypes := ["match_odds", "three_way", "rt_match_odds", "moneyline"]

default marketType = false

marketType {
	lowerType := lower(input.type)
	allowedMarketTypes[_] == lowerType
}

default allow = false

allow {
	marketType
}
