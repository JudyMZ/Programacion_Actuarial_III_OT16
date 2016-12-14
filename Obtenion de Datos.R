#Obtención de Datos

#critica de Reinhart and Rogoff

#Ubicacion absoluta
#diagonal a la raiz
#tilde a home 

#Relativa
setwd("./testdir")
setwd("../")  #Regresa al directorio de atras
setwd("~")
#file.exist, te regresa un vector logico
#dir.create

#download.file()

if (!file.exists("data")){dir.create("data")}

#Crear una carpeta para guardar los datos descargados
file.exists("data")

#DESCARGAR DATOS DE INTERNET
if (!file.exists("data")){dir.create("data")}
url<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

download.file(url, destfile = "./data/camaras.csv")
#./ archivo actual 
list.files("./data")
fechaDescarga<-date()
fechaDescarga


#CARGAS LOS DATOS DESDE MI COMPUTADORA

datosCam<-read.table("./data/camaras.csv")
#no necesariamente te cambia de directorio
datosCam<-read.table("./data/camaras.csv",header = TRUE,sep=",")
#el header es para decirle que tiene encabezado
#y una separacion de coma
head(datosCam)
datosCam[2:5]

#read.csv()=read.table(,sep=",",header=T)
datosCam<-read.csv("./data/camaras.csv")

#quote, si hay comentarios o no(si no hay comentarios quote="")
#na.strings, establece el carácter que corresponde a valores faltantes
#nrow, cantidad de filas a leer del archivo
#skip, una cantidad de filas a evitar antes de iniciar la lectura



url<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD&bom=true"
download.file(url,destfile = "./data/camaras.xlsx"method=)
fechaDeacargas<-date()

#C:\Program Files\Java\jre1.8.0_111

install.packages("rJava")
install.packages("xlsx")
library("rJava")
library("xlsx")

#colIndex
#rowIndex filas a extraer

#datosCam<-read.xlsx2("./data/camaras.xlsl",sheetIndex = 1,header = TRUE)
#subConjunto<-read.xlsx()
#c(1,5,6)

#XLM
install.packages("XML")
library(XML)
url<-"http://www.w3schools.com/xml/simple.xml"
data<-xmlTreeParse(url,useInternalNodes = TRUE)
nodoRaiz<-xmlRoot(data)
xmlName(nodoRaiz)
names(nodoRaiz)
nodoRaiz[[1]]
nodoRaiz[[1]][[1]]

xmlSApply(nodoRaiz,xmlValue)
#elemento nodoRaiz donde está toda la información,el valor de xml

#XPath
#www.stat.berkeley.edu/~statcur/Workshoop2/Presentations/XML.pdf

xpathSApply(nodoRaiz,"//name",xmlValue)
xpathSApply(nodoRaiz,"//price",xmlValue)


install.packages("jsonlite")
library(jsonlite)
jsonData<- fromJSON("http://api.github.com/users/JudyMZ/repos")
names(jsonData)
jsonData$name

iris
myjson<-toJSON(iris,pretty=TRUE)
cat(myjson)
#conviertes el dataframe en json

#converitr formato json en un data frame
iris2<-fromJSON(myjson)
head(iris2)

#Introducción a JSON
#http://www.json.org
#json lite
r-bloggers.com/new-package-jsonlite-a-samarter-json


#DATA TABLE
library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
#data table tiene puntitos

tables()
#subconjuntos
DT[2,] #vectores de verdadero y falso
DT[DT$y=="a",]
class(DT)

DT[c(2,3)]
#Extrae la fila 2 y 3
DT[,c(2,3)]

k={print(10);5}
#asigna el valor 5 a k, impime 10 antes del final
print(k)
DT[,list(mean(x),sum(z))]
#criterio de declaracion de expresiones despues de la coma
#poner una coma al data table
DT[,table(y)]
DT[,w:=z^2]
#Resultado del expresion de z se guarda en w
#cuando trabajas en el lado de las columnas evaluas una expresion y te la pone
#como una nueva columna
DT
DT2<-DT #se vuelve una copida del data table
DT[,y:=2] #se modifica en la original, tambien en la copia
DT
DT2
#si cambias una cosa en una tabla tambien cambia la otra

DT[,m:={tmp<-(x+z);log2(tmp+5)}]
#tmp no hacenada se asignacion a m
#crea primero un resultado y luego m le asigna valor de log2...

DT[,a:=x>0]
#crea una nueva columna con x mayor a cero T,F

DT[,b:=mean(x+w),by=a]
#media de x y w, separa a con true, a con false
#evalua w con la suma de x que sean igual a t, f y calcula
set.seed(123)
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))
#letras del 1,3 y true porque la va a repetir
#
DT[,.N,by=x]
#la a la encontro 33387, y la c 33201


library(swirl)
install_from_swirl("Getting_and_Cleaning_Data")
swirl()
