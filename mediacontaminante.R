mediacontaminante<-function(directorio,contaminante,id=1:332){
  setwd(directorio) 
  #setwd("~/GitHub/Programacion_Actuarial_III_OT16/specdata") 
  ficheros<- dir()
  p<-0
  s<-0
  a<-(c())
  #msg<-"promedio de cada uno de los monitores"
  #print(msg)
  for (i in id) {specdata<- read.csv(ficheros[i])
  if (contaminante=="sulfate" ){ 
    y<-specdata["sulfate"]
  }else if (contaminante=="nitrate"){
    y<-specdata["nitrate"]
  }else{} 
  cabal<- complete.cases(y)
  x<-vector("numeric")
  x<- y[cabal,]
  z<-(mean(c(x)))
  #print(z)
  a1<-z
  a<-(c(a,a1))
  c<- data.frame(a)
  b<- complete.cases(c)
  b1<-vector("numeric")
  b1<- c[b,]
  #p<-p+1
  #s<-(s+z)
  }
  #msg<- "promedio general de los monitores"
  #print(msg)
  print(mean(c(b1)))
  
}


mediacontaminante("~/GitHub/Programacion_Actuarial_III_OT16/specdata","nitrate",1:332)
