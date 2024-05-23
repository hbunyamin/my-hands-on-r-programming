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


typeof(die)


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
