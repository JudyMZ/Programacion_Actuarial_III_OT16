setwd("~/GitHub/Programacion_Actuarial_III_OT16/Caso 3/UCI HAR Dataset")

#Parte1) Juntar Datos

Juntarx = rbind(read.table("./train/X_train.txt"),read.table("./test/X_test.txt"))
Juntary = rbind(read.table("./train/Y_train.txt"),read.table("./test/Y_test.txt"))[,1]
JuntarSub = rbind(read.table("./train/subject_train.txt"),read.table("./test/subject_test.txt"))


Titulo = read.table("./features.txt")

#Parte2) Solo media y desviacion std

colnames(Juntarx) <- Titulo[,2]
Mediastd = grepl('-(mean|std)\\(', Titulo[,2])
Juntarx = Juntarx[Mediastd]

#Parte3) Usar nombre de actividad

Act = as.character(read.table("./activity_labels.txt")[,2])
Juntary = Act[Juntary]

#Parte4) Etiquetas apropiadas

cambio = colnames(Juntarx)
cambio = gsub("\\()", "", cambio)
cambio = gsub('([[:upper:]])', ' \\1', cambio)
cambio = gsub("Body Body", "Body", cambio)
cambio = gsub("\\-", " -", cambio)
cambio = gsub("-mean", "- Media", cambio)
cambio = gsub("-std", "- DesvEst", cambio)
cambio = gsub("t", "T", cambio)
cambio = gsub("f", "F", cambio)
colnames(Juntarx) = cambio

Sujeto = JuntarSub
colnames(Sujeto) = "Sujeto"
Acci�n = Juntary
Final = cbind(Sujeto, Acci�n, Juntarx)

#Parte5)

library(dplyr) #debe estar instalado antes
prom_final <- Final %>% group_by(Sujeto,Acci�n) %>% summarise_each(funs(mean))
MediasFinal <- aggregate(Final[, 3:68], list(Final$Acci�n), mean)
write.csv(prom_final,"Promedio de acciones.csv")
write.csv(MediasFinal, "Medias acciones.csv")

write.csv(Final, "Datos Ordenados.csv")
