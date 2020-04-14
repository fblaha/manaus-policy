package manaus.market

matchedRequiredTypes = ["moneyline"]

default requiresMatched = false

requiresMatched {
	matchedRequiredTypes[_] = lowerType
}

default matchedAmount = false

matchedAmount {
	not requiresMatched
}

else {
	object.get(input, "matchedAmount", 0) > 0
}

deny[msg] {
	not matchedAmount
	msg := sprintf("positive matched amout required for the type: %s", [lowerType])
}
