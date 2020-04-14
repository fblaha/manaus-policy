package manaus.market

allowedRunnerMatchOdds = ["draw"]

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
	not runnerName
	msg := sprintf("missing at least one of the runners: %s", [concat(",", allowedMarketTypes[input.type])])
}
