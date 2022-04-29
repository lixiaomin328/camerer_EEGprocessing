data <- read.csv('/Users/xiaominli/Documents/Documents/eeg/processing_scripts/sourceDataML/vmpfc728.csv',header=FALSE)
model <- glm(V729~., data = data,family = "binomial")
