ui <- bs4DashPage(
    sidebar_collapsed = TRUE,
    useShinyjs(),
    
## --------------------
## /* Sidebar */
## --------------------

    bs4DashSidebar(
      
      skin = "dark",
      
      title = tags$span(
        style = "
          color:#ffffff; font-weight:bold;
          font-family:'Monserrat', sans-serif;
        ",
        "Severity Predictor"
      ),
      src = "brain.png",
      status="danger",
      
      # Sidebar Menu
      # -----------
      bs4SidebarMenu(
        
        actionButton(
          'home', 
          label = tags$span(
            tags$img(
              src="refresh.png", 
              height = "32px", 
              width = "32px",
              align = "left",
              style = "margin-top:1%;"
            ), 
            h4(
              "Home", 
              align = "center", 
              style = "
                margin-top:1%;margin-right:10%;
                color:#193b65;
              "
            )
          ),
          style = "
            width:100%;height:42px;
            padding:1%;padding-left:12.5px;
            border-width:0px; border-radius:30px;
            background-color:#ffffff00;
          "
        )
      )
    ),
  
  
## --------------------
## /* Body */
## --------------------
    
    bs4DashBody(
      
      # CSS Styling
      # -----------
      tags$head(tags$style(HTML(
        "
        /* Splash Page */
        .modal.in .modal-dialog{
          width:100%;
          height:40%;
        }
        
        .modal-content{
          width:100%;
          height:40%;
          border-radius:25px;
          text-align:center;font-family:'Monserrat', sans-serif;
        }
        
        /* main sidebar */
        .main-sidebar {
          background-color:#193b65;
        }
        
        /* body */
        .content-wrapper, .right-side {
            background-color:#193b65;
            height:100vh;
        }
        
        /* buttons */
        #glidebtnp:hover {
          box-shadow: 0 0 20px #ec556566 !important;
        }
        
        #glidebtnn:hover {
          box-shadow: 0 0 20px #ab91ea99 !important;
        }
        
        #help:hover {
          border-width: 1px !important;
          border-color:#14a5ff33; background-color:#ffffff !important;
          box-shadow: 0 0 30px #14a5ff99 !important;
        }
        
        #home:hover {
          border-width: 1px !important;
          border-color:#14a5ff33; background-color:#ffffff !important;
          box-shadow: 0 0 30px #14a5ff99 !important;
        }
        
        #run_calc:hover {
          border-width: 2px !important;
          border-color:#14a5ff99;
          box-shadow: 0 0 30px #14a5ff !important;
        }
        
        #male:hover {
          color:#14a5ff99; font-weight:bold;
          border-width: 0px !important;
          border-top-left-radius: 15px; 
          border-bottom-left-radius: 15px;
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #female:hover {
          color:#14a5ff; font-weight:bold;
          border-width: 0px !important;
          border-top-right-radius: 15px; 
          border-bottom-right-radius: 15px;
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #diabetes:hover {
          color:#14a5ff; font-weight:bold;
          border-width: 0px !important;
          border-top-left-radius: 15px; 
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #chron_renal:hover {
          color:#14a5ff; font-weight:bold;
          border-width: 0px !important;
          border-top-right-radius: 15px; 
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #chron_heart:hover {
          color:#14a5ff; font-weight:bold;
          border-width: 0px !important;
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #coronary_heart:hover {
          color:#14a5ff; font-weight:bold;
          border-width: 0px !important;
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #hypothyroid:hover {
          color:#14a5ff; font-weight:bold;
          border-width: 0px !important;
          border-bottom-left-radius: 15px; 
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #hypertension:hover {
          color:#14a5ff; font-weight:bold;
          border-width: 0px !important;
          border-bottom-right-radius: 15px; 
          background-color:#e8ebef33 !important;
          box-shadow: 0 0 20px #ffffff !important;
        
        }
        
        #filerow:hover {
          border-width: 2px !important;
          border-color:#14a5ff33;
          box-shadow: 0 0 20px #14a5ff33 !important;
        }
        
        #sbmt_data:hover {
          border-width: 2px !important;
          border-color:#14a5ff33;
          box-shadow: 0 0 20px #14a5ff99 !important;
        }
        
        /* Panels */
        #panel:hover {
          border-width: 2px !important;
          border-color:#14a5ff33;
          box-shadow: 0 0 8px #14a5ff33 !important;
        }
        "
      ))),
      
      # Main UI element layout
      # ---------------------
      fluidRow(
        id = "body",
        h1(
          'COVID-19 Severity Risk Calculator', 
          style = "
            position:absolute;
            font-size:60px !important; color:#09203d;
            text-shadow: 0px 1px 1px #2a5182;
            font-weight:bold; font-family: 'Arial', san-serif;
            margin-left:7vw; margin-top:10vh;
          "
        ),
        h4(
          '
          Welcome to the COVID-19 severity calculator. To start, just hit the big 
          button in the center and you will be guided through step by step. The calculator
          can accept some basic demographic information about your patient, and requires
          an RNA sequencing output, preferably as raw counts. No data is stored outside of
          your session for your patients privacy, though, this does mean that your predictions
          will not be saved if you naviagte away! For any bug reports or feature requests, please
          do not hesistate to contact the team using the contact information stored in the 
          side bar.
          ', 
          style = "
            position:absolute;
            font-size:16px !important; color:#e8ebef;
            text-shadow: 0px 1px 1px #2a5182;
            font-family: 'Arial', san-serif;
            margin-left:10vw; margin-top:78vh;margin-right:10vw;
          ",
          align = "center"
        ),
        # Run button
        # ----------
        fluidRow(
          column(
            12,
            actionButton(
              "run_calc", 
              tags$img(
                src = "division.png"
              ),
              style = "
                height:275px;width:375px;
                border-radius:35px; background-color:#ffffff;
                border-width:0px; box-shadow: 0 0 70px #112945;
              "
              ), 
            align = "center",
            style = "
              padding:0px;
              margin-top:35vh;padding-right:2%;
            "
          ),
          style = "width:100vw;height:30vh;positon:absolute;"
        ),
        
        # Reactive UI Container
        # --------------------
        fluidRow(
          id = "container",
          style = "positon:absolute;margin-top:0px;padding:0px;"
        ),
        style = "position:relative;margin-top:0px;"
      )
    )
  )