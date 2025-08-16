GIT repository link: https://github.com/Kathan0/SSD_Assignment_2

This README is created for displaying interpretation of the SQL code written in q1.sql to q5.sql

How to execute scripts:
	1) Open the script in MySQL
	2) Execute the 'CREATE PROCEDURE <procedure_name>' call to create the procedure
	3) change the 'call <procedure_name>()' call as appropriate.

NOTE: If needed, Command to drop the procedure has been added in each script.

Question 1:
In this question, we are asked to simply list all subscribers using cursor. So, we made a cursor iterating over all subscribers data. Then, in LOOP, we fetch the row data pointed by the cursor into a variable, and print the output using select query

SQL query for execution: 'call ListAllSubscribers();'

Question 2:
In this question, We have to fetch Watch history for the given subscriber ID in parameter. So, we create a join between Subscribers table, WatchHistory table, and Shows table. Then, we fetch SubscriberName, WatchTime and Title of the show for given subscriber ID, and print it.

SQL query for execution: 'call GetWatchHistoryBySubscriber(2);'

Question 3:
In this question, we have to add a subscriber into Subscribers table, with subscriberName given in the parameter. First, we check if a subscriber with given name is present in the table. If not, we fetch the maximum id from the table and store it in a variable. Then we insert a row into the table, with subscriberId as maxID + 1, name as given in parameters, and SubscriptionDate as system date (sysdate()).

SQL query for execution: 'call AddSubscriberIfNotExists('Kathan');'

Question 4:
In this question, we have to call GetWatchHistoryBySubscriber() procedure for all subscribers who have watched something. So, we create a cursor to iterate over all subscribers, who have atleast one entry in WatchHistory table. For all those subscribers, we call the GetWatchHistoryBySubscriber procedure, and the output is printed only for those subscribers who have watched something.

SQL query for execution: 'call SendWatchTimeReport();'

Question 5:
In this question, we have to call GetWatchHistoryBySubscriber() procedure for all subscribers, regardless of their presence in WatchHistory table. So, we create a cursor over all subscribers, and call the procedure for each subscriber. However, there is a call for those subscribers who don't have any WatchHistory entry, because of which blank ouput is printed for those subscribers.

SQL query for execution: 'call GetWatchHistoryForAllSubscribers();'