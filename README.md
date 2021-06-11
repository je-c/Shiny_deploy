# Project Shiny App

## Purpose
we aim to develop a severity prediction tool that uses patient omics data to predict whether a patient is likely
to progress to more severe symptoms.

The tool is targeted specifically towards medical practitioners as it requires professional domain knowledge to supply the correct medical data. This tool was developed to be accessed remotely via the internet and used in clinical settings with access to the appropriate laboratory facilities. The tool is to be used as an additional layer of information to be used by experienced medical practitioners to assist them in optimising resource management while providing quality medical care

## Functionality
The app can be run through RStudio and contains all data for startup and basic functionality.

The app takes a single-row .csv file uploaded when directed to generate predictions. Please supply all data in this step when directed. Once predictions are made, the significant protein expressions between classes, and the sample with respect to the packaged data can be explored through visualisations.

NOTE: Prediction is currently slow in the implementation, please allow a few moments after requesting prediction for the result to generate.