mejor<-function(estado,resultado){
  #Lectura de Datos
  n<-estado
  
  setwd("~/GitHub/Programacion_Actuarial_III_OT16/Caso 2")
  outcome<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (!(n %in% outcome$State)){stop("estado inválido")}
  
  if (resultado=="ataque"){m<-11}else if (resultado=="falla"){m<-17}else if(resultado=="neumonia"){
    m<-23}else{stop("resultado inválido")}
  for (j in 1:nrow(outcome)){
    if(outcome[j,m]=="Not Available"){outcome[j,m]<-0}
  }
  
  outcome[, m] <- as.numeric(outcome[, m])
  s<- split(outcome,outcome$State)
  x<-s[[n]]$Hospital.Name
  
  if (resultado=="ataque"){
    y<-s[[n]]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  } else if (resultado=="falla"){
    y<-s[[n]]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  } else if(resultado=="neumonia"){
    y<-s[[n]]$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  }
  # Revisión de la validez de estado y resultado
  for (i in 1:length(y)){
    if(y[i]==0){y[i]<-NA}
  }
  
  bien<- complete.cases(cbind(x,y))
  r<-(cbind.data.frame(x,y)[bien,])
  r2<-r[order(r$y,r$x),]
  # Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días
  w<-r2[[1]][[1]]
  w<-as.character(w)
  w
}