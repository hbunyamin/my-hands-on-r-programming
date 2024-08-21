########################
# Bab 10 S3
########################

# Kita baca dulu deck dari file
deck <- read.csv("cards.csv")
deck

get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

score <- function (symbols) {
  # identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, 
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  
  # adjust for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
}

# ==============
#   Test Drive
# ==============
temp_symbol <- c("DD", "C", "DD")
sum(temp_symbol == "DD")




play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}

play()

one_play <- play()
one_play

# ====================
#    The S3 System
# ====================
# S3 refers to a class system built into R. 
# The system governs how R handles objects of different classes. 
# Certain R functions will look up an object’s S3 class, and then behave differently in response.
num <- 1000000000
print(num)

# But if you give that number the S3 class POSIXct followed by POSIXt, print will display a time:
class(num) <- c("POSIXct", "POSIXt")
print(num)

# R’s S3 system is built around three components: 
# 1. attributes (especially the class attribute), 
# 2. generic functions, and 
# 3. methods.

# ==================
# 10.2 Attributes
# ==================
# Attributes do not affect the values of the object, 
# but stick to the object as a type of metadata that R can use to handle the object. 
# For example, a data frame stores its row and column names as attributes. 
# Data frames also store their class, "data.frame", as an attribute.

attributes(deck)

# You’ve already met the names, dim, and class functions, 
# which each work with an eponymously named attribute.
names(deck)
dim(deck)
class(deck)

# However, R also has row.names, levels, and 
# many other attribute-based helper functions. 
# You can use any of these functions to retrieve an attribute’s value:
row.names(deck)

row.names(deck) <- 101:152
row.names(deck)

levels(deck) <- c("level 1", "level 2", "level 3")
attributes(deck)

one_play <- play()
one_play

attributes(one_play)

# attr takes two arguments: an R object and the name of an attribute (as a character string). 
# To give the R object an attribute of the specified name, 
# save a value to the output of attr. 
# Let’s give one_play an attribute named symbols that contains a vector of character strings:
attr(one_play, "symbols") <- c("B", "0", "B")
attributes(one_play)

attr(one_play, "symbols")

one_play
class(one_play)

# ===================================
#  Exercise 10.1 Add an Attribute
# ===================================
play <- function() {
  symbols <- get_symbols()
  prize <- score(symbols)
  attr(prize, "symbols") <- symbols
  prize
}

play()

two_play <- play()
two_play

# You can also generate a prize and set its attributes in one step with the structure function. 
# structure creates an object with a set of attributes. 
# The first argument of structure should be an R object or set of values, 
# and the remaining arguments should be named attributes for structure to add to the object. 
# You can give these arguments any argument names you like. 
# structure will add the attributes to the object under the names that you provide as argument names:
play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}

three_play <- play()
three_play

# For example, the following function will look up one_play’s symbols attribute and 
# use it to display one_play in a pretty manner. 
# We will use this function to display our slot results, 
# so let’s take a moment to study what it does:
slot_display <- function(prize){
  
  # extract symbols
  symbols <- attr(prize, "symbols")
  
  # collapse symbols into single string
  symbols <- paste(symbols, collapse = " ")
  # symbols <- paste(symbols)
  
  # combine symbols with prize as a character string
  # Gunakan \n
  string <- paste(symbols, prize, sep = "\n$")
  
  # display character string in console without quotes
  cat(string)
  
}

slot_display(one_play)

slot_display(play())

# ==========================
# 10.3 Generic Functions 
# ==========================
print(play())
print


# =============
# 10.4 Methods
# =============
print.POSIXct

print.factor

methods(print)

# =======================
# 10.4.1 Method Dispatch
# =======================
class(one_play) <- "slots"

args(print)

print.slots <- function(x, ...){
  cat("I'm using the print.slots method")
}

print(one_play)

one_play

rm(print.slots)

# =====================================
# Exercise 10.2 (Make a Print Method)
# =====================================
# Write a new print method for the slots class. 
# The method should call slot_display to return well-formatted slot-machine output.

print.slots <-function(x, ...){
  slot_display(x)
}

one_play

# =====================================
# Exercise 10.3 (Add a Class)
# =====================================
# Modify the play function so it assigns slots to the class attribute of its output: 
play <- function() {
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols, class="slots")
}

class(play())   
play()

# =============
# 10.5 Classes
# =============
methods(class="factor")

play1 <- play()
play1

play2 <- play()
play2

c(play1, play2)
