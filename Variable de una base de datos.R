setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data
for (x in 1:7){print(class(data[0,x]))}
#Sí utilizamos "lapply" tambien nos da la clase de cada columna
lapply(data,class)

args(read.table)

setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data <- read.table("Datos_S&P.csv",T,",",nrow=100) #Las 100 primeras columnas
clases<- sapply(data,class) #Capturar las clases, applica la funcia class colunma
data <- read.table("Datos_S&P.csv",T,",",colClasses = clases)

#por columna

#dump y dput preserva la metadata
#tomaran un objeto y lo van a descargar en el disco duro
#uso de dput y deget
y <-data.frame(a=1,"b=a")#un data frame de 2x1 el nombre de las columnas
#data frame de un solo registro
dput(y)
#describe el objeto
dput(y, file="y.R")#guarda en directorio de trabajo
nueva.y <- deget ("Y.R")
y
nueva.y

x<- "Programcion Acturial III"
y<- data.frame(a=1,b="a")
dump(c("x","y"), file="data.R")
rm(x,y)
source("data.R")

head(airquality)
getwd()

s<- head(airquality)
dput(s,file = "HeadArqualitycondput.R")
s


con <- url ("http://www.fcfm.buap.mx/","r")
x<- readLines(con,7)
x


#Creamos un vectos 
x<- c("a","b","c", "c","d","e")
#veamos el vector 
x
#Extrameos el elementos con []
x[1]
x[2]
#tambein podemos extraer una secuencia de elementos
x[1:4]
#Es posible extraer los elementos que cumplen una restriccion
x[x>"b"]
#De manera equivalente se puede obtener un vector lógico
u<-x =="c"
u
x[u]

#Creamos una lista
x<- list(foo=1:4, bar =0.6)
#Extraemos el primer elemento de la lista
#este elemento es una lista que contiene una secuencia
x[1]
#Extraemos nuevamente el primer elemento de la lista
#ahora el elemento es la sencuencia en si
x[[1]]
#Extraemos un elemento por nombre
x$bar
x[["bar"]]
x["bar"]


#[] concerva la clase del dato
#[[]] clase del elemento
# $ elementos por nombre

x$foo[2]

#Creamos una lista de elementos
x<- list(foo=1:4, bar=0.6, baz="Hola")
#Extraemos el primer y tecer elemento de la lista
x[c(1,3)]# extrae el primer elemento y el tercero

x[[c(1,3)]] #Extrae el primer objeto y el tercer elemento de este

x<- list(foo=1:4, bar=0.6, baz="Hola")
name<- "foo"
x[[name]]
x$name # no permite asignar variables
x$foo

#se puede extraer elementos d elos elementos extraidos
x<- list(a=list(10,12,14), b=list(3.14,2,81))
x[[c(1,3)]]#objeto lista
x[[1]][[3]] # tercer elemento de la priemra 
x[[c(2,1)]] # segundo objeto, primer elemento


x<- matrix(1:6,2,3)
x
x[1,2]
x[2,1]
x[1,]
x[,2]

# El resultado es un vector
#vector de un elemento
x[1,2]
#Con dorp =FALSE, se mantiene la dimension y el resultado será una matriz
x[1,2, drop=FALSE]

#si dejamos solmanete el espacio, el resultado será un vector
x[1,]
#Si usamos drop=FALSE, el resultado será una matriz
x[1, , drop =FALSE]

x<-list(aarkdvark=1:5)
x$a #no necesita una coicidencia exacta, empieza con a
x[["a"]] 
x[["a",exact=FALSE]] #con exact =FALse te da el resultado no necesariamenteexacto
#solo funciona con el doble
#[] extrae la lista con ese nombre
x["a", exact=FALSe]

airquality$O
airquality[["O"]]


#la funcion complete


airquality[1:6,]
# los titulos se extraen, porque el resultado es un data frame


#Valores faltantes
airquality[1:6,]
completos <- complete.cases(airquality)
completos
#Resultado es un vector, si esta completo el elemento sale true
## si esta incompleto false

airquality[completos,]
airquality[completos,][1:6,] #muestra las filas del 1 al 6

airquality[1:6,][completos,] 

#OPERACIONES VECTORIALES

x<- 1:4; y<- 6:9 #si 6:8 toma el valor de 6 y los suma con 4
x+y
x>2 #valores logicos
x>=2
y==8 #evaluacion logica del "=" necesitas poner "=="
x*y
x/y

#OPERACIONES CON MATRICES
x<- matrix(1:4,2,2); y<- matrix(rep(10,4),2,2)
x*y
x/y
x%*%y #verdadera multiplicacion de matrizes




#ESTRUCTURAs DE CONTROL

#if (<condicion>){}else{}
#if (<condicion>){}else if (<condicion>){}else{}
   # El if tambien se le puede asignar a una variable

#for(i in 1:10){print(i)}
for (i in 1:10){print (i)}
i

x<- c("a","b","c","d")
for (i in 1:4){print(x[i])}
for (i in seq_along(x)){print(x[i])}
# hace una secuencia
for (letra in x){print(letra)}
for (i in 1:4) print(x[i])


x<- matrix(1:6,2,3)
x
for (i in 1:2){(for(j in 1:3){print(x[i,j])})}
for (i in 1:2){
  for(j in 1:3){
    print(x[i,j])
  }
}

x<- matrix(1:6,2,3)
x
for (i in seq_len(nrow(x))){for(j in seq_len(ncol(x))){print(x[i,j])}}

for (i in seq_len(nrow(x))){print(x[i,])}
for (i in seq_len(ncol(x))){print(x[,i])}
