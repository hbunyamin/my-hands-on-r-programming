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

# ===================================
#    7.1 Changing Values in Place 
# ===================================
deck2 <- deck
vec <- c(0, 0, 0, 0, 0, 0)
vec
vec[1]
vec[1] <- 1000
vec

# You can replace multiple values at once as long as the number of new values equals the number of selected values:
vec[c(1, 3, 5)] <- c(1, 1, 1)
vec

vec[4:6] <- vec[4:6] + 1
vec

# You can also create values that do not yet exist in your object. 
# R will expand the object to accommodate the new values:
vec[7] <- 0
vec

# This provides a great way to add new variables to your data set:
deck2$new <- 1:52
head(deck2)

# You can also remove columns from a data frame (and elements from a list) by assigning them the symbol NULL:
deck2$new <- NULL

head(deck2)

deck2[c(13, 26, 39, 52), ]


deck2[c(13, 26, 39, 52), 3]

deck2$value[c(13, 26, 39, 52)]

# ===================================
#    7.2 Logical Subsetting
# ===================================
deck2 <- deck
deck2$face

deck2$face == "ace"
sum(deck2$face == "ace")

deck2$value[deck2$face == "ace"]

deck2$value[deck2$face == "ace"] <- 14
tail(deck2)

# Logical subsetting is one of the things R does best. 
# In fact, logical subsetting is a key component of vectorized programming, 
# a coding style that lets you write fast and efficient R code, which we will study in Speed.

# -----------------------------------------------------------------
# Let’s put logical subsetting to use with a new game: hearts. 
# In hearts, every card has a value of zero:
deck4 <- deck
deck4$value <- 0
head(deck4,13)

queenOfSpades <- deck4$face == "queen" & deck4$suit == "spades"
deck4[queenOfSpades, ]

deck4$value[queenOfSpades] <- 13
class(deck4)
typeof(deck4)

class(deck4["value"])
typeof(deck4["value"])

class(deck4[["value"]])
typeof(deck4[["value"]])

sum(deck4["value"]) 
sum(deck4[["value"]]) 

deck4[queenOfSpades,]

# ---------------------------------------
#   Exercise 7.3 (Practice with Tests)
# ---------------------------------------
# Pertanyaannya:
#   Is w positive?
#   Is x greater than 10 and less than 20?
#   Is object y the word February?
#   Is every value in z a day of the week? 
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- "February"
z <- c("Monday", "Tuesday", "Friday")

#   Is w positive?
w > 0

#   Is x greater than 10 and less than 20?
x > 10 & x < 20

#   Is object y the word February?
y == "February"


all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

# =============================================================
deck5 <- deck

head(deck5, 13)

# You can change the value of the face cards in one fell swoop with
facecard <- deck5$face %in% c("king", "queen", "jack")

deck5[facecard,]

deck5$value[facecard] <- 10
head(deck5,13)

# ===================================
#    7.3 Missing Information
# ===================================
# The NA character is a special symbol in R. 
# It stands for “not available” and can be used as a placeholder for missing information.
1+NA

NA == 1

c(NA, 1:50)

mean(c(NA, 1:50))

mean(c(NA, 1:50), na.rm = TRUE)


c(1,2,3,NA) == NA

is.na(NA)

vec <- c(1,2,3,NA)
is.na(vec)

# Let’s set all of your ace values to NA. 
# This will accomplish two things. 
# First, it will remind you that you do not know the final value of each ace. 
# Second, it will prevent you from accidentally scoring a hand that has an ace before you determine the ace’s final value.


deck5$value[deck5$face == "ace"] <- NA

head(deck5,13)
