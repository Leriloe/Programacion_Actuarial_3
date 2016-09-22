corr <- function(directorio, horizonte = 0){
  setwd("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/specdata")
  datos <- vector("numeric")
  resultado <- vector("numeric")
  for(i in 1:332) {
    
    if (i<10) {
      datos <- read.csv(paste("00", i, ".csv", sep=""))
    }else if(i>=10 && i<100 ) {
      datos <-read.csv(paste("0", i,".csv", sep=""))
    }else {
      datos <-read.csv(paste(i,".csv",sep=""))
    }
    
    datoscom <- complete.cases(datos)
    y <- datos[datoscom, ]
    filas <- nrow(y)
    
    if(filas>= horizonte){
      relacion <- cor(y[ , 2], y[ , 3])
      resultado <- c(resultado, relacion)
      print(resultado)
    }
  }
}

corr(specdata, 100)