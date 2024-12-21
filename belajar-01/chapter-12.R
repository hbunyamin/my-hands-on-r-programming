#######################
#  Chapter 12
#######################

# =========================
#   12.1 Vectorized Code
# =========================
# You can write a piece of code in many different ways, 
# but the fastest R code will usually take advantage of three things: 
# 1. logical tests, 
# 2. subsetting, and 
# 3. element-wise execution. 

# Contoh kode TIDAK vectorized
abs_loop <- function(vec){
  for (i in 1:length(vec)) {
    if (vec[i] < 0) {
      vec[i] <- -vec[i]
    }
  }
  vec
}


# Contoh kode vectorized
abs_sets <- function(vec){
  negs <- vec < 0
  vec[negs] <- vec[negs] * -1
  vec
}

long <- rep(c(-1, 1), 5000000)

# ======================
#   Evaluasi kecepatan
# ======================
system.time(abs_loop(long))

system.time(abs_sets(long))

# =======================================
#  Bentuk vectorized dari fungsi score
# =======================================
symbols <- matrix(
  c("DD", "DD", "DD", 
    "C", "DD", "0", 
    "B", "B", "B", 
    "B", "BB", "BBB", 
    "C", "C", "0", 
    "7", "DD", "DD"), nrow = 6, byrow = TRUE)
symbols

# Step 1: Assign base prize based on cherries and diamonds ---------
## Count the number of cherries and diamonds in each combination
cherries <- rowSums(symbols == "C")
cherries

diamonds <- rowSums(symbols == "DD")
diamonds

cherries+diamonds+1
c(0,2,5)[cherries+diamonds+1]


c(0,2,5)[cherries+diamonds+1]
