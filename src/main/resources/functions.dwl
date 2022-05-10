%dw 2.0
output application/dw
import adjustedFor as adj4 from dw::modules::MyFirstMod			//give an alias to the function name

fun getTotalSeats(pt) =
	if ( 
		(pt contains "737") or 
		(pt contains "727") or 
		(pt contains "707")

	) 150 else 300
	

var getTotalSeatsL = (pt) -> do {
	
	var pn = pt[-3 to -1] as Number 

	---
	if (
		pn == 737 or
		pn == 727 or
		pn == 707
		
	) 150 else 300
} 

//also possible solutions: '[] contains pn' or 'pn matches /737|707|727/' -> BUT it is less eficient because func must be called

---

payload..*return map { 
	($), 
	totalSeats: getTotalSeatsL($.planeType),
	priceEUR: adj4($.price, "EUR"),
	priceUSD: $.price adj4 "USD" //using infix notation, makes easier to read the code
	}
