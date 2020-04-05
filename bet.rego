package manaus.bet

default profit = false

profit {
	input.profitAndLoss != 0
}

deny[msg] {
	not profit
	msg := "zero profit"
}
