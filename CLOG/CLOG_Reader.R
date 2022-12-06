#Prima sostituire quadre e virgole con spazi

library(ggplot2)
library(raster)
theme_set(theme_bw())


dat<-read.table("percorso/nomefile.txt",fill =TRUE , header =FALSE , col.names = paste ("V", seq (1 ,768) , sep =""))
View(dat)

x<-dat[,seq(1,ncol(dat),3)]
y<-dat[,seq(2,ncol(dat),3)]
val<-dat[,seq(3,ncol(dat),3)]

val[is.na(val)]<-0
vnonzero<-val[val!=0]
vm<-as.matrix(val)

vnonzero<-vnonzero[vnonzero<=50]
v<-as.data.frame(vnonzero)
v1<-unlist(v)




perpixel = ggplot(data=v,aes(x = v1))+
     geom_histogram(binwidth=0.5,color="black",fill="white")+
     xlim(0,50)+
    labs(title="per pixel spectrum")+ xlab("Energy [KeV]")+ ylab("Counts")
png("pp.png")
plot(perpixel)
dev.off()




ce<-rowSums(vm)
ce<-as.data.frame(ce)

percluster = ggplot(data=ce,aes(x = ce))+
     geom_histogram(binwidth=0.5,color="black",fill="white")+
     xlim(0,50)+
     labs(title="per cluster spectrum")+ xlab("Energy [KeV]")+ ylab("Counts")
png("pc.png")
plot(percluster)
dev.off()


npmat<-as.data.frame(t(val))
npix<-colSums(npmat!=0)
npix<-as.data.frame(npix)
pix = ggplot(data=npix,aes(x = npix))+
  geom_histogram(binwidth=1,color="black",fill="white")+
    labs(title="pixels per cluster")+ xlab("Cluster size [pixel]")+ ylab("Counts")
png("pix.png")
plot(pix)
dev.off()





X<-as.matrix(x)
Y<-as.matrix(y)
Z<-as.matrix(val)
xx<-as.vector(X)
yy<-as.vector(Y)
zz<-as.vector(Z)
zz<-clamp(zz,0,50)

x1<-xx
y1<-yy
z1<-zz
x1[is.na(x1)]<-0
y1[is.na(y1)]<-0
z1[is.na(z1)]<-0
df<-data.frame(x1,y1,z1)
r<-rasterFromXYZ(df)
xmin=0
xmax=255
ymin=0
ymax=255
extent(r)<-extent(xmin,xmax,ymin,ymax)

png("raster.png",width=540,height=540,units="px")
plot(r, col=hcl.colors(200,"plasma"),xlab="X",ylab="Y",xlim=c(0,255),ylim=c(0,255))
dev.off()
