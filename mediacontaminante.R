mediacontaminante <- function(directorio, contaminante, id=1:332){
  #setwd(paste("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/",directorio,sep=""))
  setwd("~/Desktop/actuaria/Programacion_Actuarial_3_Enviar_Archivos/specdata")
  j <- T
  for(i in id) {
    if (i<10) {
      datos <- read.csv(paste("00", i, ".csv", sep=""))
    }else if(i>=10 && i<100 ) {
      datos <-read.csv(paste("0", i,".csv", sep=""))
    }else {
      datos <-read.csv(paste(i,".csv",sep=""))
    }
    if (j){
      x <- datos 
    } else {
      x <- rbind(x,datos)
    }
    j <- F
  }
  
  if(contaminante == "nitrate"){
    media <- mean(x[ , 3], na.rm = TRUE)
  }else if(contaminante == "sulfate"){
    media <- mean(x[ , 2], na.rm = TRUE)
  }
   print(media)
}
mediacontaminante(specdata, "sulfate", id=1:10)
data <- read.csv("001.csv")
