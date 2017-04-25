library(shiny)
shinyServer(function(input, output) {
      library(foreign)
      data <- read.spss("Dataset - Pew Research Center 2014 Religious Landscape Study National Telephone Survey - Version 1.1 - December 1 2016.sav", to.data.frame = TRUE)
      data <- data[,c(29,74,102:105,131,172:178,180,186,189,191,198)]
      christian_denoms <- c("Evangelical Protestant Tradition", "Mainline Protestant Tradition", "Historically Black Protestant Tradition", "Catholic", "Mormon", "Orthodox Christian", "Jehovah's Witness", "Other Christian")
      other_denoms <- c("Hindu", "Other World Religions", "Other Faiths", "Don't know/refused - no information on religious identity")
      
      # 6 bins for respondent religion
      data$RELTRAD6 <- as.character(data$RELTRAD)
      data$RELTRAD6[data$RELTRAD6 %in% christian_denoms] <- "Christian"
      data$RELTRAD6[data$RELTRAD6 %in% other_denoms] <- "Other"
      data$RELTRAD6[data$RELTRAD6 == "Unaffiliated (religious \"nones\")"] <- "None"
      data$RELTRAD6 <- as.factor(data$RELTRAD6)
      
      # 6 bins for childhood religion
      data$CHRELTRAD6 <- as.character(data$CHRELTRAD)
      data$CHRELTRAD6[data$CHRELTRAD6 %in% christian_denoms] <- "Christian"
      data$CHRELTRAD6[data$CHRELTRAD6 %in% other_denoms] <- "Other"
      data$CHRELTRAD6[data$CHRELTRAD6 == "Unaffiliated (religious \"nones\")"] <- "None"
      data$CHRELTRAD6 <- as.factor(data$CHRELTRAD6)
      
      # variable to detect if religion changed from childhood religion
      data$KEPTREL <- (data$RELTRAD6 == data$CHRELTRAD6)
      
      data <- data[,-c(2,7,21)]
      dataC <- data
      dataC$CHRISTIAN <- as.character(dataC$RELTRAD6)
      dataC$CHRISTIAN[dataC$CHRISTIAN != "Christian"] <- "non-Christian"
      dataC$CHRISTIAN <- as.factor(dataC$CHRISTIAN)
      
      # throw out previous output RELTRAD6
      dataC <- dataC[,-18]

      # fitting model
      set.seed(134)
      p <- 0.8
      inTrain <- sample(1:nrow(data), nrow(data)*p)
      trainingC <- dataC[inTrain,]
      testC <- dataC[-inTrain,]
      
      fitC <- glm(CHRISTIAN ~ ., family = binomial,data=trainingC)

      modelpred <- reactive({
            user = data.frame(qa1 = input$qa1,
                              qi4a = input$qi4a,
                              qi4b = input$qi4b,
                              qi4c = input$qi4c,
                              qi4d = input$qi4d,
                              qm5a = input$qm5a,
                              qm5b = input$qm5b,
                              qm5d = input$qm5d,
                              qm5e = input$qm5e,
                              qm5f = input$qm5f,
                              qm5g = input$qm5g,
                              agerec = input$agerec,
                              educ = input$educ,
                              income = input$income,
                              party = input$party,
                              ideo = input$ideo,
                              SEX = input$SEX,
                              KEPTREL = as.logical(input$KEPTREL))
            x <- predict(fitC, newdata = user)
            ifelse(x > 0.5, "Christian", "non-Christian")
      })      
      
      output$religion <- renderText({
            modelpred()
      })
})