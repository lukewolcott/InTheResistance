library(shiny)
library(dplyr)
library(ggplot2)
library(reshape2)
shinyServer(function(input, output) {
      select_regions <- reactive({
            slctR = c(input$Rin1, input$Rin2, input$Rin3, input$Rin4,
                     input$Rin5, input$Rin6, input$Rin7)
            regions <- c("Africa", "Asia", "Europe",
                           "North.America", "Oceania",
                           "South.America", "RegionTotal")
            regions[slctR]
      })

      select_countries <- reactive({
            slctC = c(input$Cin0, input$Cin1, input$Cin2, input$Cin3, input$Cin4,
                      input$Cin5, input$Cin6, input$Cin7, input$Cin8,
                      input$Cin9, input$Cin10, input$Cin11, input$Cin12,
                      input$Cin13, input$Cin14, input$Cin15, input$Cin16,
                      input$Cin17, input$Cin18, input$Cin19, input$Cin20,
                      input$Cin21, input$Cin22, input$Cin23, input$Cin24,
                      input$Cin25, input$Cin26, input$Cin27, input$Cin28,
                      input$Cin29, input$Cin30) 
            countries <- c("CountryTotal", "Mexico", "Guatemala",
                         "Honduras", "El.Salvador", "Brazil",
                         "Dominican.Republic", "Colombia","Ecuador",
                         "Nicaragua","Jamaica","Canada",
                         "Peru","China..People.s.Republic","Haiti","India",
                         "Philippines","Costa.Rica","Nigeria",
                         "Poland","United.Kingdom","Korea..South",
                         "Venezuela","Trinidad.and.Tobago","Argentina",
                         "Pakistan","Indonesia","Israel","Guyana",
                         "Bolivia","Belize")
            countries[slctC]
      })

      # import region CSVs      
      dataRT <- read.csv("fy2015_table41d_cleaned_Total_rt.csv",na.strings = c("NA", "-", "D","X"))
      dataRC <- read.csv("fy2015_table41d_cleaned_Criminal_rt.csv",na.strings = c("NA", "-", "D","X"))
      dataRNC <- read.csv("fy2015_table41d_cleaned_NonCriminal_rt.csv",na.strings = c("NA", "-", "D","X"))
      
      # import country CSVs      
      dataCT <- read.csv("fy2015_table41d_cleaned_Total_ct.csv",na.strings = c("NA", "-", "D","X"))
      dataCC <- read.csv("fy2015_table41d_cleaned_Criminal_ct.csv",na.strings = c("NA", "-", "D","X"))
      dataCNC <- read.csv("fy2015_table41d_cleaned_NonCriminal_ct.csv",na.strings = c("NA", "-", "D","X"))
      
      output$plt <- renderPlot({
            
            # FOR REGIONS
            #select_rgns <- c("Africa", "Asia", "Oceania")
            select_rgns <- select_regions()
            # subset for selected regions     
            shortDataRC <- dataRC[,c("Year",select_rgns)]
            shortDataRNC <- dataRNC[,c("Year",select_rgns)]
            shortDataRT <- dataRT[,c("Year",select_rgns)]
            meltRC <- melt(shortDataRC, id="Year")
            meltRNC <- melt(shortDataRNC, id="Year")
            meltRT <- melt(shortDataRT, id="Year")
            # add status labels and combine
            meltRC$Status <- "Criminal"
            meltRNC$Status <- "NonCriminal"
            meltRT$Status <- "Total"
            # melt <- rbind(meltRC,meltRNC,meltRT)
            
            # FOR COUNTRIES
            #select_cnts <- c("Honduras", "Guatemala")
            select_cnts <- select_countries()
            # subset for selected countries
            shortDataCC <- dataCC[,c("Year",select_cnts)]
            shortDataCNC <- dataCNC[,c("Year",select_cnts)]
            shortDataCT <- dataCT[,c("Year",select_cnts)]
            meltCC <- melt(shortDataCC, id="Year")
            meltCNC <- melt(shortDataCNC, id="Year")
            meltCT <- melt(shortDataCT, id="Year")
            # add status labels and combine
            meltCC$Status <- "Criminal"
            meltCNC$Status <- "NonCriminal"
            meltCT$Status <- "Total"
            #meltCnts <- rbind(meltCC,meltCNC,meltCT)
            
            # SUBSETS BASED ON CRIM/NON-CRIM/COMBINED CHECKLIST
            if (input$c){
                  if (input$nc){
                        if (input$t){
                              meltRgns <- rbind(meltRC,meltRNC,meltRT)
                              meltCnts <- rbind(meltCC,meltCNC,meltCT)
                        }
                        else{
                              meltRgns <- rbind(meltRC,meltRNC)
                              meltCnts <- rbind(meltCC,meltCNC)
                        }
                  }
                  else{
                        if (input$t){
                              meltRgns <- rbind(meltRC,meltRT)
                              meltCnts <- rbind(meltCC,meltCT)
                        }
                        else{
                              meltRgns <- meltRC
                              meltCnts <- meltCC
                        }
                  }
            }
            else{
                  if (input$nc){
                        if (input$t){
                              meltRgns <- rbind(meltRNC,meltRT)
                              meltCnts <- rbind(meltCNC,meltCT)
                        }
                        else{
                              meltRgns <- meltRNC
                              meltCnts <- meltCNC
                        }
                  }
                  else{
                        if (input$t){
                              meltRgns <- meltRT
                              meltCnts <- meltCT
                        }
                        else{
                              meltRgns <- NULL
                              meltCnts <- NULL
                        }
                  }
            }
            names(meltRgns)[2:3] <- c("RegionOrCountry","Number")
            names(meltCnts)[2:3] <- c("RegionOrCountry","Number")
            
            
            # FINAL PLOT CODE
            g <- ggplot()
            g <- g + geom_line(data=meltRgns, aes(Year,Number,color=RegionOrCountry,linetype=Status))
            g <- g+geom_line(data=meltCnts, aes(Year,Number,color=RegionOrCountry,linetype=Status))
            g
      })
})

