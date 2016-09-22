completos <- function(directorio, id=1:332){
  setwd("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/specdata")
  x <- vector("numeric")
  datos <- vector("numeric")
  
  for(i in id) {
    
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
    x <- c(x,filas)
  }
  
  resultado <- data.frame(id=id,nobs=x)
  resultado
}
completos(specdata,1:10)