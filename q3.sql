drop procedure if exists AddSubscriberIfNotExists;

delimiter //
create procedure AddSubscriberIfNotExists(IN subName VARCHAR(100))
begin
	DECLARE v_sub_name VARCHAR(100);
	DECLARE v_count INT;
    DECLARE v_max_id INT;
	DECLARE v_title VARCHAR(100);
    
    SELECT COUNT(*) into v_count FROM subscribers where SubscriberName = subName;
    IF v_count = 0 THEN
		SELECT MAX(subscriberId) into v_max_id from Subscribers;
        
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES
        (v_max_id + 1, subName, sysdate());
    END IF;
end //

call AddSubscriberIfNotExists('Kathan');

Select * from subscribers;