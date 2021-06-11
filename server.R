server <- function(input, output, session) {

## --------------------
## /* Sidebar */
## --------------------
  
  # Return Home (clear all UI and reset)
  # -----------------------------------
  observeEvent(input$home, {
    refresh()
  })

## --------------------
## /* Landing Page */
## --------------------
  
  # Disclaimer pop-up
  # -----------------
  landing_pop <- TRUE 
  
  observeEvent(
    once = TRUE,
    ignoreNULL = FALSE, 
    ignoreInit = TRUE,
    eventExpr = input$run_calc, 
    { 
      showModal(
        
        # Pop-up design and layout
        # ------------------------
        modalDialog(
          fade = FALSE,
          title = tags$span(
            img(
              src="caution.png", 
              width = 52, height = 52
            ), style = "
              padding:45%;
            "
          ),
          h2(
            "DISCLAIMER", 
            align = "center"
          ),
          
          p(
            "
            Disclaimer
            This COVID-19 patient expression severity calculator has been 
            produced by a group of Data Science students for the sole purpose 
            of demonstrating the predictive potential of RNA sequence data. 
            The statements and recommendations it contains are stricty non-advisory,
            and interpretation of results should be considered in an educational 
            context and by no means as legitimate medical advice.
            
            Whilst care has been taken in the preparation of the content used to 
            create this calculator, the creators of this tool cannot accept any
            liability, including for any loss or damage, resulting from the reliance
            on the content, or for its accuracy, completeness, and currency.
            ",
            style = "
              text-align:center;
            "
          ),
          
          footer = tagList(
            modalButton("Accept")
          )
        )
      )
    }
  )
  
## --------------------
## /* The Calculator */
## --------------------
  
  # Glide Custom Controls
  # ---------------------
  controls <- glideControls(
    list(
      tags$button(
        id = 'glidebtnp',
        class = "btn prev-screen",
        style = "
          border-radius:21px;background-color:#ec5565;
          width:42px;height:42px;
          padding:0px;margin-right:13px;
        "
      )
    ),
    
    list(
      tags$button(
        id = 'glidebtnn',
        class = "btn next-screen",
        style = "
          border-radius:21px;background-color:#ab91ea;
          width:42px;height:42px;
          padding:0px
        "
      )
    )
  )
  
  # Glide Page Setup and Styling
  # ----------------------------
  calculator_inputs <- fluidRow(
    id = "calculator_inputs",

    column(
      12,
      div(
        glide(
          custom_controls = controls,
          next_label = tags$img(
            src = "right-arrow.png", 
            width = "40px", height = "40px", 
            style = "padding:0px;"
          ),
          previous_label = tags$img(
            src = "left-arrow.png", 
            width = "40px", height = "40px"
          ),
          height = "60vh",
          
          # Page 1: Clinical Info
          # ---------------------
          screen(
            
            h3(
              "Patient Information",
              align = "center",
              style = "
                font-family:'Arial', san-serif;
                color: #9fb0c7; text-size:20;font-weight:bold;
                text-shadow: 0px 1px 1px #fafcff;
                margin-left:0px;
              "
            ),
            
            div(
              h5(
                "Demographic", 
                align = "center",
                style = "
                  font-family:'Arial', san-serif;
                  color: #9fb0c7; text-size:20;font-weight:bold;
                  text-shadow: 0px 1px 1px #fafcff; 
                "
              ),
              fluidRow(
                fluidRow(
                  style = "
                    position:absolute;box-shadow: 0 0 35px #14ebff11;
                    width:25%;height:12%;margin-left:4%;
                    border-radius: 15px; background-color:#ffffff;
                  "
                ),
                fluidRow(
                  column(
                    6,
                    uiOutput("male", style = "height:100%"),
                    align = "right",
                    style = "
                      padding:0px;
                    "
                  ),
                  
                  column(
                    6,
                    uiOutput("female", style = "height:100%"),
                    align = "left",
                    style = "
                      padding:0px;
                    "
                  ),
                  style = "
                    position:absolute;
                    width:25%;height:12%;margin-left:4%;
                    border-radius: 15px;
                  "
                ),
                style = "
                  height:15%;
                  padding:1.5%;
                "
              ),
              
              fluidRow(
                h5(
                  "Age", 
                  align = "center",
                  style = "
                  font-family:'Arial', san-serif;
                  color: #9fb0c7; text-size:20;font-weight:bold;
                  text-shadow: 0px 1px 1px #fafcff;
                  margin-left:15.5%;
                  position:absolute;
                "
                ),
                fluidRow(
                  style = "
                    position:absolute;box-shadow: 0 0 16px #14ebff11;
                    width:12.75%;height:8%;margin-left:10.1%;margin-top:1.05%;
                    border-radius: 10px; background-color:#ffffff;
                  "
                ),
                fluidRow(
                  column(
                    12,
                    uiOutput("age"),
                    align = "center"
                  ),
                  style = "
                    position:absolute;
                    width:25%;height:10%;margin-left:4%;margin-top:1.2%;
                    border-radius: 15px;
                  "
                ),
                style = "
                  height:15%;
                  padding:1.5%;margin-top:1%;
                "
              ),
              
              h5(
                "Pre-existing Conditions", 
                align = "center", 
                style = "
                  margin-top:2%;
                  font-family:'Arial', san-serif;
                  color: #9fb0c7; text-size:20;font-weight:bold;
                  text-shadow: 0px 1px 1px #fafcff;
                "
              ),
              
              fluidRow(
                fluidRow(
                  style = "
                    position:absolute;box-shadow: 0 0 45px #14ebff11;
                    width:25%;height:42%;margin-left:4.5%;margin-top:0.5%;
                    border-radius: 15px; background-color:#ffffff;
                  "
                ),
                fluidRow(
                  fluidRow(
                    column(
                      6,
                      uiOutput("diabetes", style = "height:100%;"),
                      align = "right",
                      style = "
                        padding:0px; padding-top:0%;
                      "
                    ),
                    column(
                      6,
                      uiOutput("chron_renal", style = "height:100%;"),
                      align = "left",
                      style = "
                        padding:0px; padding-top:0%;
                      "
                    ),
                    style = "
                      height:33.333%;width:100%;margin:0px;
                    "
                  ),
                  
                  fluidRow(
                    column(
                      6,
                      uiOutput("chron_heart", style = "height:100%;"),
                      align ="right",
                      style = "
                        padding:0px;
                      "
                    ),
                    column(
                      6,
                      uiOutput("coronary_heart", style = "height:100%;"),
                      align ="left",
                      style = "
                        padding:0px;
                      "
                    ),
                    style = "
                      height:33.333%;width:100%;
                      margin:0px;
                    "
                  ),
                  
                  fluidRow(
                    column(
                      6,
                      uiOutput("hypothyroid", style = "height:100%;"),
                      align = "right",
                      style = "
                        padding:0px;
                      "
                    ),
                    column(
                      6,
                      uiOutput("hypertension", style = "height:100%;"),
                      align = "left",
                      style = "
                        padding:0px;
                      "
                    ),
                    style = "
                      height:33.333%;width:100%;margin:0px;
                    "
                  ),
                  style = "
                    position:absolute;
                    width:25%;height:42%;margin-left:4.5%;margin-top:0.5%;
                    border-radius: 15px;
                  "
                ),
                style = "height:75%;"
              ),
              style = "
                width:100%;height:100%;
                padding-left:0px;
              "
            )
          ),
          
          # Page 2: Omics Upload
          # ---------------------
          screen(
            div(
              h1(
                "RNA Sequencing Data", 
                align ="center",
                style = "
                  font-family:'Arial', san-serif;
                  color: #9fb0c7; text-size:20;font-weight:bold;
                  text-shadow: 0px 1px 1px #fafcff;
                "
              ),
              div(
                fluidRow(
                  p(
                    "
                    This calculator is largely dependent on the data collected by a
                    whole blood transcriptome. The risk model implemented by this product
                    is trained on bulk RNA sequencing data collected from various studies
                    and relating to patients with varying expressions of severity.
                    
                    As such, the providing of this data is cruicial for a patient severity 
                    prediction to be made. Below, patient RNA sequencing data can be chosen 
                    and uploaded. Please note, this calculator expects data to be in tablular
                    form and only excepts csv files at present.
                    ",
                    style = "
                      font-family:'Arial', san-serif;
                      text-size:16;color: #193b65;
                    ",
                    align = "center"
                  ),
                  style = "
                    width:90%; height:50%;
                    margin-left:5%;margin-top:6%;
                  "
                ),
                fluidRow(
                  id = "filerow",
                  fileInput(
                    "file",
                    NULL,
                    placeholder = "Select a file...",
                    width = '100%',
                    accept = c(
                      "text/csv",
                      "text/comma-separated-values,text/plain",
                      ".csv"
                    )
                  ),
                  style = "
                    width:35%;height:13%;
                    padding-left:2%;padding-top:1.3%;padding-right:2%;
                    margin-left:32.5%;
                    border-radius: 10px; background-color:#ffffff;
                    box-shadow: 0 0 20px #afafaf44;
                  "
                ),
                style = "
                  position:absolute;box-shadow: 0 0 40px #14ebff11;
                  width:30%;height:80%;
                  margin-left:1.5%;margin-top:1%;
                  border-radius: 15px; background-color:#fff;
                "
              )
            )
          ),
          
          screen(
            fluidRow(
              column(
                id = "panel",
                6,
                h4(
                  tags$span(
                    "Clinical Data  ",
                    tags$img(
                      src = "power.png", 
                      width = "20px", height = "20px"
                    )
                  ),
                  hr(),
                  align = "center",
                  style = "
                    font-family:'Arial', san-serif;
                    color: 193b65;
                  "
                ),
                tableOutput("clin_tbl"),
                align = "center",
                style = "
                  background-color:#fff; box-shadow: 0 0 20px #afafaf44;
                  height:45vh; width:15%; position:absolute;
                  border-radius:15px; padding:1%;
                  margin-left:1%; margin-top:0.4%;
                "
              ),
              
              column(
                id = "panel",
                6,
                h4(
                  uiOutput("omic_check"),
                  hr(),
                  align = "center"
                ),
                uiOutput("omics_supplied"),
                align = "center",
                style = "
                  background-color:#fff; box-shadow: 0 0 20px #afafaf44;
                  height:45vh; width:15%; position:absolute;
                  border-radius:15px; padding:1%; 
                  margin-left:18%; margin-top:0.4%;
                "
              )
            ),
            fluidRow(
              column(
                12,
                actionButton(
                  "sbmt_data", 
                  tags$img(
                    src = "brain.png",
                    width = "60px", height = "60px"
                  ),
                  style = "
                    background-color:#fff; box-shadow: 0 0 20px #afafaf44;
                    width:200px;height:100px;
                    border-radius:12px;border-width:0px;
                  "
                ),
                align = "center",
                style = "margin-top:48vh;"
              )
            )
          )
        ),
        style="
          padding:50px; background-color:#e8ebef;
          border-radius:30px;width:75vw;height:75vh;
          margin-left:10vw;margin-right:10vw; margin-top:10vh;
          box-shadow: 0 0 70px #112945;
        "
      )
    ),
    style = "
      position:absolute; top:0;
      width:5%;height:5%;
    "
  )

  ## ----------------------------------
  ## /* Calculator Reactive Elements */
  ## ---------------------------------
  
  # Button State Styles
  # -------------------
  border_rad <- "15px;"
  
  clicked_style <- "
    color:#14a5ff; font-weight:bold;
    font-family:'Arial', san-serif;
    background-color:#e8ebef;
    width:100%;height:100%;
    border-radius:0px;border-width:0px;
  "
  
  std_style <- "
    color:#193b65
    font-family:'Arial', san-serif;
    background-color:#ffffff;
    width:100%;height:100%;
    border-radius:0px;border-width:0px;
  "
  
  # Click watcher
  # -------------
  calculator_button <- reactiveValues(
    run_clicked = FALSE, submit_clicked = FALSE,
    maleclicked = FALSE, femaleclicked = FALSE,
    diabclicked = FALSE, renalclicked = FALSE,
    heartclicked = FALSE, coronaryclicked = FALSE,
    thyroidclicked = FALSE, tensionclicked = FALSE
  )
  
  # Clinical data storage
  # ---------------------
  clin_values <- reactiveValues(
    sex = "NB", age = 0,
    diabetes = FALSE, chron_renal = FALSE,
    chron_heart = FALSE, coronary_heart = FALSE,
    hypothyroid = FALSE, hypertension = FALSE
  )
  
  
  
  # Button event to open the calculator
  # ----------------------------------
  observeEvent(input$run_calc, {
    if (calculator_button$run_clicked) {
      calculator_button$run_clicked <- FALSE
      
    } else {
      calculator_button$run_clicked <- TRUE
      removeUI(
        selector = "#result_out"
      )
      insertUI(
        selector = "#body",
        where = "beforeEnd",
        ui = calculator_inputs
      )
    }
     
  })


  
# Data Intake
# --------------------------------
  
  # Sex > Male
  # ----------
  observeEvent(input$male, {
    if(calculator_button$maleclicked){
      calculator_button$maleclicked <- FALSE
      clin_values$sex <- "NB"
      
    } else {
      calculator_button$femaleclicked <- FALSE
      calculator_button$maleclicked <- TRUE
      clin_values$sex <- "M"
    }
  })
  
  output$male <- renderUI({
    if(calculator_button$maleclicked){
      actionButton(
        inputId = "male", 
        label = "Male",
        style = paste(
          clicked_style, 
          "border-top-left-radius:", border_rad, 
          "border-bottom-left-radius:", border_rad
        )
      )
    } else {
      actionButton(
        inputId = "male", 
        label = "Male",
        style = paste(
          std_style, 
          "border-top-left-radius:", border_rad, 
          "border-bottom-left-radius:", border_rad
        )
      )
    }
  })
  
  # Sex > Female
  # ------------
  observeEvent(input$female, {
    if(calculator_button$femaleclicked){
      calculator_button$femaleclicked <- FALSE
      clin_values$sex <- "NB"
      
    } else {
      calculator_button$maleclicked <- FALSE
      calculator_button$femaleclicked <- TRUE
      clin_values$sex <- "F"
    }
    
  })
  
  output$female <- renderUI({
    if(calculator_button$femaleclicked){
      actionButton(
        inputId = "female", 
        label = "Female",
        style = paste(
          clicked_style, 
          "border-top-right-radius:", border_rad,
          "border-bottom-right-radius:", border_rad
        )
      )
    } else {
      actionButton(
        inputId = "female", 
        label = "Female",
        style = paste(
          std_style, 
          "border-top-right-radius:", border_rad,
          "border-bottom-right-radius:", border_rad
        )
      )
    }
  })
  
  
  # Patient Age bracket
  # -------------------
  observeEvent(input$age, {
      clin_values$age <- input$age
  })
  
  output$age <- renderUI({
    numericInput(
      inputId = "age",
      label = NULL,
      value = NULL,
      min = 0,
      max = 150
    )
  })
  
  
  # Pre-existing Conditions > Diabetes Type 2
  # -----------------------------------------
  observeEvent(input$diabetes, {
    if(calculator_button$diabclicked){
      calculator_button$diabclicked <- FALSE
      clin_values$diabetes <- FALSE
      
    } else {
      calculator_button$diabclicked <- TRUE
      clin_values$diabetes <- TRUE
    }
  })
  
  output$diabetes <- renderUI({
    if(calculator_button$diabclicked){
      actionButton(
        inputId = "diabetes", 
        label = "Diabetes",
        style = paste(clicked_style, "border-top-left-radius:", border_rad)
      )
    } else {
      actionButton(
        inputId = "diabetes", 
        label = "Diabetes",
        style = paste(std_style, "border-top-left-radius:", border_rad)
      )
    }
  })
  
  # Pre-existing Conditions > Chronic Renal Disease
  # -----------------------------------------------
  observeEvent(input$chron_renal, {
    if(calculator_button$renalclicked){
      calculator_button$renalclicked <- FALSE
      clin_values$chron_renal <- FALSE
      
    } else {
      calculator_button$renalclicked <- TRUE
      clin_values$chron_renal <- TRUE
    }
  })
  
  output$chron_renal <- renderUI({
    if(calculator_button$renalclicked){
      actionButton(
        inputId = "chron_renal", 
        label = "Chronic Renal Disease",
        style = paste(clicked_style, "border-top-right-radius:", border_rad)
      )
    } else {
      actionButton(
        inputId = "chron_renal", 
        label = "Chronic Renal Disease",
        style = paste(std_style, "border-top-right-radius:", border_rad)
      )
    }
  })
  
  # Pre-existing Conditions > Chronic Heart Disease
  # -----------------------------------------------
  observeEvent(input$chron_heart, {
    if(calculator_button$heartclicked){
      calculator_button$heartclicked <- FALSE
      clin_values$chron_heart <- FALSE
      
    } else {
      calculator_button$heartclicked <- TRUE
      clin_values$chron_heart <- TRUE
    }
  })
  
  output$chron_heart <- renderUI({
    if(calculator_button$heartclicked){
      actionButton(
        inputId = "chron_heart", 
        label = "Chronic Heart Disease",
        style = clicked_style
      )
    } else {
      actionButton(
        inputId = "chron_heart", 
        label = "Chronic Heart Disease",
        style = std_style
      )
    }
  })
  
  # Pre-existing Conditions > Coronary Heart Disease
  # ------------------------------------------------
  observeEvent(input$coronary_heart, {
    if(calculator_button$coronaryclicked){
      calculator_button$coronaryclicked <- FALSE
      clin_values$coronary_heart <- FALSE
      
    } else {
      calculator_button$coronaryclicked <- TRUE
      clin_values$coronary_heart <- TRUE
    }
  })
  
  output$coronary_heart <- renderUI({
    if(calculator_button$coronaryclicked){
      actionButton(
        inputId = "coronary_heart", 
        label = "Coronary Heart Disease",
        style = clicked_style
      )
    } else {
      actionButton(
        inputId = "coronary_heart", 
        label = "Coronary Heart Disease",
        style = std_style
      )
    }
  })
  
  # Pre-existing Conditions > Hypothyroid Disease
  # ---------------------------------------------
  observeEvent(input$hypothyroid, {
    if(calculator_button$thyroidclicked){
      calculator_button$thyroidclicked <- FALSE
      clin_values$hypothyroid <- FALSE
      
    } else {
      calculator_button$thyroidclicked <- TRUE
      clin_values$hypothyroid <- TRUE
    }
  })
  
  output$hypothyroid <- renderUI({
    if(calculator_button$thyroidclicked){
      actionButton(
        inputId = "hypothyroid", 
        label = "Hypothyroid",
        style = paste(clicked_style, "border-bottom-left-radius:", border_rad)
      )
    } else {
      actionButton(
        inputId = "hypothyroid", 
        label = "Hypothyroid",
        style = paste(std_style, "border-bottom-left-radius:", border_rad)
      )
    }
  })
  
  # Pre-existing Conditions > Hypertension Disease
  # ----------------------------------------------
  observeEvent(input$hypertension, {
    if(calculator_button$tensionclicked){
      calculator_button$tensionclicked <- FALSE
      clin_values$hypertension <- FALSE
      
    } else {
      calculator_button$tensionclicked <- TRUE
      clin_values$hypertension <- TRUE
    }
  })

  output$hypertension <- renderUI({
    if(calculator_button$tensionclicked){
      actionButton(
        inputId = "hypertension", 
        label = "Hypertension",
        style = paste(clicked_style, "border-bottom-right-radius:", border_rad)
      )
    } else {
      actionButton(
        inputId = "hypertension", 
        label = "Hypertension",
        style = paste(std_style, "border-bottom-right-radius:", border_rad)
      )
    }
  })
  
  # Omics > File upload back-end
  # ----------------------------
  inFile <- reactive({
    if (is.null(input$file)) {
      return(NULL)
    } else {
      input$file
    }
  })
  
  
  # Review Section
  # --------------
  output$clin_tbl <- renderTable({
    tble <- rbind(
      c("Sex", clin_values$sex),
      c("Age", clin_values$age),
      c("Diabetes", clin_values$diabetes),
      c("Renal", clin_values$chron_renal),
      c("Heart", clin_values$chron_heart),
      c("Coronary", clin_values$coronary_heart),
      c("Thyroid", clin_values$hypothyroid),
      c("Tension", clin_values$hypertension)
    )
    colnames(tble) <- c(" ", "Response") 
    tble
  })
  output$outcome_pred <- reactive({
    if (is.null(inFile)) {
      ""
    } else {
      data <- read.csv(inFile()$datapath, header=TRUE)
      data[data == 0] <- 1
      data <- log(data)
      as.character(dplyr::recode(predict(model, data), `0`="Moderate", `1`="Severe"))
    }
  })
  
  # Reactive Titles for data availability status
  # --------------------------------------------
  output$omic_check <- renderUI({
    if (is.null(input$file)) {
      tags$span(
          "RNA Sequencing Data", 
          tags$img(
            src = "minus.png",
            width = "20px", height = "20px"
          ),
          style = "color: 193b65;"
        )
    } else {
        tags$span(
          "RNA Sequencing Data", 
          tags$img(
            src = "power.png",
            width = "20px", height = "20px"
          ),
          style = "color: 193b65;"
        )
    }
  })
  
  output$omics_supplied <- renderUI({
    if (is.null(input$file)) {
      div(
        h3(
          "RNA data missing!",
          style = "
            color: #ec5565;
          "
        ),
        p(
          "
          You have not provided any RNA sequencing data!
          Please check that the uploaded file is of the
          right type (.csv/.txt (with comma-separated values))
          or that the data is locally available and try again.
          ",
          style = "text-algin: justify;width:80%;"
        ),
        style = "height:100%:width:10%;"
      )
    } else {
      div(
        h3(
          "Omics sample supplied!",
          style = "
            color: #41cc66;
          "
        ),
        p(
          "
          Viable sample supplied. Use the button below to
          generate a prediction.
          ",
          style = "text-algin: justify;width:80%;"
        ),
        style = "height:100%:width:10%;"
      )
    }
    
  })
  
  
## -----------------------------
## Moving on from the Calculator
## -----------------------------
  
  ## Results UI
  ## ----------
  
  plot_outs <- fluidRow(
    id = "after_calc",
    
    # First row of content
    # --------------------
    fluidRow(
      
      # Top-left tile
      # -------------
      column(  
        8, 
        align = "center",
        div(
          id = "panel",
          plotOutput("dens_plot", height = "90%"),
          style = "
            background-color:#fff;
            border-radius: 25px;float:right;
            width:100%;height:100%;
            box-shadow:0 0 20px #ababab;padding-top: 8%;
            padding: 4%;
          "
        ),
        
        style = "
          width:100%; height:45vh;
        "
      ),
      
      # Top-right tile
      # ---------------
      column(
        4,
        fluidRow(
          div(
            id = "panel",
            h4("Predicted Outcome Severity"),
            h4(textOutput("outcome_pred"), 
               style = "color:#ec5565; margin-top: 1vh;"),
            style = "
              background-color:#fff; box-shadow:0 0 20px #ababab;
              width:97%;height:22vh;border-radius:25px;
              margin-right:0px; padding-top:5%;
            "
          ),
          
          div(
            id = "panel",
            h4("Select a gene to visualise (left)"),
            selectInput(
              inputId = "col",
              label = "Significant Genes",
              choices = final_features,
              selected = "ACVR1B"
            ),
            style = "
              background-color:#fff;
              border-radius: 25px;
              width:97%; height:21.5vh; float:right; margin-top:1.6vh;
              box-shadow:0 0 15px #ababab; margin-left:0px;
              padding:5px;padding-top:5%;
            "
          )
        ),
        
        style = "
          width:100%;height:45vh;
        "
      ),
      style = "width:100%;"
    ),
    
    # Bottom tile
    # ----------------
    fluidRow(
      column(
        12,
        align = "center",
        div(
          id = "panel",
          plotlyOutput("bx", width="100%", height = "40vh"),
          style = "
            background-color:#fff;
            border-radius: 25px;
            width:100%; height:42vh; float:right;
            box-shadow:0 0 15px #ababab; margin-left:0px;
            padding:5px;
          "
         ),
         style = "
          width:100%;  
          margin-top:15px;
        "
      ),
      style = "
        width:100%;
      "
    ),
    style = "
      width:100%;height:45vh;
      position:absolute;padding:1%;
      padding-top:0px;padding-bottom:0px;
    "
  )
  
  # UI Packaging
  # ------------
  result_out <- fluidRow(
    id = "result_out",
    column(
      12,
      plot_outs,
      align = "center",
      style = "
        width:87vw; height:92vh; box-shadow: 0 0 70px #112945;
        border-radius:30px; background-color:#e8ebef; padding:1.5%;
      "
    ),
    style = "
      position:absolute;
      margin-left:3vw;margin-top:4vh;
    "
  )

  ## UI Plotting examples
  ## --------------------
  
  # Render dataframe to UI
  # ----------------------------
  output$tbl <-  renderPlotly({
    
    # Palette
    tick_grid_color = "#e8e8e833"
    txt_color = "#302a24"
    
    # Table call
    fig <- plot_ly(
      type = "table",
      
      # Header properties/styles
      header = list(
        values = c(
          "Properties", 
          names(iris)
        ),
        align = c(
          "center", 
          rep("center", ncol(iris))
        ),
        line = list(
          width = 1, 
          color = tick_grid_color
        ),
        fill = list(color = "#fff"),
        font = list(family = "Arial", size = 12, color = txt_color)
      ),
      
      # Cell properties/styles
      cells = list(
        values = rbind(
          rownames(iris),
          t(as.matrix(unname(iris)))
        ),
        align = c(
          rep(
            "center", 
            (ncol(iris)+1)
          )
        ),
        line = list(
          color = tick_grid_color, 
          width = 1
        ),
        fill = list(color = "#fff"),
        font = (list(
          family = "Arial", 
          size = 12, 
          color = c(txt_color))
        )
      )
    )
    
    # Plot layout properties
    fig %>%
      layout(plot_bgcolor  = "rgba(0, 0, 0, 0)",
             paper_bgcolor = "rgba(0, 0, 0, 0)") %>%
      config(displayModeBar = FALSE)
    
  })
  
  # Render boxplot to UI
  # ----------------------------
  output$bx <-  renderPlotly({
    
    dat <- read.csv(inFile()$datapath, row.names=1)
    
    # Palette
    tick_grid_color = "#e8ebef44"
    txt_color = "#193b6566"
    
    # x-axis styling and layout options
    # ----------------------------
    x_params <- list(
      title = "Patient ID",
      titlefont = list(
        family = "Monserrat, sans-serif",
        size = 10,color = "#000000"
      ),
      autotick = FALSE,
      ticks = "outside",
      tick0 = 0,
      dtick = 0.25,
      ticklen = 5,
      tickwidth = 2,
      tickfont = list(
        family="Monserrat, sans-serif",
        color = txt_color,
        size = 9
      ),
      tickcolor = tick_grid_color,
      gridcolor = tick_grid_color,
      gridwidth = 1.2
    )
    
    # y-axis styling and layout options
    # ----------------------------
    y_params <- list(
      title = "log-2 Expression",
      titlefont = list(
        family = "Monserrat, sans-serif",
        size = 10,color = "#000000"
      ),
      autotick = FALSE,
      ticks = "outside",
      tick0 = 0,
      dtick = 1,
      ticklen = 5,
      tickwidth = 1,
      tickfont = list(
        family="Monserrat, sans-serif",
        color = txt_color
      ),
      tickcolor = tick_grid_color,
      gridcolor = tick_grid_color,
      gridwidth = 1.7
    )
    
    # Legend styling and layout options
    # ----------------------------
    leg_params <- list(
      x = 0.87, y = 1,
      font = list(
        family = "Monserrat, sans-serif",
        size = 12,
        color = "#000000"
      ),
      bgcolor = "white"
    )
    
    # Main plot call
    combined_dat <- combined_no_batch %>% select(-"outcome")
    combined_dat <- combined_dat %>% select(all_of(final_features))
    rownames(dat) <- "SAMPLE"
    dat <- dat %>% select(all_of(final_features))
    dat[dat == 0] <- 1
    dat <- log(dat)
    dat <- rbind(dat, combined_dat)
    
    dat <- melt(t(dat))
    dat$cat <- "Moderate"
    dat$cat[which(as.character(dat$Var2) %in% rownames(combined_no_batch)[combined_no_batch$outcome == 1])] <- "Severe"
    dat$cat[1:84] <- "Sample"
    
    fig <- plot_ly(
      dat,
      y=~value,
      x=~Var2,
      color=~cat,
      type="box",
      line=list(color="#33333333", width=1),
      marker = list(outliercolor = '#33333333',
                    line = list(outliercolor = '#33333333',
                                outlierwidth = 0.5))
    )

    # Plot layout properties
    fig %>%
      layout(
        xaxis=x_params, yaxis=y_params, legend=leg_params, title="Comparing sample to provided data",
        plot_bgcolor  = "rgba(0, 0, 0, 0)",
        paper_bgcolor = "rgba(0, 0, 0, 0)"
      ) %>%
      config(displayModeBar = FALSE)
    
  })
  
  # Render density plot to UI
  # ----------------------------
  output$dens_plot <-  renderPlot({
    column = input$col
    color_mod <- "#4d84c4"
    color_sev <- "#ec5565"
    plt <- ggplot(
      combined_no_batch[, which(colnames(combined_no_batch) %in% c(final_features, "outcome"))], 
      aes(x = as.factor(outcome), y = combined_no_batch[, column], fill = as.factor(outcome))
    ) + 
      
      geom_dotplot(
        binaxis = 'y',
        binwidth = 0.1,
        stackdir = 'center', 
        color = NA
      ) +
      
      labs(
        y = "log-Fold Change",
        fill = "Subject Severity"
      ) +
      ggtitle(column) +
      
      theme_bw() +
      theme(
        panel.grid.major.x = element_blank(),
        panel.grid.minor.y = element_line(size = 0.1, colour = "#fafafa"),
        panel.border = element_blank(),
        axis.line.x = element_line(size = 0.4),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = 0.5, size = 8, face = "italic"),
        legend.position = "None"
      ) +
      scale_x_discrete(
        labels = c(
          "Moderate", 
          "Severe"
        )
      ) +
      scale_y_continuous(
        breaks = scales::pretty_breaks(n = 3)
      ) +
      scale_fill_manual(
        values = c(
          color_mod, 
          color_sev
        ),
        labels = c(
          "Moderate",
          "Severe"
        )
      )
    
    plt
    
  })
  
  ## Results UI server
  ## -----------------
  observeEvent(input$sbmt_data, {
    removeUI(
      selector = "#calculator_inputs"
    )
    
    insertUI(
      selector = "#container",
      where = "afterEnd",
      ui = result_out
    )
  })
  
  
    
}