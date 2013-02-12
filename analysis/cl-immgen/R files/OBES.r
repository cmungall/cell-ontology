signature <- function(g) 
{ setwd(paste("/Users/tmeehan/Documents/CL-immgene/B-cell\ genes/", g, "/", sep=""))
	annot = read.csv(file = "/Users/tmeehan/Documents/CL-immgene/mouseSTannot2.csv");
	{
	mylist <- list()
	z <- scan(file="z.txt", what=character()) 
	for(i in z) 
		{
		a <- paste(i, "txt", sep = ".") 
		b <- read.delim(file=paste("/Users/tmeehan/Documents/CL-immgene/pairwise-comparisons/", a, sep="")) 
		c <- b[b$adj.P.Val < 0.05,] 
		mylist[[i]] <- c$ID
		}
	x <- function(q) Reduce('intersect', q) 
	ID <- x(mylist[1:length(z)]) 
	if (length(ID) == 0) {print("No unique up-regulated genes identified"); write.table(ID, file=paste(g, "-NO-UP-UNIQ.xls", sep=""), sep="\t") } else {
		q <- as.data.frame(ID) 
		for(i in z) 
			{
			d <- paste(i, "txt", sep = ".") 
			e <- read.delim(file=paste("/Users/tmeehan/Documents/CL-immgene/pairwise-comparisons/", d, sep="")) 
			f1 <- e[e$ID %in% ID,]
			f <- f1[,1:2] 
			q <- merge(q,f, by="ID")
			}
		q1 <- as.data.frame(q[2:(length(z)+1)], row.names=q$ID)
		q2 <- abs(q1) 
		q3 <- 2^(q2) 
		FoldChange <- apply(q3, 1, mean)
		Stdv <- apply(q3,1,sd)
		q5 <-cbind(FoldChange,Stdv)
		q5 <- as.data.frame(q5)
		q6 <- q5[rev(order(q5$FoldChange)),]
		q7 <- as.data.frame(q6)
		AffyID <- as.vector(row.names(q7))
		q9 <- cbind(AffyID,q7)
		probes2annot = match(q9$AffyID, annot$ID)
		entrezIDs = annot$Entrez_Gene_ID[probes2annot];
		mgiID = annot$MGI_Marker_ID[probes2annot];
		symbol = annot$Symbol[probes2annot]
		allids = cbind(q7,symbol,entrezIDs,mgiID)
		print(allids)
		write.table(allids, file=paste(g, "-up.xls", sep=""), sep="\t", col.names=NA)
		s <- as.vector(allids$mgiID)
		write(s, file=paste(g, "-up-MGI.txt", sep=""), sep=",")
		# genes = as.integer( annot$Entrez_Gene_ID %in% allids$entrezIDs)
		# names(genes) = annot$Symbol
		# print(table(genes))
		}
	{
		mylist <- list()
		w1 <- gsub("u","a", z); w2 <- gsub("d","u", w1); w <- gsub("a","d", w2)
		for(i in w) 
		{
		a <- paste(i, "txt", sep = ".") 
		b <- read.delim(file=paste("/Users/tmeehan/Documents/CL-immgene/pairwise-comparisons/", a, sep="")) 
		c <- b[b$adj.P.Val < 0.05,] 
		mylist[[i]] <- c$ID
		}
	x <- function(q) Reduce('intersect', q) 
	ID <- x(mylist[1:length(w)])
	if (length(ID) == 0) {print("No unique down-regulated genes identified"); write.table(ID, file=paste(g, "-NO-DOWN-UNIQ.xls", sep=""), sep="\t")  } else {
		h <- as.data.frame(ID) 
		for(i in w) 
			{
			d <- paste(i, "txt", sep = ".") 
			e <- read.delim(file=paste("/Users/tmeehan/Documents/CL-immgene/pairwise-comparisons/", d, sep="")) 
			f1 <- e[e$ID %in% ID,]
			f <- f1[,1:2] 
			h <- merge(h,f, by="ID")
			}
		h1 <- as.data.frame(h[2:(length(w)+1)], row.names=h$ID)
		h2 <- abs(h1) 
		h3 <- 2^(h2) 
		FoldChange <- apply(h3, 1, mean)
		Stdv <- apply(h3,1,sd)
		h5 <-cbind(FoldChange,Stdv)
		h5 <- as.data.frame(h5)
		h6 <- h5[rev(order(h5$FoldChange)),]
		h7 <- as.data.frame(h6) 
		AffyID <- as.vector(row.names(h7))
		h9 <- cbind(AffyID,h7)
		probes2annot = match(h9$AffyID, annot$ID)
		entrezIDs = annot$Entrez_Gene_ID[probes2annot];
		mgiID = annot$MGI_Marker_ID[probes2annot];
		symbol = annot$Symbol[probes2annot]
		allids = cbind(h7,symbol,entrezIDs,mgiID)
		print(allids)
		write.table(allids, file=paste(g, "-down.xls", sep=""), sep="\t", col.names=NA)
		s <- as.vector(allids$mgiID)
		write(s, file=paste(g, "-down-MGI.txt", sep=""), sep=",")
		# genes = as.integer( annot$Entrez_Gene_ID %in% allids$entrezIDs)
		# names(genes) = annot$Symbol
		# print(table(genes))
		}
	}
}
}