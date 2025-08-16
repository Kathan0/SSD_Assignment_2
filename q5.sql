drop procedure if exists GetWatchHistoryForAllSubscribers

delimiter //
create procedure GetWatchHistoryForAllSubscribers()
begin
	DECLARE v_subId INT;
    DECLARE done INT DEFAULT FALSE;
    
	DECLARE watchHistoryCur CURSOR FOR
		SELECT sub.SubscriberId FROM Subscribers sub;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
	OPEN watchHistoryCur;
    read_loop: LOOP
		FETCH watchHistoryCur INTO v_subId;
		if done then
			leave read_loop;
		end if;
        call GetWatchHistoryBySubscriber(v_subId);
    END LOOP;
    	
	CLOSE watchHistoryCur;
end //

call GetWatchHistoryForAllSubscribers();