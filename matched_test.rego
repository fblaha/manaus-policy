package manaus.market

test_matchedAmount {
	matchedAmount with input as market
	not matchedAmount with input as {"type": "moneyline", "matchedAmount": 0}
	matchedAmount with input as {"type": "match_odds", "matchedAmount": 0}
	matchedAmount with input as {"type": "moneyline", "matchedAmount": 10}
	matchedAmount with input as {"type": "moneyline", "matchedAmount": 10, "runners": [{"matchedAmount": 5}]}
	not matchedAmount with input as {"type": "moneyline", "matchedAmount": 10, "runners": [{"matchedAmount": 0}]}
}

test_denyMatchedAmount {
	deny["positive matched amout required for the type: moneyline"] with input as {"type": "moneyline", "matchedAmount": 0}
}
