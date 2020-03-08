package manaus.market

allowedMarketTypes := ["match_odds"]

default marketType = false

marketType {
	lowerType := lower(input.type)
	allowedMarketTypes[_] == lowerType
}

default allow = false

allow {
	marketType
}
