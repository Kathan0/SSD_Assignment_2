drop procedure if exists GetWatchHistoryBySubscriber;

delimiter //
create procedure GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
	SELECT sub.SubscriberName, wh.WatchTime, s.Title FROM Subscribers sub 
	INNER JOIN WatchHistory wh on sub.SubscriberID = wh.SubscriberID
	INNER JOIN Shows s ON s.ShowID = wh.ShowID
	WHERE sub.SubscriberID = sub_id;
END //

call GetWatchHistoryBySubscriber(5);