m <- matrix(nrow=2,ncol = 3)
m
dim(m)
attributes(m)
#Cambio de dimensiones de 2x3 a 3x2
dim(m) <- c(3,2) ## crear verctor 
m
#Crear una matriz con datos
m<- matrix(1:6, 3,2)
#Datos de 1-6  e filas y dos columnas
m
m<- matrix(1:6,3,2,TRUE)
m
m<-matrix(1:6,3,3,T)
m
class(m)
#Secuencia de enteros
str(m)

dim(m)<- c(2,5) #esto produce un error
# antes de hacer el cambio de dimension hay que agregar los elementos
x<- c(1,2,3)
y<- c("a","b", "c")
z<- c(x,y)
#combinar los vectores x y y
z
#la misma funcion permite combinar los vectores

#agregar fila
m1 <- rbind(m,x)
m1
#pegado por columnas
m2 <- cbind(m,x)
m2


m1<- rbind(m,y)
m1
m2<-cbind(m,y)
m2

rbind(m1,y)
cbind(m2,y)
#
