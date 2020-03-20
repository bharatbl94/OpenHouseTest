{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww15040\viewh10660\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 This OpenHouseTest app fetches and shows the list of communities we have with name, sample image and the average price of the hotels associated with that community.\
\
This is an iOS app made on Swift using MVC architecture with some MVVM concepts.\
To install and test this project, just clone this open the project with Xcode run the same on a simulator or if you have an Apple developer account you can run this in your physical device too.\
\
I have tried to execute this with minimal time complexity.\
Time Complexity to fetch homes and to calculate an average price is near to O(H) where H is the total number of homes fetched home API.\
Total App complexity is O(C + H) ~ O(H).whichever is higher C or H.\
Here C is the total number of communities fetched from community API. \
\
\
Question 1: If given more time, how would you improve the quality of your application?\
For now, the design is not beautifully made & UX is not much considered. So we can work on that.\
We can add a caching data mechanism using Core-Data or realm.\
\
Question 2: Would you implement anything differently?\
Nops as I have already made the app using standard design & code flow practice...:-)\
\
\
\
\
\
}
