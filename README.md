# 2LEIC02T4
<div>
    <img src="https://i.imgur.com/vFwijSi.png">
<div>



## TABLE OF CONTENTS
- [Members](#members)
- [Product Name](#product-name)
- [Business modeling](#business-modeling)
    - [Product Vision](#product-vision)
        - [Vision Statement](#vision-statement)
        - [Target Group](#target-group)
        - [Needs](#needs)
        - [Product & Business Goals](#product-&-business-goals)
        - [Main Features](#main-feature)
        - [Assumptions and Dependencies](#assumptions-and-dependencies)
- [Requirements](#requirements)
    - [Use Case Model](#use-case-model)

## Members

Igor Diniz       -- up202000162@edu.fe.up.pt

Inês Cardoso     -- up202005435@edu.fe.up.pt

Joana Santos     -- up202006279@edu.fe.up.pt

João Matos       -- up202006280@edu.fe.up.pt

Mariana Carvalho -- up202007620@edu.fe.up.pt


## Product Name
 **EAT@FEUP**
    
    
#    Business modeling
## Product Vision
### Vision Statement

    
The **EAT@FEUP** app helps you find the best place for a quick meal at FEUP's campus, avoiding wasting your time on Sigarra's messy website and making your days more productive.
        
### Target Group
**EAT@FEUP's** target group is all of FEUP's community that has to search for a place to eat.
    
### Needs

Finding information about FEUP's dining places is not very accessible and there needs to be a little bit of research to find about all the options.

The location of the dining places, the cost of the meal can't even be found in Sigarra.

Sometimes, especially for students, due to their short lunch period it's useful to know what are the less and busiest hours in the dining places. If someone is short on time, knowing that information can help them make the smartest choice. This details aren't disclosed in Sigarra.

### Product & Business Goals

**EAT@FEUP** allows easy access to the different meal options nearby FEUP, as well as their prices, location and busiest hours.

Such product would be very valuable to college community, since that improves the experience of having lunch at FEUP by choosing the best food option when time is short or by finding the most suitable meal.


## Main Features
 - Feature 1 - View the menu and the dish of the day of the dining places that FEUP offers;
 - Feature 2 - View the location of those dining places;
 - Feature 3 - View the busiest hours.

## Assumptions and Dependencies
- Sigarra's information about food menus;
- Google Maps (for locations and "popular hours").
    
# Requirements
## Use Case Model
   ![](https://i.imgur.com/a1JFiJa.png)


<br>

    
|||
| --- | --- |
| *Name* | View dining place options at FEUP's campus |
| *Actor* |  User | 
| *Description* | The user sees a list with the different dining places options at FEUP's campus.  |
| *Preconditions* | - The user has the app installed and a connection to the Internet. <br> - There are available dining options on FEUP's campus. <br> - Sigarra has information about the menus of the dining places. |
| *Postconditions* | - The user knows what dining options are available at FEUP's campus and is able to see their location.|
| *Normal flow* | 1. The user accesses the application **EAT@FEUP**.<br> 2. The system shows a list of restaurants that when selected can show their info, and a button to see them on a map.
    
<br>
<br> 
    
    
    
|||
| --- | --- |
| *Name* | View the dining places on a map |
| *Actor* |  User | 
| *Description* | The user has access to information about the different dining places location.|
| *Preconditions* | - The user selected the option on the main page. <br> <div align="center"> OR </div> - The user selected the option on the restaurant page. |
| *Postconditions* | - The user views the dining places on a map. |
| *Normal flow* | 1. The user sees the different locations of the restaurants.<br> 2. When selecting a restaurant the address and working hours is shown.<br> |
| *Alternative flows and exceptions* | 1. When the user opens the map in the restaurant's page, that restaurant is already selected on the map|
  
<br>
<br> 
    
|||
| --- | --- |
| *Name* | View the dining place's menu, busiest hours and working hours |
| *Actor* |  User | 
| *Description* | The user has access to information about the selected restaurants/bars/coffes and they can see the corresponding menu and daily meals as well as the time of busiest hours|
| *Preconditions* | - The user selected the restaurant on the main page |
| *Postconditions* | - The user finds a good option to have their meal. |
| *Normal flow* |1. The working hours appear to the user<br> 2. The menu and the daily meals appear to the user.<br> 3. The system also shows the busiest hours.<br>4. There is a button to acess the map to see the restaurants location.|
| *Alternative flows and exceptions* | 1. In step 2 you can choose to see the menu of a specific day and the type of meal you want to eat: meat, vegetarian, fish or diet <br>2. In option 3 you can choose the day in which to see the the busiest hour|

 
    
