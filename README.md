# Sports-Expert-system-using-AI
Building sports expert system, a rule-based engine approach, using AI CLIPS language(invented by NASA) to recommend sports by answering questions 

## Table of contents

* [General info](#general-info)
* [Screenshots](#screenshots)
* [Demo](#demo)
* [Methods and Tools](#methods-and-tools)
* [Code Examples](#code-examples)
* [Status](#status)
* [Contact](#contact)
* [Reference](#reference)

## General info

Project was Time Series Analysis, used ARIMA method to build the model.
Major steps involved were as follow :                                 
* STEP: 1 - Data Cleaning and Analysis
* STEP: 2 - Checking Stationarity (ADF Test) 
* STEP: 3 - Transformation  
* STEP: 4 - Differencing
* STEP: 5 - Time Series Components 
* STEP: 6 - Finding ACF and PACF
* STEP: 7 - ARIMA Modeling 
* STEP: 8 - Forecast

## Demo

![Example screenshot](./images/Demo.gif)

**The entire demo of the project can be found on [YouTube](https://www.youtube.com/watch?v=zkw2CZEssT8).**

## Screenshots

![Example screenshot](./Image/image1.png)
![Example screenshot](./Image/image2.png)

## Methods and Tools
* Artificial Intelligence
* CLIPS
* Rule-based Engine

## Code Examples

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule running ""
   (not (run ?))
   (not (sports ?))
   =>
   (assert (run-ans (answers "Do you like running? (yes/no)? "))))
   
(defrule contact ""
   (run-ans yes)
   (not (sports ?))
   =>
   (assert (contact-ans (answers "Do you prefer contact sports (yes/no)? "))))

(defrule alone ""
   (run-ans no)
   (not (sports ?))   
   =>
   (assert (alone-ans (answers "Do you like to play sport alone (yes/no)? "))))

## Status
Project is: _finished_.

## Contact
If you loved what you read here and feel like we can collaborate to produce some exciting stuff, or if you
just want to shoot a question, please feel free to connect with me on 
<a href="mailto:manishshukla.ms18@gmail.com">email</a> or 
<a href="https://www.linkedin.com/in/manishshukla-ms/" target="_blank">LinkedIn</a>
