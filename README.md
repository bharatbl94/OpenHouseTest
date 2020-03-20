This OpenHouseTest app fetches and shows the list of communities we have with name, sample image and the average price of the hotels associated with that community.

This is an iOS app made on Swift using MVC architecture with some MVVM concepts.
Steps to Open & test the app:-
To install and test this project, just clone this with the provided URL  https://github.com/bharatbl94/OpenHouseTest.git
Make sure to checkout to the development branch, all code is put onto the same branch.
I have used Cocoapods for external frameworks. Do pod install before opening the project.
Open the project(.xcworspace only) with Xcode & run the project on a simulator or if you have an Apple developer account you can run this in your physical device too.


I have tried to execute this with minimal time complexity.
Time Complexity to fetch homes and to calculate an average price is near to O(H) where H is the total number of homes fetched home API.
Total App complexity is O(C + H) ~ O(H).whichever is higher C or H.
Here C is the total number of communities fetched from community API. 


Question 1: If given more time, how would you improve the quality of your application?
For now, the design is not beautifully made & UX is not much considered. So we can work on that.
We can add a caching data mechanism using Core-Data or realm.

Question 2: Would you implement anything differently?
Nops as I have already made the app using standard design & code flow practice...:-)
