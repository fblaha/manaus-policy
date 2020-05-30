package manaus.market

whitelistedTypes = []

default requiresMatched = false

isWhitelisted {
	whitelistedTypes[_] == lowerType
}

default matchedAmount = false

matchedAmount {
	isWhitelisted
}

else {
	object.get(input, "matchedAmount", 0) > 0
}

deny[msg] {
	not matchedAmount
	msg := sprintf("positive matched amout required for the type: %s", [lowerType])
}
