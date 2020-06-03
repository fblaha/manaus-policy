package manaus.market

whitelistedTypes = ["match_odds"]

isWhitelisted {
	whitelistedTypes[_] == lowerType
}

default hasUnmatchedRunner = false

hasUnmatchedRunner {
	runners := input.runners[_]
	runners.matchedAmount == 0
}

default runnerMatchedAmount = false

runnerMatchedAmount {
	isWhitelisted
}

else {
	not hasUnmatchedRunner
}

deny[msg] {
	not runnerMatchedAmount
	msg := sprintf("positive matched amout for all runners required for the type: %s", [lowerType])
}
