# ClubMan
Club Management Software for college clubs

Club Features :  
- Member List  
     - Profile for each member  
     - Alumni management
- Attendance Management
- Event Management
- Automated event pages
- Competition management : Achievements stored for each member

Built using jsp's on Apache Tomcat

### Steps to run locally :

- Clone this repository
- Setup Tomcat on your local machine and configure eclipse. [A very helpful link for this](https://www.eclipse.org/webtools/jst/components/ws/1.5/tutorials/InstallTomcat/InstallTomcat.html)
- Setup mysql and create a ```testUser``` with password ```testPassword```
- cd into the meta folder and import a sample database using 
```
mysql -u testUser -p < clubDB.sql
```
- Run the code over the tomcat server created in step 2 :D

##### Extra Documentation
A complete ER-Diagram for the database model in use in the sample database : https://github.com/virresh/ClubMan/blob/master/meta/ER_Diagram_Schema.pdf

A complete set of functional dependencies and the normal form of database : https://github.com/virresh/ClubMan/blob/master/meta/Functional_Dependencies_and_Normalisation.pdf


##### Snapshots
![Home Page](meta/Snapshots/1.png?raw=true "Home Page")  
![Login Page](meta/Snapshots/2.png?raw=true "Login Page")  
![Events Page](meta/Snapshots/3.png?raw=true "Events List")  
![Resource Page](meta/Snapshots/4.png?raw=true "Resource Page")  

More snapshots here : https://github.com/virresh/ClubMan/tree/master/meta/Snapshots
