# EAT@FEUP - 2LEIC02T4


![](https://i.imgur.com/zAw7S5x.png)



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
    - [User stories](#user-stories)
    - [Domain model](#domain-model)
- [Architecture and Design](#architecture-and-design)
    - [Logical Architecture](#logical-architecture)
    - [Physical Architecture](#physical-architecture)
- [Project Management](#project-management)
    
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

    
The **EAT@FEUP** app helps you find the best place for a quick meal at FEUP's campus, avoiding wasting your time on multiple websites and making your days more productive.
        
### Target Group
**EAT@FEUP's** target group is all of FEUP's community that has to search for a place to eat.
    
### Needs

Finding information about FEUP's eating places is not very accessible and there needs to be a little bit of research to find about all the options.

The location of the eating places, the cost of the meal can't even be found in Sigarra.

Sometimes, especially for students, due to their short lunch period it's useful to know what are the less and busiest hours in the eating places. If someone is short on time, knowing that information can help them make the smartest choice. This details aren't disclosed in Sigarra.

### Product & Business Goals

**EAT@FEUP** allows easy access to the different meal options nearby FEUP, as well as their prices, location and busiest hours.

Such product would be very valuable to college community, since that improves the experience of having lunch at FEUP by choosing the best food option when time is short or by finding the most suitable meal.


## Main Features
 - Feature 1 - View the menu and the dish of the day of the eating places that FEUP offers;
 - Feature 2 - View the location of those eating places;
 - Feature 3 - View the busiest hours.

## Assumptions and Dependencies
- Sigarra's information about food menus;
- Google Maps (for locations and "popular hours").
    
# Requirements
## Use Case Model
![](https://i.imgur.com/hSoAcYZ.png)




<br>

    
|||
| --- | --- |
| *Name* | View eating place options at FEUP's campus |
| *Actor* |  User | 
| *Description* | The user sees a list with the different eating places options at FEUP's campus.  |
| *Preconditions* | - The user has the app installed and a connection to the Internet. <br> - There are available eating options on FEUP's campus. <br> - Sigarra has information about the menus of the eating places. |
| *Postconditions* | - The user knows what eating options are available at FEUP's campus and is able to see their location.|
| *Normal flow* | 1. The user accesses the application **EAT@FEUP**.<br> 2. The system shows a list of restaurants that when selected can show their info, and a button to see them on a map.
    
<br>
<br> 
    
    
    
|||
| --- | --- |
| *Name* | View the eating places on a map |
| *Actor* |  User | 
| *Description* | The user has access to information about the different dining places location.|
| *Preconditions* | - The user selected the option on the main page. <br> <div align="center"> OR </div> - The user selected the option on the dining place's page. |
| *Postconditions* | - The user views the eating places on a map. |
| *Normal flow* | 1. The user sees the location of the different eating places.<br> 2. When selecting a place to eat its address and working hours are shown.<br> |
| *Alternative flows and exceptions* | 1. When the user opens the map on the eating place's page, that restaurant is already selected on the map|
  
<br>
<br> 
    
|||
| --- | --- |
| *Name* | View the eating place's menu, busiest hours and working hours |
| *Actor* |  User | 
| *Description* | The user has access to information about the selected restaurants/bars/coffes and they can see the corresponding menu and daily meals as well as the time of busiest hours|
| *Preconditions* | - The user selected the eating place on the main page |
| *Postconditions* | - The user finds a good option to have their meal. |
| *Normal flow* |1. The working hours appear to the user<br> 2. The menu and the daily meals appear to the user.<br> 3. The system also shows the busiest hours.<br>4. There is a button to access the map to see the eating place's location.|
| *Alternative flows and exceptions* | 1. In step 2 you can choose to see the menu of a specific day and the type of meal you want to eat: meat, vegetarian, fish or diet <br>2. In option 3 you can choose the day in which to see the the busiest hour|


## User stories
- [As a user, I want to know the eating places at FEUP's campus, so that I can choose where to eat.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/1)
- [As a user, I want to see the location of the eating places at FEUP's campus, so that I can get there.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/2)
- [As a user, I want to know eating places's meal menus at FEUP's campus, so that I can choose what to eat.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/3)
- [As a user, I want to see the busiest hours of the eating places, so that I can eat a quick meal.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/4)
- [As a user, I want to select different dates or days of the week, so that I can see the menu available on those days.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/5)
- [As a user, with an eating restriction, I want to know the different types of meals available, so that I can eat accordingly to my restrictions.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/6)
- [As a user, I want to see the working hours of an eating place, so that I know when I can go there.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/7)
- [As a user, I want to see lunch or dinner meals, so that I know whats available at different hours of the day.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/8) 
- [As a user, I want to choose which food types are displayed and their order.](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/14)


## Domain Model
    
There are eating places, which have a name, a location, a menu and a working schedule. They can accept card payments or not. The menu has a description, a cost and takes into account some restrictions like: meat, fish, diet, or vegetarian. There are busy periods that represent the typical affluence each day of the eating place. The meals can be served at lunch or dinner, depending on the place.
    
<br>
    
![](https://i.imgur.com/yxv9buZ.png)


    
# Architecture and Design
Our project follows a layered architecture as it is structured with different levels of abstraction. The following *UML package diagram* and the *UML deployment diagram* describe how we decided to structure our application.
    
## Logical Architecture
    
![package-Page-1 drawio (1)](https://user-images.githubusercontent.com/78430365/162484009-c6aca516-1132-44c5-8b87-2981cefa8682.png)
    
<br>
    
**User Interface**: This package represents the view of the application. It's components are the pages that the user will be able to access: the `Home Page`, the `Map Page` and the pages of each different `eating place`. 
 
**Application Tier**: The application package stores all the relevant information about the `eating places` and their location with the help of a `Map` and manages the information that the view gets to access. It works with the lower layer Data to gather this information and then processes it to show it to the user. This layer is also responsible for managing the logics behind the data, for example filters or variations like what restaurants are opened during the day or at night.
    
**Data Tier**: The data, in this case the information regarding the `Menus`, which is provided through an API, is managed and processed by the Application Tier and later displayed to the user.
    
## Physical Architecture
    
![deployment drawio](https://user-images.githubusercontent.com/78430365/162483865-cf36e57b-9bfa-4d7f-b21d-d8c7e675dbab.png)
    
    
In the `user's phone`, the user accesses `Eat@Feup` (developed in the Flutter framework) as a part of the `uni4all` app. Eat@Feup then uses the `uni4all backend` to reach `Sigarra`'s information about the menus. It also accesses `Google Maps` to get the location of the eating places. 
- Flutter was chosen as the framework to the develop the app beacuse it is easy to learn and to use and has good documentation.
- Google Maps was chosen because it shows the busiest hours of the places and it is a familiar tool to the user.
    
# Project Management
   
**Backlog management:** Product backlog and Iteration backlog in a [Github Projects board](https://github.com/LEIC-ES-2021-22/2LEIC02T4/projects/1);
    
**Release management:** [v0](https://github.com/LEIC-ES-2021-22/2LEIC02T4/releases/tag/v0); [v0.1](https://github.com/LEIC-ES-2021-22/2LEIC02T4/releases/tag/v0.1);
    
### Iteration 1 planning and retrospectives:
- **Plans:** 
    - Begining:![](https://i.imgur.com/9EFYRya.png)
    - In Process: ![](https://i.imgur.com/zXZkmSj.png)
    - End:![](https://i.imgur.com/EdQz7xL.png)

- **Retrospectives:** Everything went well because everyone collaborated with each other. All the goals were met. However, for the next iteration we will focus more on the correct GitHub Flow.
    
### Iteration 2 planning and retrospectives:
- **Plans:** 
    - Begining:![](https://i.imgur.com/fZCiR6y.png)
    - In Process: ![](https://i.imgur.com/dHyjnlP.png)
    - End:![](https://i.imgur.com/4ohUbir.png)

- **Retrospectives:** While it did not appear to be a large increment, everything that had been planned was done and it represented a decent portion of the remaining features to be implemented. Some details were not taken into account (e.g. show "Lunch" or "Dinner" based on the current time) but will be fixed in the next iteration.

### Iteration 3 planning and retrospectives:
- **Plans:** 
    - Begining:![](https://i.imgur.com/R9wiU2E.png)
    - In Process: ![](https://i.imgur.com/FqLgvkJ.png)
    - End:![](https://i.imgur.com/VnfQVkQ.png)
- **Retrospectives:** In this interaction the issue [4](https://github.com/LEIC-ES-2021-22/2LEIC02T4/issues/4) was not possible to be developed due to the fact that the Google API doesn't support this operation yet. Despite this, there was still a big increment by making the app more appealing and by implementing the last feature: providing to the user the option of choosing their preferences, so that the content on each eating place's page was according to their likings. We also fixed the "Lunch" or "Dinner" option, based on the current time, that was not done in the last iteration.
