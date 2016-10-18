rankingcompleto <- function(resultado, num = "mejor"){
    setwd("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/Calidad de Hospitales - data")
    
    # Lectura datos
    datos <- read.csv("outcome-of-care-measures.csv")
    
    # Validaci??n variables
    columnas <- if(resultado =="ataque"){
        11
    } else if(resultado == "falla"){
        17
    } else if(resultado == "neumonia"){
        23
    } else{
        stop("Invalid outcome")
        break
    }
    
    # Resultado
    x <- vector("numeric")
    estados <- levels(datos$State)
    largo <- length(estados)
    
    for(i in 1:largo) {
        sts <- datos[estados[i] == datos$State, ]
        a <- sts[, columnas]
        orden <- sts[order(a, na.last = NA), ]
        primero <- orden[1,2]
        ultimo <- orden[nrow(orden), 2]
        
        if(num == "mejor"){
            nombre <- primero
            } else if(num == "peor"){
            nombre <- ultimo
            } else {
            nombre <- orden[num, 2]}
        
        h <- c(nombre, estados[i])
        x <- append(x, h)
    }
    
    res1 <- matrix(x, largo, 2, byrow = TRUE)
    colnames(res1) <- c("Hospital", "State")
    rownames(res1) <- estados
    res2 <- data.frame(res1)
    res2
}
head(rankingcompleto("ataque", 20), 10)
