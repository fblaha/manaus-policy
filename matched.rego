package manaus.market

matchedRequiredTypes = ["moneyline"]

default requiresMatched = false

requiresMatched {
	matchedRequiredTypes[_] = lowerType
}

default unmatchedRunner = false

unmatchedRunner {
	object.get(input.runners[_], "matchedAmount", 0) == 0
}

default matchedAmount = false

matchedAmount {
	not requiresMatched
}

else {
	object.get(input, "matchedAmount", 0) > 0
	not unmatchedRunner
}

deny[msg] {
	not matchedAmount
	msg := sprintf("positive matched amout required for the type: %s", [lowerType])
}
