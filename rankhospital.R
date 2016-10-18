rankhospital <- function(estado, resultado, num = "mejor"){
    setwd("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/Calidad de Hospitales - data")
    
    # Lectura datos
    datos <- read.csv("outcome-of-care-measures.csv")
    
    # Validaci??n variables
    USA <- unique(datos$State)
    if(!estado %in% USA){
        stop("Invalid State")
        break
    }
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
