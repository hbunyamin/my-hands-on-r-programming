#################
#  Bab 11 Loops
#################

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

# =========================
#   11.1 Expected Values
# =========================

die <- c(1,2,3,4,5,6)

# =========================
#   11.2 expand.grid
# =========================
rolls <- expand.grid(die,die)
attributes(rolls) 
rolls

rolls$value <- rolls$Var1 + rolls$Var2
rolls

prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
prob

rolls$Var1
prob[rolls$Var1] 

rolls$Var2
prob[rolls$Var2]

rolls$prob1 <- prob[rolls$Var1]
head(rolls, 3)

rolls$prob2 <- prob[rolls$Var2]

head(rolls,3)

rolls$prob <- rolls$prob1 * rolls$prob2
head(rolls,3)

# It is easy to calculate the expected value now that we have each outcome, 
# the value of each outcome, and the probability of each outcome. 
# The expected value will be the summation of the dice values multiplied by the dice probabilities:
sum(rolls$value * rolls$prob)

# ============================================
#   Exercise 11.1 (List the Combinations)
# ============================================
# Use expand.grid to make a data frame that contains every possible combination of three symbols from the wheel vector: 
wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
# combos <- expand.grid(wheel, wheel, wheel)  # Ngga ada perbedaan dengan baris di atas

head(combos,3)

# ===========================================
#   Exercise 11.2 (Make a Lookup Table)
# ===========================================
prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1, "B" = 0.25, 
          "C" = 0.01, "0" = 0.52)

# =============================================
#   Exercise 11.3  (Lookup the Probabilities)
# =============================================
combos$prob1 <- prob[combos$Var1]
head(combos, 5)

combos$prob2 <- prob[combos$Var2]
head(combos, 5)

combos$prob3 <- prob[combos$Var3]
head(combos,5)

# ===============================================================
# Exercise 11.4 (Calculate Probabilities for Each Combination) 
# ===============================================================
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3
head(combos,5)

# A Sanity check untuk meghitung total peluang adalah 1
sum(combos$prob)

# =================================================
#  Contoh untuk kelas IN211 Logika Informatika
# =================================================
nilai_penyataan <- c(TRUE, FALSE)
truth_table <- expand.grid(nilai_penyataan, nilai_penyataan, nilai_penyataan)

colnames(truth_table) <- c("P","Q","R")
truth_table

truth_table$Hasil <- truth_table$P & truth_table$Q & truth_table$R
truth_table

# =========================
#   11.3 for Loops
# =========================
combos$prize <- NA
head(combos,5)

# ===================================
#   Exercise 11.5 (Build a Loop) 
# ===================================
# Construct a for loop that will run score on all 343 rows of combos. 
# The loop should run score on the first three entries of the _i_th row of combos and 
# should store the results in the _i_th entry of combos$prize.
for (i in 1:nrow(combos)){
  symbols <- c( combos[i,1], combos[i,2], combos[i,3] )
  combos$prize[i] <- score(symbols)
}
head(combos,5)

# We’re now ready to calculate the expected value of the prize. 
# The expected value is the sum of combos$prize weighted by combos$prob. 
# This is also the payout rate of the slot machine:
sum(combos$prob * combos$prize)


