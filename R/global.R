library("tm")
library("wordcloud")
library("memoise")


getTermMatrix <- function(uInput){
  
  ##info <- readLines("./SampleData/testing.txt",encoding = "UTF8")
  
  info <- uInput
  
  myCorpus = Corpus(VectorSource(info))
  
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeWords, c(stopwords("english"),"the","kind","these"))
  
  
  myDTM = TermDocumentMatrix(myCorpus, control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
  
}

