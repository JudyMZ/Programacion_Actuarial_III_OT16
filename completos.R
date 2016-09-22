# COMPLETOS R


completos<-function(directorio,id=1:332){
  setwd(directorio) 
  
  ficheros<- dir()
  s<-(c())
  w<-(c())
  for(i in id){
    specdata<- read.csv(ficheros[i])
    cabal<-complete.cases(specdata)
    s1<-(nrow(specdata[cabal,]))
    s<- (c(s,s1))
    w1<-i
    w<-(c(w,w1))
  }
  x<-data.frame(id=w,nobs=s)
  x
}

completos("~/GitHub/Programacion_Actuarial_III_OT16/specdata",1:332)
