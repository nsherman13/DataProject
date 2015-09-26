library(shiny)
library(dplyr)
library(ggplot2)
library(engsoccerdata)

shinyServer(
  function(input, output) {
    
    df <- reactive({
      engsoccerdata2 %>%
        filter(Season == input$season, tier == input$tier) %>%
        group_by(Season,home) %>%
        summarise(total_goals = sum(hgoal)) %>%
        arrange(desc(total_goals)) %>%
        select(home,total_goals) %>%
        head(input$top)
    })
    output$tbl <- renderTable({
      d = df()
    })
    output$plot <- renderPlot({
      f_data = df()
      title <- paste("Top",input$top,"Tier",input$tier,"Home Scoring Teams",input$season)
      ggplot(data=f_data, aes(x=home, y=total_goals)) +
        geom_bar(stat="identity", fill = " dark grey") + xlab("Team") + ylab("Total Goals Scored") + ggtitle(title) +  theme(text = element_text(size=20), axis.text.x = element_text(angle=90, vjust=1)) 
    })
    
    output$table <- renderTable({
      d = df()
    },include.rownames=FALSE)
    
  }
)


# Pseudo Code
# print out all inputs
# confirm that data frame can be created properly