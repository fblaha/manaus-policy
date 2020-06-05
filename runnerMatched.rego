package manaus.market

whitelistedTypes = ["match_odds"]

default hasLowMatchedRunner = false

hasUnmatchedRunner {
	runners := input.prices[_]
	runners.matchedAmount < 2.0
}

default runnerMatchedAmount = false

runnerMatchedAmount {
	whitelistedTypes[_] == lowerType
}

else {
	not hasUnmatchedRunner
}

deny[msg] {
	not runnerMatchedAmount
	msg := sprintf("positive matched amout for all runners required for the type: %s", [lowerType])
}
