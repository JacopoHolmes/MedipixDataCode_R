library(raster)

# legge i dati
ff_data <- read.table("percorso/nomefile.txt", quote ="\"", comment.char ="")
View(ff_data)

# matrice e raster dai dati
x<-as.matrix(ff_data)
r<-raster(x)
rr<-clamp(r,0,100)

# creazione dei parametri del frame
xmin=0
xmax=255
ymin=0
ymax=255
extent(rr)<-extent(xmin,xmax,ymin,ymax)

#plotting e salvataggio del grafico
plot(rr, col=hcl.colors(200,"plasma"),xlab="X",ylab="Y",xlim=c(0,255),ylim=c(0,255))
png("raster.png",width=540,height=540,units="px")
plot(rr, col=hcl.colors(200,"plasma"),xlab="X",ylab="Y",xlim=c(0,255),ylim=c(0,255))
dev.off()
