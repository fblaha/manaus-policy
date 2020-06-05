package manaus.market

default matchedAmount = false

matchedAmount {
	object.get(input, "matchedAmount", 0) > 2.0
}

deny[msg] {
	not matchedAmount
	msg := sprintf("positive matched amout required for the type: %s", [lowerType])
}
