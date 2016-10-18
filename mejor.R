mejor <- function(estado, resultado){
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
    df <- subset(datos, datos$State == estado)
    x <- df[which.min(df[ , columnas]), ]
    y <- x[order(x$Hospital.Name), ]
    mhospital <- y[1, 2]
    mhospital
   
}

mejor("TX", "ataque")
