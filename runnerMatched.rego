package manaus.market

whitelistedTypes = ["match_odds"]

default hasLowMatchedRunner = false

hasLowMatchedRunner {
	runners := input.prices[_]
	runners.matchedAmount < 5.0
}

default runnerMatchedAmount = false

runnerMatchedAmount {
	whitelistedTypes[_] == lowerType
}

else {
	not hasLowMatchedRunner
}

deny[msg] {
	not runnerMatchedAmount
	msg := sprintf("positive matched amout for all runners required for the type: %s", [lowerType])
}
