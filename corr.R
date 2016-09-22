

corr<-function(directorio , horizonte=0){
  setwd(directorio)
  hor<-horizonte
  ficheros<- dir()
  w<-vector("numeric")
  for(i in 1:332){
    specdata<- read.csv(ficheros[i])
    cabal<-complete.cases(specdata)
    s1<-(nrow(specdata[cabal,]))
    #print(s1)
    if (s1>=hor){
      z<-specdata[cabal,]
      x<- z["sulfate"]
      y<- z["nitrate"]
      w1<-(cor(x,y))
      w<-(c(w,w1))
    }
  } 
  print(w)
}


corr("~/GitHub/Programacion_Actuarial_III_OT16/specdata",0)




