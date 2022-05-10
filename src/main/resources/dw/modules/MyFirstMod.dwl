%dw 2.0

var xes = {
	EUR: 1.0,
	GBP: 0.8,
	USD: 1.2
}

var adjustedFor = (p, c) -> p * xes[c]

//modules is not divided by header and body, nothing like that is necessary
//it is only the list of variables and functions