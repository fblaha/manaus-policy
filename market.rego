package manaus.market

allowedMarketTypes = ["match_odds", "three_way", "rt_match_odds", "moneyline"]

drawRunner = "draw"

default marketType = false

marketType {
	lower(input.type) == allowedMarketTypes[_]
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
	contains(names, drawRunner)
}

default matchedAmount = false

matchedAmount {
	input.matchedAmount > 0
}

default allow = false

allow {
	marketType
	lookAhead
	runnerName
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
	msg := sprintf("missing runner: %s", [drawRunner])
}
