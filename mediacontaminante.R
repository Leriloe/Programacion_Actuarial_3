mediacontaminante <- function(directorio, contaminante, id=1:332){
  setwd("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/specdata")
  x <- vector("numeric")
  datos <- vector("numeric")
  if(contaminante == "sulfate"){
    c == 1
  }else if (contaminante == "nitrate"){c==2}
  
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
    x <- rbind(y[datoscom, ])
  }
  
  if(c == 1){
    media <- mean(y[ , 2])
  }else if(c == 2){media <- mean(x[ , 3])}
   print(media)
  }
mediacontaminante(specdata, "sulfate", id=1:5)