package manaus.bet

bet := {
	"id": "1311278913160123",
	"selectionId": 1.39577678e+15,
	"selectionName": "DRAW (Chi/Juv)",
	"profitAndLoss": -2,
	"commission": 0,
	"placed": null,
	"matched": "2020-03-30T15:51:57.790Z",
	"settled": "2020-04-01T22:50:54.905Z",
	"price": {
		"price": 3.92,
		"amount": 2,
		"side": "BACK",
	},
}

test_profit {
	profit with input as {"profitAndLoss": 1}
	profit with input as {"profitAndLoss": 0.5}
	not profit with input as {"profitAndLoss": 0}
}

test_deny_profit {
	deny["zero profit"] with input as {"profitAndLoss": 0}
}

test_deny {
	errors := deny with input as bet
	count(errors) == 0
}
