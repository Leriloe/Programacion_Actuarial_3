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
        
        a <- as.character(sts[,2])
        sts <- sts[order(a),]
        
        a <- as.numeric(as.character(sts[,columnas]))
        orden <- sts[order(a, na.last = NA), ]
        
        
        orden[,2] <- as.character(orden[,2])
        primero <- orden[1,2]
        ultimo <- orden[sum(as.numeric(orden[,columnas]) != 106), 2]
        
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
    res2 <- data.frame(res1)
    res2
}
head(rankingcompleto("ataque", 20), 10)
rankingcompleto("falla", 5)
