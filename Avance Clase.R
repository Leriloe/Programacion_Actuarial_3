#Listas (es como un vector, pero de vectores, y cada uno tiene su propia clase)
x <- list(1, "a", TRUE, 1+4i)
x
#Matrices
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)
# Redimensionar matriz
dim(m) <- c(3,2)
m
# Crear matriz con datos
m <- matrix(1:6, 3, 2)
m
m <- matrix(1:6, 3, 2, T)
m
m <- matrix(1:6, 3, 3, T)
m
class(m)
str(m)
dim(m) <- c(2,5)

# -------- Juntar vectores
x <- c(1, 2, 3)
y <- c("a", "b", "c")
z <- c(x, y)
z
#----------
m1 <- rbind(m, x)
m1
m2 <- cbind(m, x)
m2
m1 <- rbind(m, y)
m1
rbind(m1, y)
m2 <- cbind(m, y)
m2
cbind(m2, y)