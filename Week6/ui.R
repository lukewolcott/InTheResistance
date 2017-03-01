library(shiny)
shinyUI(fluidPage(
      titlePanel("US Immigration Enforcement: 'Alien Removal' 2006-2015 by Origin Country and Criminal Status"),
      sidebarLayout(
            sidebarPanel(
                  h4("Choose Criminal status to display:"),
                        checkboxInput("c", "Criminal", value=TRUE),
                        checkboxInput("nc", "Non-Criminal"),
                        checkboxInput("t", "Combined"),
                  h4("Choose origin regions or countries to display:"),
                  tabsetPanel(type="tabs",
                              tabPanel("Regions",
                                    p(em("sorted alphabetically")),
                                    checkboxInput("Rin1", "Africa", value=TRUE),
                                    checkboxInput("Rin2", "Asia"),
                                    checkboxInput("Rin3", "Europe"),
                                    checkboxInput("Rin4", "North America"),
                                    checkboxInput("Rin5", "Oceania"),
                                    checkboxInput("Rin6", "South America"),
                                    checkboxInput("Rin7", "Total")
                              ),
                              tabPanel("Countries",
                                       p(em("sorted in decreasing order of annual average; top 30 only")),
                                       checkboxInput("Cin0", "Total", value=TRUE),
                                       checkboxInput("Cin1", "Mexico"),
                                       checkboxInput("Cin2", "Guatemala"),
                                       checkboxInput("Cin3", "Honduras", value=TRUE),
                                       checkboxInput("Cin4", "El Salvador"),
                                       checkboxInput("Cin5", "Brazil"),
                                       checkboxInput("Cin6", "Dominican Republic"),
                                       checkboxInput("Cin7", "Colombia"),
                                       checkboxInput("Cin8", "Ecuador"),
                                       checkboxInput("Cin9", "Nicaragua"),
                                       checkboxInput("Cin10", "Jamaica"),
                                       checkboxInput("Cin11", "Canada"),
                                       checkboxInput("Cin12", "Peru"),
                                       checkboxInput("Cin13", "China"),
                                       checkboxInput("Cin14", "Haiti"),
                                       checkboxInput("Cin15", "India"),
                                       checkboxInput("Cin16", "Philippines"),
                                       checkboxInput("Cin17", "Costa Rica"),
                                       checkboxInput("Cin18", "Nigeria"),
                                       checkboxInput("Cin19", "Poland"),
                                       checkboxInput("Cin20", "United Kingdom"),
                                       checkboxInput("Cin21", "South Korea"),
                                       checkboxInput("Cin22", "Venezuela"),
                                       checkboxInput("Cin23", "Trinidad and Tobago"),
                                       checkboxInput("Cin24", "Argentina"),
                                       checkboxInput("Cin25", "Pakistan"),
                                       checkboxInput("Cin26", "Indonesia"),
                                       checkboxInput("Cin27", "Israel"),
                                       checkboxInput("Cin28", "Guyana"),
                                       checkboxInput("Cin29", "Bolivia"),
                                       checkboxInput("Cin30", "Belize")
                              )
                  )
            ),
            mainPanel(
                  tabsetPanel(type = "tabs", 
                              tabPanel("Introduction",
                                       br(),
                                       p(em("In late February 2017 the Trump Administration announced new immigration policies
                                         regarding deportation of undocumented immigrants.  Part of the new 
                                          policies change how people with criminal records are treated.  I thought it would be
                                         interesting to look at trends over time of rates of removal of these 'aliens'.
                                         A good summary of the policy changes is here:")),
                                       code("https://www.nytimes.com/2017/02/21/us/trump-immigration-policies-deportation.html"),
                                       h4("What is this dataset? Where is it from?"),
                                       em("The data come from the following Department of Homeland Security website."),
                                       br(),
                                       code("https://www.dhs.gov/immigration-statistics/enforcement-actions"),
                                       br(),
                                       br(),
                                       em("I downloaded Table 41d for the fiscal year 2015.  This file was then cleaned up
                                          to be read into the Shiny code.  The data files are available at the Github
                                          repo corresponding to this project."),
                                       br(),
                                       br(),
                                       h4("How do I use this website?"),
                                       em("On the sidebar, select the status of alien that 
                                          you're interested in.  Select any geographical regions and countries.
                                          The plot, which appears in
                                          the PLOT tab, will update automatically.")
                              ),
                              tabPanel("PLOT",
                                    br(), 
                                    plotOutput("plt")
                              ) 
                  )
            )
      )
))