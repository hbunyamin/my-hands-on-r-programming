######################
#  Bab 8 Environments
######################
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



deal <- function(cards){
  cards[1,]
}

shuffle <- function(cards){
  acak <- sample(1:52, size=52)
  cards[acak,]
}


deal(deck)
shuffle(deck)


# =====================
#   8.1 Environments
# =====================
library(pryr)
parenvs(all = TRUE)

as.environment("package:stats")

# Three environments in your tree also come with their own accessor functions. 
# These are the global environment (R_GlobalEnv), the base environment (base), and the empty environment (R_EmptyEnv). 
# You can refer to them with:
globalenv()

baseenv()

emptyenv()

# Next, you can look up an environment’s parent with parent.env:
parent.env(globalenv())

parent.env(emptyenv())

# You can view the objects saved in an environment with ls or ls.str. 
# ls will return just the object names, but ls.str will display a little about each object’s structure:
ls(emptyenv())

ls(baseenv())

ls(globalenv())

head(globalenv()$deck2, 3)

# You can use environment to see the current active environment:
environment()

# The global environment plays a special role in R. 
# It is the active environment for every command that you run at the command line. 
# As a result, any object that you create at the command line will be saved in the global environment. 
# You can think of the global environment as your user workspace.

# When you call an object at the command line, R will look for it first in the global environment. 
# But what if the object is not there? In that case, R will follow a series of rules to look up the object.

# R follows a special set of rules to look up objects. 
# These rules are known as R’s scoping rules, and you’ve already met a couple of them:
# 1. R looks for objects in the current active environment.
# 2. When you work at the command line, the active environment is the global environment. 
# Hence, R looks up objects that you call at the command line in the global environment.
# When R does not find an object in an environment, 
# R looks in the environment’s parent environment, then the parent of the parent, and so on, 
# until R finds the object or reaches the empty environment.

# We’ll use the following function to explore R’s runtime environments. 
# We want to know what the environments look like: what are their parent environments, 
# and what objects do they contain? show_env is designed to tell us:
show_env <- function(){
  list(ran.in = environment(), 
       parent = parent.env(environment()), 
       objects = ls.str(environment()))
}

# show_env is itself a function, so when we call show_env(), 
# R will create a runtime environment to evaluate the function in. 
# The results of show_env will tell us the name of the runtime environment, its parent, 
# and which objects the runtime environment contains:
show_env()


environment(parenvs)

show_env <- function(){
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(), 
       parent = parent.env(environment()), 
       objects = ls.str(environment()))
}

show_env()

# How can you use this knowledge to fix the deal and shuffle functions?

deal <- function(){
  deck[1, ]
}

# ==================
#   Exercise 8.1
# ==================
environment(deal)
deal()

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

DECK <- deck

deck <- deck[-1,]

head(deck,3)

# Now let’s add the code to deal. 
# Here deal saves (and then returns) the top card of deck. 
# In between, it removes the card from deck…or does it?

deal <- function(){
  card <- deck[1,]
  deck <- deck[-1,]
  card
}

deal()

# ===================================
#   Exercise 8.2 (Overwrite deck)
# ===================================
deal <- function(){
  card <- deck[1,]
  assign("deck", deck[-1,], envir = globalenv())
  card
}

deal()
deal()
deal()

shuffle(deck)

head(deck,3)

a <- shuffle(deck)

head(deck, 3)
head(a,3)

# This behavior is now undesirable in two ways. 
# First, shuffle fails to shuffle deck. 
# Second, shuffle returns a copy of deck, which may be missing the cards that have been dealt away. 
# It would be better if shuffle returned the dealt cards to the deck and then shuffled. 
# This is what happens when you shuffle a deck of cards in real life.

# ===================================
#   Exercise 8.3 (Rewrite shuffle)
# ===================================
# Rewrite shuffle so that it replaces the copy of deck that lives in the global environment 
# with a shuffled version of DECK, the intact copy of deck that also lives in the global environment. 
# The new version of shuffle should have no arguments and return no output. 
shuffle <- function(){
  random <- sample( 1:52, size=52 )
  assign("deck", DECK[random, ], envir = globalenv())
}

shuffle()

deal()

deal()

# But the system requires deck and DECK to exist in the global environment. 
# Lots of things happen in this environment, and it is possible that deck may get modified or erased by accident.
# It would be better if we could store deck in a safe, out-of-the-way place, like one of those safe, 
# out-of-the-way environments that R creates to run functions in. 
# In fact, storing deck in a runtime environment is not such a bad idea.

# You could create a function that takes deck as an argument and 
# saves a copy of deck as DECK. 
# The function could also save its own copies of deal and shuffle:
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
}

# Now all of these things are safely out of the way in a child of the global environment. 
# That makes them safe but hard to use. 
# Let’s ask setup to return DEAL and SHUFFLE so we can use them. 
# The best way to do this is to return the functions as a list:
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = globalenv())
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = globalenv())
  }
  list(deal = DEAL, shuffle=SHUFFLE)
}

head(deck, 5)

cards <- setup(deck)

deal <- cards$deal
shuffle <- cards$shuffle
deal
shuffle

environment(deal)
environment(shuffle)

# This arrangement is called a closure. 
# setup’s runtime environment “encloses” the deal and shuffle functions. 
# Both deal and shuffle can work closely with the objects contained in 
# the enclosing environment, but almost nothing else can. 
# The enclosing environment is not on the search path for any other R function or environment.
setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  list(deal = DEAL, shuffle=SHUFFLE)
}

cards   <- setup(deck)
deal    <- cards$deal
shuffle <- cards$shuffle 

rm(deck)

shuffle()
deal()

deal()
