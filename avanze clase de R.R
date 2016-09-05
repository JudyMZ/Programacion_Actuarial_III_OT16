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


#Factores
x<- factor(c("Si", "No", "Si", "Si", "No","Si", "No"))
x #Cuales son los distintos factores que tienes

table(x)
# cuenta cuantos no y si aparecieron
unclass(x)
# enseña como es la forma en que lo esta almacenando, guarda la secuencia de núemros

x<- factor(c("Si", "No", "Si", "Si", "No","Si", "No"), levels = c("Si", "No"))
x #Cambiar los niveles

x<- factor(c("azul","azul","rojo","azul", "amarillo", "verde", "azul"))
x
table(x)

#los valores faltantes NA (no aplica), NAN (not a number, no es número)
# NaN 0/0 raiz de un número negativo, te aparecen como valor faltante
#is.na o is.nan


#VALORES FALTANTES
x<- c(1,2,NA,10,3)
is.na(x)
is.nan(x)
#aqui no se concidera un faltante no númerico

x<- c(1,2,NaN,10,3)
is.na(x)
is.nan(x)

#El vector es sola una clase y en las listas cada uno toma su clase

#Una matriz donde cada elemento conservara su clase
#Data frames, permite almacenar informacion, es como una lista solo que cada fila o columna puede tener distinta clase

#Data Frames

x<- data.frame(Eric = 1:4, Lori=c(T,T,F,F))
x
#nombre a cada columna
row.names(x)<- c("Primero", "segundo", "Tercero", "cuarto")
x
#Cambia el número de la fila

#Atributos y Caracteristicas
nrow(x)# número de filas
ncol(x)# número de columnas
attributes(x)

names(x)<- c ("Judy", "Melissa")
x
# Los nombres no son excluivos de los data frames

x<- 1:3
names(x) #Null
names(x)<- c("Hugo", "Paco", "Luis")
x

x<- list(a=1:10, b=100:91, c=51:60)
x

names(x)<- c("seq1","Seq2", "sEq3")
x

#ahora con matrices

m<- matrix(1:4,2,2)
m
attributes(m)
dimnames(m)<- list(c("fill1", "fill2"), c("col1","col2"))
m


m <- matrix(NA,5,5)
m
dimnames(m)<- list(c(1:5),c("A", "B", "C","D","E"))
m

#fil nombre del archivo
# header T o F

getwd()

setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv") #simplificacion de la 134
data
data <- read.table("Datos_S&P.csv",T,",")# csv depende de table
data



