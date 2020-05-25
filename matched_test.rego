package manaus.market

test_matchedAmount {
	matchedAmount with input as market
	not matchedAmount with input as {"type": "moneyline", "matchedAmount": 0}
	matchedAmount with input as {"type": "match_odds", "matchedAmount": 0}
	matchedAmount with input as {"type": "moneyline", "matchedAmount": 10}
}

test_denyMatchedAmount {
	deny["positive matched amout required for the type: handicap"] with input as {"type": "handicap", "matchedAmount": 0}
}
