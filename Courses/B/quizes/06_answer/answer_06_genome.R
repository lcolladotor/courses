###################################################
### chunk number 1: 
###################################################
library(GenomeGraphs)
data("seqDataEx", package = "GenomeGraphs")
str = seqDataEx$david [,"strand"] == 1 #$
biomart = useMart("ensembl", "scerevisiae_gene_ensembl")
a <- makeGeneRegion(chromosome = "IV", start = 1300000, end = 1310000, strand = "-", biomart = biomart, dp = DisplayPars(plotId = TRUE, idRotation = 0, cex = .5))
b <- makeGenomeAxis(dp = DisplayPars(byValue = 1e3, size = 3))
c <- makeGeneRegion(chromosome = "IV", start = 1300000, end = 1310000, strand = "+", biomart = biomart, dp = DisplayPars(plotId = TRUE, idRotation = 0, cex = .5))
d <- makeBaseTrack(base = seqDataEx$snyder [, "location"], value = seqDataEx$snyder [, "counts"], dp = DisplayPars(lwd = .3, color = "darkblue", ylim = c(0,300)))
e <- makeGenericArray(probeStart = seqDataEx$david [str, "location"], intensity = seqDataEx$david [str, "expr", drop = FALSE], dp = DisplayPars(pointSize = .5))
f <- makeGenericArray(probeStart = seqDataEx$david [!str, "location"], intensity = seqDataEx$david [!str, "expr", drop = FALSE], dp = DisplayPars(color = "darkgreen", pointSize = .5))
g <- makeBaseTrack(base = seqDataEx$nislow [, "location"], value = seqDataEx$nislow [, "evalue"], dp = DisplayPars(color="grey", lwd = .25))
h <- makeBaseTrack(base = seqDataEx$conservation [, "location"], value = seqDataEx$conservation [, "score"], dp = DisplayPars(color="gold4", lwd = .25))

pList <- list("-" = a, b, "+" = c, "Nagalakshmi" = d, "David +" = e, "David -" = f, "Lee" = g, "Conservation" = h) 
rOverlay <- makeRectangleOverlay(start = 1302105, end = 1302190, region = c(4,8), dp = DisplayPars(alpha = .2))
gdPlot(pList, minBase = 1301500, maxBase = 1302500, overlay = rOverlay)


###################################################
### chunk number 2: 
###################################################
a <- makeGeneRegion(chromosome = "IV", start = 1300000, end = 1310000, strand = "-", biomart = biomart, dp = DisplayPars(protein_coding = "darkblue", plotId = TRUE, idRotation = 0, cex = .5))
b <- makeGenomeAxis(dp = DisplayPars(byValue = 1e3, size = 3))
c <- makeGeneRegion(chromosome = "IV", start = 1300000, end = 1310000, strand = "+", biomart = biomart, dp = DisplayPars(protein_coding = "darkblue", plotId = TRUE, idRotation = 0, cex = .5))
d <- makeBaseTrack(base = seqDataEx$snyder [, "location"], value = seqDataEx$snyder [, "counts"], dp = DisplayPars(lwd = .3, color = "yellow", ylim = c(0,300)))
e <- makeGenericArray(probeStart = seqDataEx$david [str, "location"], intensity = seqDataEx$david [str, "expr", drop = FALSE], dp = DisplayPars(color = "purple", pointSize = .5))
f <- makeGenericArray(probeStart = seqDataEx$david [!str, "location"], intensity = seqDataEx$david [!str, "expr", drop = FALSE], dp = DisplayPars(color = "green", pointSize = .5))
g <- makeBaseTrack(base = seqDataEx$nislow [, "location"], value = seqDataEx$nislow [, "evalue"], dp = DisplayPars(color="blue", lwd = .25))
h <- makeBaseTrack(base = seqDataEx$conservation [, "location"], value = seqDataEx$conservation [, "score"], dp = DisplayPars(color="red", lwd = .25))

pList <- list("Conservation" = h, "Lee" = g, "David -" = f, "David +" = e, "Nagalakshmi" = d,  "+" = c, b, "-" = a) 
rOverlay <- makeRectangleOverlay(start = 1302105, end = 1302190, region = c(1,5), dp = DisplayPars(alpha = .2))
tOverlay <- makeTextOverlay("lcollado",  1301900, 0.5, region =c(1,1), dp = DisplayPars(color = "black"))
gdPlot(pList, minBase = 1301500, maxBase = 1302500, overlays = c(rOverlay, tOverlay))


