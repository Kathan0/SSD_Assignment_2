drop procedure if exists SendWatchTimeReport;

delimiter //
create procedure SendWatchTimeReport()
BEGIN
	DECLARE v_subId INT;
    DECLARE done INT DEFAULT FALSE;
    
	DECLARE watchReportCur CURSOR FOR
		SELECT sub.SubscriberId FROM Subscribers sub 
        WHERE (
			SELECT COUNT(*) FROM WatchHistory w
            WHERE w.SubscriberID = sub.SubscriberId
        ) > 0;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
	OPEN watchReportCur;
    read_loop: LOOP
		FETCH watchReportCur INTO v_subId;
		if done then
			leave read_loop;
		end if;
        call GetWatchHistoryBySubscriber(v_subId);
    END LOOP;
    	
	CLOSE watchReportCur;
END //

call SendWatchTimeReport();