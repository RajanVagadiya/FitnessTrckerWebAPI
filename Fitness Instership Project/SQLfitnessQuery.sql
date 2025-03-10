create table userCred(
  userId int identity(1,1) primary key,
  name varchar(100),
  email varchar(100),
  password varchar(100),
  mobile decimal,
  gender varchar(100))

  drop table userCred


alter Procedure InsertUsers
 @name varchar(100),
 @email varchar(100),
 @password varchar(100),
 @mobile decimal,
 @gender varchar(100)
as
begin
  insert into userCred(name, email, password, mobile, gender) values
  (@name, @email, @password, @mobile, @gender)
end;


Exec InsertUsers @name = 'Rajan',@email='rajanvagadiya@gmail.com',@password = 'Rajan#1234', @mobile= 92659072832 ,@gender= 'male'

select * from userCred

create table bmi (
    bmiId int identity(1,1) primary key,
    height decimal,
	weight decimal,
	bmi decimal,
	category varchar(100),
	suggestions varchar(255),
	currentdate date default getDate(),
	userId INT, 
    FOREIGN KEY (userId) REFERENCES userCred(userId) 
	)

	drop table bmi

	ALTER TABLE bmi
    DROP CONSTRAINT DF__bmi__currentdate__398D8EEE;

	ALTER TABLE bmi
    ALTER COLUMN currentdate DATETIME;


	-- procedure to insert record into bmi table
	ALTER PROCEDURE InsertBmiRecord
    @height DECIMAL,
    @weight DECIMAL,
	@bmi DECIMAL,
    @category VARCHAR(100),
    @suggestions VARCHAR(255),
	@currentdate datetime,
    @userId INT
AS
BEGIN
    -- Insert the record into the bmi table
    INSERT INTO bmi (height, weight, bmi, category, suggestions, currentdate ,userId)
    VALUES (
        @height, 
        @weight, 
        @bmi,
        @category,
        @suggestions,
		@currentdate,
        @userId
    );
END;

EXEC InsertBmiRecord 
    @height = 170, 
    @weight = 70,
	@bmi = 24.22,
    @category = 'Normal', 
    @suggestions = 'Maintain your current lifestyle and keep active.',
	@currentdate = '03-03-2025',
    @userId = 1;

   SELECT * from bmi


   -- crate table of activity
   create table activity(
   activityId int identity(1,1) primary key,
   activity varchar(100),
   duration decimal,
   activitydate date default getDate(),
   calories decimal,
   weightloss decimal,
   userId INT, 
   FOREIGN KEY (userId) REFERENCES userCred(userId)
   )
   
   ALTER TABLE activity
   ALTER COLUMN duration decimal;


   CREATE PROCEDURE InsertActivity
    @activity VARCHAR(100),
    @duration decimal,
	@activitydate date,
    @calories DECIMAL,
	@weightloss DECIMAL,
    @UserId INT
AS
BEGIN

    -- Insert into activity table
    INSERT INTO activity (activity, duration, activitydate, calories, weightloss, userId)
    VALUES (@activity, @duration, @activitydate, @calories, @weightloss, @UserId);
END;

EXEC InsertActivity
    @activity = 'Running',
    @duration = 30,
	@activitydate = '04-03-2025',
    @calories = 300,
	@weightloss = 0.389,
    @UserId = 1;

select * from activity