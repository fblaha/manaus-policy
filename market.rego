package manaus.market

allowedRunnerMatchOdds = ["draw"]

allowedMarketTypes = {
	"match_odds": allowedRunnerMatchOdds,
	"three_way": [],
	"rt_match_odds": allowedRunnerMatchOdds,
	"moneyline": [],
}

default marketType = false

marketType {
	some type
	allowedMarketTypes[type]
	lower(input.type) == type
}

lookAheadPer := time.parse_duration_ns("336h") # 14 days

_lookAhead {
	maxFuture := input.now + lookAheadPer
	input.openDate <= maxFuture
	input.openDate > input.now
}

default lookAhead = false

lookAhead {
	openDate := time.parse_rfc3339_ns(input.event.openDate)
	_lookAhead with input.now as time.now_ns() with input.openDate as openDate
}

default runnerName = false

runnerName {
	names := lower(input.runners[_].name)
	allowedRunnners := allowedMarketTypes[input.type]
	contains(names, allowedRunnners[_])
}

runnerName {
	names := lower(input.runners[_].name)
	allowedRunnners := allowedMarketTypes[input.type]
	count(allowedRunnners) == 0
}

default matchedAmount = false

matchedAmount {
	input.matchedAmount > 0
}

deny[msg] {
	not marketType
	msg := sprintf("unsupported market type: %s", [input.type])
}

deny[msg] {
	not lookAhead
	msg := sprintf("open date not within range: %s", [input.event.openDate])
}

deny[msg] {
	not runnerName
	msg := sprintf("missing at least one of the runners: %s", [concat(",", allowedMarketTypes[input.type])])
}
