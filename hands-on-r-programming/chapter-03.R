# ===============================
#  3 Packages and Help Pages
# ===============================

# ---------------
# 3.1 Packages
# ---------------

# Kita menginstall ggplot
install.packages("ggplot2")


# Import ggplot2 
library(ggplot2)


# Coba function qplot
qplot


# Kita coba panggil fungsi qplot dengan kode berikut:
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x
y <- x^3
qplot(x,y)


# Let’s take a look at a histogram to see if this makes sense. 
# qplot will make a histogram whenever you give it only one vector to plot.
x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)


x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)


# Exercise 3.1 (Visualize a Histogram) 
x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth=1)


# replicate provides an easy way to repeat an R command many times. 
replicate(3, 1+1)

# Buat fungsi roll()
roll <- function(){
  die <- 1:6
  dice <- sample(die, size=2, replace = TRUE)
  sum(dice)
}


replicate(10, roll())


# Kita roll 10000 kali dan plot the histogram
rolls <- replicate(10000, roll())
qplot(rolls, binwidth=1)


# ----------------------------------
# 3.2 Getting Help with Help Pages
# ----------------------------------
?sqrt


# Exercise 3.2 (Roll a Pair of Dice)
# ------------------------------------
# You will need to add a prob argument to the sample function 
#inside of roll. 
# This argument should tell sample to sample the numbers one through 
# five with probability 1/8 and the number 6 with probability 3/8.

roll <- function(){
  die <- 1:6
  dice <- sample(die, size=2, replace = TRUE, 
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}
roll()


# Kita coba lagi lempar dadu baru ini sebanyak 10000
rolls <- replicate(10000, roll())
qplot(rolls, binwidth=1)







