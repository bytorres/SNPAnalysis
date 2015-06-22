
t<-numeric(0)
chosen_idx<-c(3,7,14,15,18,22,24)
chosen_idx1<-c(29,30,12,35,49)

#Making changes to see if its being recognized
i=1
for(n in 1:length(chosen_idx1))
{
  n
  a<-as.data.frame(table(nksnp_data[,chosen_idx1[n]])) # Tally on # of 0,1,2
  NKG7_nm<-NKG7[which(as.numeric(nksnp_data[,chosen_idx1[n]])==2)]
  RBC_nm<-RBC[which(as.numeric(nksnp_data[,chosen_idx1[n]])==2)]
  variance_2<-sqrt(var(NKG7_nm)+var(RBC_nm))
  
  
  
  if (variance_2 < 1.5 && !is.na(variance_2) ) ## a[3,2] >10
  {
    
    variance_2
    quartz(width=3,height=6.5)
    #print(variance_2)
    #print(a[3,2])
    t[i]<-nktop_snps_symbol[n]
    t0<-qplot(NKG7,RBC) + geom_point(color=ifelse(nksnp_data[,chosen_idx1[n]]=='0',"#86B875",rgb(0.75, 0.75, 0.75,alpha=.5)),size=3)+labs(title=nktop_snps_symbol[chosen_idx1[n]])
    t1<-qplot(NKG7,RBC) + geom_point(color=ifelse(nksnp_data[,chosen_idx1[n]]=='1','#4CB9CC','gray'),size=3) 
    t2<-qplot(NKG7,RBC) + geom_point(color=ifelse(nksnp_data[,chosen_idx1[n]]=='2','#CD99D8',rgb(0.75, 0.75, 0.75,alpha=.5)),size=3)
    multiplot(t0,t1,t2)
    remove(t0,t1,t2)
    i=i+1
  }
  
  
}

#snp_query_topresid<-NCBI_snp_query(t)


## Check how many of the hits have more than ten samples equal to 2
#b<-numeric(0)
#c<-numeric(0)


#for(n in 1:length(chosen_idx1))
#{

#a<-as.data.frame(table(nksnp_data[,chooosen_idx[n]])

#b[n]<-a[3,2]
#t[n]<-n
#NKG7_nm<-NKG7[which(as.numeric(nksnp_data[,chosen_idx1[n]])==2)]
#RBC_nm<-RBC[which(as.numeric(nksnp_data[,chosen_idx1[n]])==2)]
#variance_2<-sqrt(var(NKG7_nm)+var(RBC_nm))
#c[n]<-variance_2
#remove(RBC_nm)
#remove(NKG7_nm)

#}


#table(b>10)

