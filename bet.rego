package manaus.bet

default profit = false

profit {
	input.profitAndLoss != 0
}

default allow = false

allow {
	profit
}

deny[msg] {
	not profit
	msg := "zero profit"
}
