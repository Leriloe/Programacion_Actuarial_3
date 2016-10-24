rankhospital <- function(estado, resultado, num = "mejor"){
    setwd("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/Calidad de Hospitales - data")
    
    # Lectura datos
    datos <- read.csv("outcome-of-care-measures.csv")
    
    # Validaci??n variables
    USA <- levels(datos$State)
    if(!estado %in% USA){
        stop("Invalid State")
        break
    }
    columnas <- if(resultado =="ataque"){
        columnas <- 11
    } else if(resultado == "falla"){
        columnas <- 17
    } else if(resultado == "neumonia"){
        columnas <- 23
    } else{
        stop("Invalid outcome")
        break
    }
    
    # Resultado
    datos[, columnas] <- suppressWarnings(as.numeric(levels(datos[ , columnas])[datos[ , columnas]]))
    datos[, 2] <- as.character(datos[ , 2]) 
    
    x <- datos[grep(estado, datos$State), ]
    y <- x[order(x[ , columnas], x[, 2], na.last = NA), ]
    
    if(num == "mejor") {
        y[1, 2]
    } else if(num == "peor") {
        y[nrow(y), 2]
    } else{
        y[num, 2]
    }
    
}
rankhospital("TX", "falla", 4)
rankhospital("MN", "ataque", 6)
rankhospital("IN", "falla", 8)
rankhospital("PP", "falla", 8)
rankhospital("RI", "ataque", 5)
