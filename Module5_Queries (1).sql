/*Find the names of all customers who have an acctive financing plan with the Standard Plan and interest rate over 3.60 */

select name from customer where customerID in (
	select customerID from financing 
    where plan = "Standard" and interest_rate >= 3.60);
    
/*Find the names and phone number of all customers with an active customization with a cost over 1700$ taken place in a new car */
select name, phone from customer where customerID in (
	select customerID from vehicle where conditions = "New" and vehicleID in (
    select vehicleID from customization where cost > 1700));
    
/*Find the names, vehicle model, registration expiration date, date of manufacture and insurance plan type of all customers who posses a vehicle and have a comprehensive insurance plan */
select customer.name, registration.model, registration.date_of_expiration, 
registration.date_of_manufacture, insurance.plantype from customer
	inner join registration
	on customer.customerID = registration.customerID
	inner join insurance 
	on registration.vehicleID = insurance.vehicleID where plantype = "comprehensive";

/*Find the vehicle VIN numbers, license plate number,model ,expiration date and registrationID of all vehicles that cost over 30000$ and with active current registration (expiration date after 04/10/2024) */
select vehicle.VIN, vehicle.license_plate_number, vehicle.price, 
registration.date_of_expiration, registration.reg_no from vehicle
	inner join registration
    on vehicle.vehicleID = registration.vehicleID
	where vehicle.price >= 30000 and registration.date_of_expiration > '2024-04-09';
    
/* Find the customer name, his vehicle model, vehicle type, his warranty duration, warranty type and financing plan of all customers who have a vehicle manufactured in USA, a warranty duration of more than 2 years and a loan financial plan */
select customer.name, vehicle.model, vehicle.type, warranty.duration, warranty.warranty_type, financing.plan from customer
	inner join vehicle
	on customer.customerID = vehicle.customerID
	inner join warranty
	on vehicle.vehicleID = warranty.vehicleID
	inner join financing
	on vehicle.vehicleID = financing.vehicleID
	where vehicle.place_of_manufacture = "USA" and financing.payment_type = "loan" and warranty.duration > 2;
    
/*Find all the customer information of all the customers who gave more than a 3 stars overall rating on a survey */
select * from customer where customerID in (
	select customerID from survey where overallRating > 3);

     
    

    