package manaus.market

allowedMarketTypes = {
	"match_odds": allowedRunnerMatchOdds,
	"three_way": [],
	"rt_match_odds": allowedRunnerMatchOdds,
	"moneyline": [],
	"handicap": [],
}

default lowerType = ""

lowerType = lower(input.type)

default marketType = false

marketType {
	type := lowerType
	allowedMarketTypes[type]
}

deny[msg] {
	not marketType
	msg := sprintf("unsupported market type: %s", [input.type])
}
