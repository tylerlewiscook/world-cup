library(rvest)	# for web scraping



# Initial data for all years -----------------------------------------------

years <- seq(1930, 2018, 4)
years <- years[-c(which(years == 1942), which(years == 1942)+1)]

times <- NULL
which.cup <- NULL

for(i in 1:length(years)){
	page <- paste("https://en.wikipedia.org/wiki/", years[i], "_FIFA_World_Cup")
	temp.page <- read_html(page)
	nodes <- html_nodes(temp.page, '.mw-parser-output div td small')
	output <- html_text(nodes)
	times <- c(times, output)
	which.cup <- c(which.cup, rep(years[i], length(output)))
}



# 1970 ---------------------------------------------------------------------

for(i in 1:4){
	page <- paste("https://en.wikipedia.org/wiki/1970_FIFA_World_Cup_Group_", i)
	temp.page <- read_html(page)
	nodes <- html_nodes(temp.page, '.mw-parser-output div td small')
	output <- html_text(nodes)
	times <- c(times, output)
	which.cup <- c(which.cup, rep(1970, length(output)))
}



# 1974 ---------------------------------------------------------------------

for(i in 1:4){
	page <- paste("https://en.wikipedia.org/wiki/1974_FIFA_World_Cup_Group_", i)
	temp.page <- read_html(page)
	nodes <- html_nodes(temp.page, '.mw-parser-output div td small')
	output <- html_text(nodes)
	times <- c(times, output)
	which.cup <- c(which.cup, rep(1974, length(output)))
}



# 1982 ---------------------------------------------------------------------

for(i in 1:10){
	if(i < 7){
		page <- paste("https://en.wikipedia.org/wiki/1982_FIFA_World_Cup_Group_", i)
	} else{
		page <- paste("https://en.wikipedia.org/wiki/1982_FIFA_World_Cup_Group_", LETTERS[i-6])
	}
	temp.page <- read_html(page)
	nodes <- html_nodes(temp.page, '.mw-parser-output div td small')
	output <- html_text(nodes)
	times <- c(times, output)
	which.cup <- c(which.cup, rep(1982,  length(output)))
}



# 1986 - 1994 ---------------------------------------------------------------

temp.years <- c(1986, 1990, 1994)

for(y in 1:3){
	for(i in 1:6){
		page <- paste("https://en.wikipedia.org/wiki/", 1982+4*y, "_FIFA_World_Cup_Group_", LETTERS[i])
		temp.page <- read_html(page)
		nodes <- html_nodes(temp.page, '.mw-parser-output div td small')
		output <- html_text(nodes)
		times <- c(times, output)
		which.cup <- c(which.cup, rep(temp.years[y], length(output)))
	}
}



# 1998 - 2014 (no H) ----------------------------------------------------------

temp.years <- c(1998, 2002, 2006, 2010, 2014)

for(y in 1:5){
	for(i in 1:7){
		page <- paste("https://en.wikipedia.org/wiki/", 1994+4*y, "_FIFA_World_Cup_Group_", LETTERS[i])
		temp.page <- read_html(page)
		nodes <- html_nodes(temp.page, '.mw-parser-output div td small')
		output <- html_text(nodes)
		times <- c(times, output)
		which.cup <- c(which.cup, rep(temp.years[y], length(output)))
	}
}



# Fixing group H --------------------------------------------------------------

for(y in 1:5){
	page <- paste("https://en.wikipedia.org/wiki/", temp.years[y], "_FIFA_World_Cup_Group_H")
	temp.page <- read_html(page)
	nodes <- html_nodes(temp.page, '.mw-parser-output div td small')
	output <- html_text(nodes)
	times <- c(times, output)
	which.cup <- c(which.cup, rep(temp.years[y], length(output)))
}



# Create data frame, check results, and save ----------------------------------
# Totals should match: 
# https://www.fifa.com/fifa-tournaments/statistics-and-records/worldcup/index.html

goals <- data.frame(times, which.cup)

margin.table(table(goals$times, goals$which.cup), 2)

write.csv(goals, file="goals.csv", row.names=FALSE)






