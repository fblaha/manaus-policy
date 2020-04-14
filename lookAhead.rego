package manaus.market

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

deny[msg] {
	not lookAhead
	msg := sprintf("open date not within range: %s", [input.event.openDate])
}
