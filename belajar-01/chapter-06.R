######################
#  Bab 6 R Notation
######################

# --------------------------------------------------------------------------------------------------------------------
#  - You have a choice when it comes to writing indexes. 
#  - There are six different ways to write an index for R, and each does something slightly different. 
#  - They are all very simple and quite handy, so let’s take a look at each of them. You can create indexes with:
#       * Positive integers
#       * Negative integers
#       * Zero
#       * Blank spaces
#       * Logical values
#       * Names
# ---------------------------------------------------------------------------------------------------------------------

# -----------------------------
#   6.1.1 Positive integers
# -----------------------------
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
head(deck)
deck[1:2,1]

# If you would prefer a data frame instead, you can add the optional argument drop = FALSE between the brackets:
deck[1:2, 1, drop = FALSE]


# -----------------------------
#   6.1.2 Negative integers
# -----------------------------
deck[-(2:52), 1:3]


# ---------------------------------------------------------
#   6.1.3 Zero
# To be honest, indexing with zero is not very helpful.
# ---------------------------------------------------------
deck[0,0]

# ---------------------------------------------------------
#   6.1.4 Blank Spaces
# ---------------------------------------------------------
deck[1, ]

# ---------------------------------------------------------
#   6.1.5 Logical Values
# ---------------------------------------------------------
deck[1, c(TRUE, TRUE, FALSE)]

rows <- c(TRUE, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F,F)

deck[rows,]

# Coba saya kurangi jumlah elemen di vektor-nya
rows <- c(TRUE, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F)

deck[rows,]

# ---------------------------------------------------------
#   6.1.6 Names
# ---------------------------------------------------------
# - Finally, you can ask for the elements you want by name—if your object has names (see Names). 
# - This is a common way to extract the columns of a data frame, since columns almost always have names:
deck[1, c("face", "suit", "value")]


# ---------------------------------------------------------
#   6.2 Deal a Card
# ---------------------------------------------------------
random_indeks <- sample(seq(1,52),3)
random_indeks
deck[sample(random_indeks,3),]

# -----------------------------------
deal <- function(cards){
  cards[1,]
}
anu <-  deal(deck)
anu
# -----------------------------------


# ========================
# 6.3 Shuffle the Deck
# ========================
shuffle <- function(cards){
  acak <- sample(1:52, size=52)
  cards[acak,]
}

deck2 <-shuffle(deck)
deal(deck2)

# =====================================
#   Dollar signs and Double brackets
# =====================================
lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst

# Subset the list
lst[1]
sum(lst[1])

# Tapi kalau menggunakan tanda dollar
sum(lst$numbers)
# atau bentuk lain
sum(lst[[1]])

# In other words, if you subset a list with single-bracket notation, R will return a smaller list. 
# If you subset a list with double-bracket notation, R will return just the values that were inside an element of the list. 
lst["numbers"]

lst[["numbers"]]
