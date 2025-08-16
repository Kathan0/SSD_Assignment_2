drop procedure if exists GetWatchHistoryBySubscriber;

delimiter //
create procedure GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
        
	DECLARE v_sub_name VARCHAR(100);
	DECLARE v_watchTime INT;
	DECLARE v_title VARCHAR(100);
    DECLARE done INT DEFAULT FALSE;
    
	DECLARE watchHistoryCur CURSOR FOR
		SELECT sub.SubscriberName, wh.WatchTime, s.Title FROM Subscribers sub 
        INNER JOIN WatchHistory wh on sub.SubscriberID = wh.SubscriberID
        INNER JOIN Shows s ON s.ShowID = wh.ShowID
        WHERE sub.SubscriberID = sub_id;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
        
	OPEN watchHistoryCur;
	read_loop: LOOP
		FETCH watchHistoryCur into v_sub_name, v_watchTime, v_title;
        if done then
			leave read_loop;
		end if;
        SELECT CONCAT('Name: ', v_sub_name, ', Watch Time: ', v_watchTime, ', Show Title: ', v_title) as Output;
    END LOOP;

    close watchHistoryCur;
END //

call GetWatchHistoryBySubscriber(2);