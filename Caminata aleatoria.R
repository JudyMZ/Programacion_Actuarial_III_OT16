x<-0
y<-0
i<-0
 while (i<= 100){
      z<- 5
    while(z>=3 && z<=10){
           print(z)
           moneda<- rbinom(1,1,0.5)
          if (moneda==1){ 
               z<-z+.5
            }else {
                z<- z-.5
               } }
         if (z<10){x<-x+1
        }else{y<-y+1}
       i<-(x+y)}
x # son los de abajo
y # son los de arriba




