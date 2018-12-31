### Assess dependencies between scripts
# O.L. Pescott
# 31.12.2018

install.packages('CodeDepends')
install.packages('highlight')
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("graph", version = "3.8")
BiocManager::install("Rgraphviz", version = "3.8")
library(CodeDepends)
library(highlight)
library(Rgraphviz)

test <- readScript(doc = "Sim_functions.r")
highlightCode(obj = "Sim_functions.r", "foo.html", checkURLs=FALSE)

out <- makeTaskGraph(doc = "Sim_functions.r", frags = test, info = as(test, "ScriptInfo"))

gg = layoutGraph(out, layoutType = "twopi") # "dot"   "circo" "fdp"   "neato" "osage" "twopi"
graph.par(list(nodes = list(fontsize=55)))
renderGraph(gg) ## could also call plot directly
#dev.off()
