# ===============================
#  4 Project 2: Playing Cards
# ===============================

# Task 1: build the deck
# Task 2: write functions that deal and shuffle
# Task 3: change the point system to suit your game
# Task 4: manage the state of the deck


# =============
#  5 R Objects
# =============

# --------------------
# 5.1 Atomic Vectors
# --------------------
die <- c(1, 2, 3, 4, 5, 6)
die

# is.vector tests whether an object is an atomic vector. 
# It returns TRUE if the object is an atomic vector and FALSE otherwise. 
is.vector(die)

# length returns the length of an atomic vector. 
five <- 5
five

is.vector(five)

length(five)

length(die)


int <- 1L
text <- "ace"  


int <- c(1L, 5L)
text <- c("ace", "hearts")

sum(int)
sum(text)


# --------------------
# 5.1.1 Doubles
# --------------------
die <- c(1, 2, 3, 4, 5, 6)
die

# Terlihat bahwa tipe dari die sama meskipun die sudah diubah dim-nya tetapi class-nya berubah.
# Before:
typeof(die)
class(die)
dim(die) <- c(2,3)
# After:
typeof(die)
class(die)

# --------------------
# 5.1.2 Integers
# --------------------
int <- c(-1L, 2L, 4L)
int

typeof(int)


# Contoh 
sqrt(2)^2 - 2


# --------------------
# 5.1.3 Characters
# --------------------
text <- c("Hello", "World")
text

typeof(text)


# --------------------
# 5.1.4 Logicals
# --------------------
3 > 4

logic <- c(TRUE, FALSE, TRUE)
logic

typeof(logic)


# ------------------------------------
# Exercise 5.2 (Vector of Cards)
# ------------------------------------
hand <- c("ace", "king", "queen", "jack", "ten")
hand

typeof(hand)

attributes(hand)

# -------------------
#   5.2.1 Names
# -------------------
names(die)

names(die) <- c("one", "two", "three", "four", "five", "six")

# Now die has a names attribute:
names(die)
attributes(die)
die + 1

# -------------------
#   5.2.2 Dim
# -------------------
dim(die) <- c(2,3)
die

dim(die) <- c(3,2)
die

dim(die) <- c(1,2,3)
die

# ---------------------------------------------------------------
#   5.3 Matrices
#   - `matrix` will fill up the matrix column by column by default, 
# ---------------------------------------------------------------
m <- matrix(die, nrow = 2)
m
m <- matrix(die, nrow = 2, byrow = TRUE)
m


# ---------------------------------------------------------------------------------------------------------------
#   5.4 Arrays
#   - The array function creates an n-dimensional array.
#   - array is not as customizeable as matrix and basically does the same thing as setting the dim attribute. 
#   - To use array, provide an atomic vector as the first argument, and 
#     a vector of dimensions as the second argument, now called dim
# ----------------------------------------------------------------------------------------------------------------
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

# ---------------------------------------------------------------------------------------------------------------
#   Exercise 5.3 (Make a matrix)
#   - Create the following matrix, which stores the name and suit of every card in a royal flush. 
# ----------------------------------------------------------------------------------------------------------------
hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")
matrix(hand1, nrow = 5) # Cara ke-1
matrix(hand1, ncol = 2) # Cara ke-1
dim(hand1) <- c(5, 2)   # Cara ke-3
hand1

# ------------------------------------
#   5.5.1 Dates and Times
# ------------------------------------
now <- Sys.time()
now

typeof(now)
class(now)

unclass(now)

mil <- 1000000
mil

class(mil) <- c("POSIXct", "POSIXt")
mil

# ------------------------------------
#   5.5.2 Factors
# ------------------------------------
gender <- factor(c("male", "female", "female", "male"))

typeof(gender)
attributes(gender)

unclass(gender)
gender

# You can convert a factor to a character string with the as.character function.
as.character(gender)

# ------------------------------------
#   5.7 Lists
# ------------------------------------
list1 <- list(100:130, "R", list(TRUE, FALSE))
list1

list2 <- list(100:130, "R", array(c(TRUE, FALSE)))
list2

# ------------------------------------------------------------------------------------------------------------------------------------
#   5.5 Lists
# - Lists are like atomic vectors because they group data into a one-dimensional set. 
# - However, lists do not group together individual values; lists group together R objects, such as atomic vectors and other lists.
# ------------------------------------------------------------------------------------------------------------------------------------


# --------------------------------------------------------------------------------------------------------
#  Exercise 5.5 (Use a List to Make a Card)
#  - Use a list to store a single playing card, like the ace of hearts, which has a point value of one. 
#  - The list should save the face of the card, the suit, and the point value in separate elements. 
# ---------------------------------------------------------------------------------------------------------
card <- list("ace", "hearts", 1)
card


# ------------------------------------------------------------------------------------------------------------------------
#   5.8 Data Frames
# - Data frames are the two-dimensional version of a list. 
# - They are far and away the most useful storage structure for data analysis, and 
#     they provide an ideal way to store an entire deck of cards. 
# - You can think of a data frame as R’s equivalent to the Excel spreadsheet because it stores data in a similar format.
# - Data frames group vectors together into a two-dimensional table. 
# - Each vector becomes a column in the table. 
# - As a result, each column of a data frame can contain a different type of data; but within a column, every cell must be the same type of data,
# ------------------------------------------------------------------------------------------------------------------------
df <- data.frame(face=c("ace", "two", "six"), suit=c("clubs", "clubs", "clubs"), value=c(1,2,3))
df

typeof(df)
class(df)
str(df)

# ---------------------------
#   Membuat deck kartu
# ---------------------------
deck <- data.frame(
  face = c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
           "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten", 
           "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace", 
           "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five", 
           "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine", 
           "eight", "seven", "six", "five", "four", "three", "two", "ace"),  
  suit = c("spades", "spades", "spades", "spades", "spades", "spades", 
           "spades", "spades", "spades", "spades", "spades", "spades", "spades", 
           "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", 
           "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds", 
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", 
           "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts", 
           "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", 
           "hearts", "hearts", "hearts", "hearts", "hearts"), 
  value = c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 
            7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 
            10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
)

# ------------------------------------------------------------------------------------------------------------------------
#   5.9 Loading Data
# ------------------------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------------------------------
#   5.10 Saving Data
# ------------------------------------------------------------------------------------------------------------------------
names(deck)
write.csv(deck, file="cards.csv", row.names = FALSE)










