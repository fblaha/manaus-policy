package manaus.market

allowedRunnerMatchOdds = ["draw"]

allowedMarketTypes = {
	"match_odds": allowedRunnerMatchOdds,
	"three_way": [],
	"rt_match_odds": allowedRunnerMatchOdds,
	"moneyline": [],
}

default lowerType = ""

lowerType = lower(input.type)

default marketType = false

marketType {
	type := lowerType
	allowedMarketTypes[type]
}

default runnerName = false

runnerName {
	names := lower(input.runners[_].name)
	allowedRunnners := allowedMarketTypes[input.type]
	contains(names, allowedRunnners[_])
}

runnerName {
	allowedRunnners := allowedMarketTypes[input.type]
	count(allowedRunnners) == 0
}

deny[msg] {
	not marketType
	msg := sprintf("unsupported market type: %s", [input.type])
}

deny[msg] {
	not runnerName
	msg := sprintf("missing at least one of the runners: %s", [concat(",", allowedMarketTypes[input.type])])
}
