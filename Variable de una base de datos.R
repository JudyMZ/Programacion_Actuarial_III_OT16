setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data<- read.csv("Datos_S&P.csv")
data
for (x in 1:7){print(class(data[0,x]))}
#Sí utilizamos "lapply" tambien nos da la clase de cada columna
lapply(data,class)

