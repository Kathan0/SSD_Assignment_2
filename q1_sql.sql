drop PROCEDURE IF EXISTS ListAllSubscribers;

delimiter //
create procedure ListAllSubscribers()
begin
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_name VARCHAR(100);
	DECLARE subscribersCur CURSOR FOR
		SELECT SubscriberName FROM Subscribers;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
        
	OPEN subscribersCur;
	read_loop: LOOP
		FETCH subscribersCur into v_name;
        if done then
			leave read_loop;
		end if;
        SELECT CONCAT('Name: ', v_name) as Output;
    END LOOP;
    
    close subscribersCur;
end //

call ListAllSubscribers();