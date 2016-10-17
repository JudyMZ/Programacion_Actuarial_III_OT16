rankingcompleto <- function(resultado, num ="mejor"){
  #lectura de datos
  c1<-c()
  c2<-c()
  for(n in 1:54){
    k<-num
    setwd("~/GitHub/Programacion_Actuarial_III_OT16/Caso 2")
    outcome<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    if (resultado=="ataque"){m<-11}else if (resultado=="falla"){m<-17}else if(resultado=="neumonia"){m<-23}
    for (j in 1:nrow(outcome)){
      if(outcome[j,m]=="Not Available"){outcome[j,m]<-0}
    }
    outcome[, m] <- as.numeric(outcome[, m])
    s<- split(outcome,outcome$State)
    x<-s[[n]]$Hospital.Name
    z<-s[[n]]$State
    
    if (resultado=="ataque"){
      y<-s[[n]]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    } else if (resultado=="falla"){
      y<-s[[n]]$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    } else if(resultado=="neumonia"){
      y<-s[[n]]$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    }
    for (i in 1:length(y)){
      if(y[i]==0){y[i]<-NA}
    }
    # Revisión de la validez de estado y resultado
    bien<- complete.cases(cbind(x,y,z))
    r<-(cbind.data.frame(x,y,z)[bien,])
    r2<-r[order(r$y,r$x),]
    
    if (k=="mejor"){k<-1
    w<-r2[[1]][[k]]}else if(k =="peor"){k<-nrow(r2)
    w<-r2[[1]][[k]]}else if (k<1){stop("resutado inválido")
    }else if(k<=nrow(r2)){w<-r2[[1]][[k]]
    }else if (k>nrow(r2)){w<-NA}
    
    w<-as.character(w)
    w
    n1<-r2[[3]][[1]]
    n1<-as.character(n1)
    c1<-c(c1,w)
    c2<-c(c2,n1)
  }
  # Para cada estado, encuentra el hospital con la posición dada.
  # Regresa un data frame con el nombre del hospital y la abreviatura
  # del nombre del estado al que pertenece.
  base<-data.frame(hospital=c1,state=c2,row.names = c2)
  base
}