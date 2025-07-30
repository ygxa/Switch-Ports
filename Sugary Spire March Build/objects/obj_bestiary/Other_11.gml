/// @description Go to Next Page
var entryAmt = array_length(entry)
var tileArea = rows * columns
var totalPages = (entryAmt mod tileArea == 0 ? floor(entryAmt / tileArea) : floor(entryAmt / tileArea) + 1)
if pgnum < totalPages { 
	pgnum++ 
	selected = ((pgnum - 1) * (rows * columns))
}	
scrolldelay = 210
texty = 0