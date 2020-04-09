CREATE TABLE userinfo (
  u_id varchar(10) NOT NULL,
  username varchar(25) NOT NULL,
  password varchar(25) NOT NULL,
  primary key(u_id)
  );

CREATE TABLE passenger (
  pnr numeric(10,0) NOT NULL,
  p_fname varchar(25),
  p_lname varchar(25),
  age int NOT NULL,
  gender varchar(10),
  seat_no int NOT NULL,
  phone_no numeric(10,0) NOT NULL,
  primary key(pnr)
 ); 

CREATE TABLE train (
  train_id varchar(10) NOT NULL,
  t_name varchar(30),
  primary key(train_id)
 ); 

CREATE TABLE station (
  station_id varchar(10) NOT NULL,
  station_name varchar(25) NOT NULL,
  primary key(station_id)
);

CREATE TABLE train_status (
  status_id varchar(10) NOT NULL,
  status_descp varchar(40) NOT NULL,
  avail_seat int,
  booked_seat int,
  train_id varchar(10),
  primary key(status_id), 
  foreign key (train_id) references train(train_id)
  );


CREATE TABLE book (
  booking_id varchar(10) NOT NULL,
  bdate date,
  tcost numeric(4,0),
  u_id varchar(10),
  status_id varchar(10),
  pnr numeric(10,0),
  board_station varchar(30),
  destination_station varchar(30),
  primary key(booking_id), 
  foreign key (u_id) references userinfo(u_id),
  foreign key (status_id) references train_status(status_id),
  foreign key (pnr) references passenger(pnr),
  foreign key (board_station) references station(station_id),
  foreign key (destination_station) references station(station_id)
);

CREATE TABLE passenger_train (
  train_id varchar(10) NOT NULL,
  t_name varchar(25) NOT NULL,
  avail_class varchar(10),
  no_of_passengers int,
  primary key (train_id), 
  foreign key (train_id) references train(train_id)
);

CREATE TABLE cargo_train (
  train_id varchar(11) NOT NULL,
  t_name varchar(25) NOT NULL,
  type_of_goods varchar(10),
  primary key (train_id), 
  foreign key (train_id) references train(train_id)
); 

CREATE TABLE schedule (
  train_id varchar(11) NOT NULL,
  station_id varchar(25) NOT NULL,
  arr_time time,
  depart_time time,
  primary key (train_id,station_id), 
  foreign key (train_id) references train(train_id),
  foreign key (station_id) references station(station_id)
); 

CREATE TABLE start (
  train_id varchar(25) NOT NULL,  
  station_id varchar(10) NOT NULL,
  primary key(train_id,station_id),
  foreign key (train_id) references train(train_id),
  foreign key (station_id) references station(station_id) 
);

CREATE TABLE endstation (
  train_id varchar(25) NOT NULL,  
  station_id varchar(10) NOT NULL,
  primary key(train_id,station_id),
  foreign key (train_id) references train(train_id),
  foreign key (station_id) references station(station_id) 
);

CREATE TABLE facilities (
  order_id varchar(10) NOT NULL, 
  train_id varchar(25) NOT NULL, 
  facility_type varchar(35), 
  primary key(train_id,order_id),
  foreign key (train_id) references train(train_id)  
);


INSERT INTO userinfo (u_id, username, password) VALUES
('u101', 'arjun', 'abcd'),
('u102', 'amal', 'efgh'),
('u103', 'vijay', 'ijkl'),
('u104', 'sajeev', 'mnop'),
('u105', 'vimal', 'qrst');

INSERT INTO passenger (pnr, p_fname, p_lname, age, gender, seat_no, phone_no) VALUES
('409801', 'sajeev', 'ram', 40, 'male', 103, 9837930582),
('409802', 'vimal', 'nath', 19, 'male', 104, 9467120489),
('409803', 'vijay', 'kumar', 24, 'male', 102, 9530947829),
('409804', 'arjun', 'kishore', 19, 'male', 100, 9450386723),
('409805', 'amal', 'dev', 20, 'male', 101, 9257038205);

INSERT INTO train (train_id, t_name) VALUES
('01068', 'Maveli Express'),
('06304', 'Malabar Express'),
('12217', 'Jan Shadabdi'),
('19259', 'Humsafar Express'),
('19261', 'Gatimaan Express');

INSERT INTO station (station_id, station_name) VALUES
('can', 'kannur'),
('clt', 'calicut'),
('ers', 'ernakulam'),
('kyj', 'kayamkulam'),
('tcr', 'thrissur');

INSERT INTO train_status (status_id, status_descp, avail_seat, booked_seat, train_id) VALUES
('CNF', 'confirmed', 120, 2, '01068'),
('RAC', 'reservation against cancellation', 10, 1, '06304'),
('WL', 'waiting list', 1, 1, '12217');

INSERT INTO book (booking_id, bdate, tcost, u_id, status_id, pnr, board_station, destination_station) VALUES
('b01', '2019-10-08', '245', 'u101', 'CNF', '409801', 'can', 'kyj'),
('b02', '2019-10-08', '200', 'u102', 'CNF', '409802', 'clt', 'kyj'),
('b03', '2019-10-30', '120', 'u103', 'RAC', '409803', 'clt', 'ers'),
('b04', '2019-11-30', '50', 'u104', 'RAC', '409804', 'tcr', 'ers'),
('b05', '2019-08-16', '120', 'u105', 'RAC', '409805', 'tcr', 'kyj');

INSERT INTO passenger_train (train_id, t_name, avail_class, no_of_passengers) VALUES
('01068', 'Maveli Express', 'SL', 200),
('06304', 'Malabar Express', 'SL', 250),
('12217', 'Jan Shadabdi', '2S', 260);

INSERT INTO cargo_train (train_id, t_name, type_of_goods) VALUES
('19259', 'Humsafar Express', 'coal'),
('19261', 'Gatimaan Express', 'petrol');

INSERT INTO schedule (train_id, station_id, arr_time, depart_time) VALUES
('01068', 'can', '21:15:00', '21:20:00'),
('01068', 'clt', '22:10:00', '22:20:00'),
('01068', 'ers', '03:00:00', '03:05:00'),
('01068', 'kyj', '06:00:00', '06:10:00'),
('01068', 'tcr', '01:55:00', '02:00:00'),
('06304', 'clt', '22:15:00', '22:25:00'),
('06304', 'ers', '02:10:00', '02:15:00'),
('06304', 'tcr', '01:30:00', '01:35:00'),
('12217', 'can', '10:00:00', '10:05:00'),
('12217', 'clt', '11:05:00', '11:10:00'),
('12217', 'ers', '01:45:00', '01:50:00'),
('12217', 'kyj', '06:00:00', '06:10:00'),
('12217', 'tcr', '01:00:00', '01:10:00'),
('19259', 'can', '04:00:00', '04:10:00'),
('19259', 'clt', '02:00:00', '02:10:00'),
('19259', 'tcr', '12:00:00', '12:10:00'),
('19261', 'can', '06:50:00', '07:00:00'),
('19261', 'clt', '04:15:00', '04:20:00'),
('19261', 'ers', '01:00:00', '01:10:00'),
('19261', 'kyj', '21:00:00', '21:15:00'),
('19261', 'tcr', '01:50:00', '01:55:00');

INSERT INTO start (train_id, station_id) VALUES
('01068', 'can'),
('12217', 'can'),
('06304', 'clt'),
('19261', 'kyj'),
('19259', 'tcr');

INSERT INTO endstation (train_id, station_id) VALUES
('19259', 'can'),
('19261', 'can'),
('06304', 'ers'),
('01068', 'kyj'),
('12217', 'kyj');

INSERT INTO facilities (order_id, train_id, facility_type) VALUES
('o181', '01068', 'catering'),
('o184', '01068', 'sanitation'),
('o182', '06304', 'sanitation'),
('o185', '06304', 'catering'),
('o183', '12217', 'catering');

select * from userinfo;
select * from passenger;
select * from train;
select * from station;
select * from train_status;
select * from book;
select * from passenger_train;
select * from cargo_train;
select * from schedule;
select * from start;
select * from endstation;
select * from facilities;

select status_id,count(status_id) as status_count from book group by status_id; --1

select t_name, no_of_passengers from passenger_train order by no_of_passengers desc; --2

select * from passenger natural join book; --3

select * from passenger_train left outer join train_status using (train_id);  --3

select * from book where bdate > '2019-10-01' and destination_station = 'kyj'; --4


update book set tcost = tcost + 30 from train_status,train where book.status_id = train_status.status_id and train_status.train_id = train.train_id; --5 

select * from book; --5

select * from passenger where p_fname like 'v%';  --6

select bdate ,extract(month from bdate) as booking_month from book; --7

select pnr,to_char(bdate,'DD/Month/YYYY') as booking_date from book; --7

select pnr, bdate as booking_date from book where bdate between '2019-10-01' and '2019-10-31';  --8

select pnr, bdate as booking_date from book where bdate not between '2019-10-01' and '2019-10-31'; --8

select * from book where status_id in ('RAC', 'CNF', 'WL'); --8

select * from book where status_id not in ('WL'); --8

select userinfo.username from userinfo, book where userinfo.u_id = book.u_id and status_id = 'RAC' union select userinfo.username from userinfo, book where userinfo.u_id = book.u_id and status_id = 'WL'; --9

select username from userinfo where u_id in (select u_id from book where destination_station = 'kyj') --10

select * from passenger_train where train_id = any (select train_id from start where station_id = 'can'); --11

select * from passenger_train where train_id = all (select train_id from start where station_id = 'can'); --11

select * from passenger_train where exists (select train_id from start where passenger_train.train_id=start.train_id and start.station_id = 'can'); --11

select * from passenger_train where not exists (select train_id from start where passenger_train.train_id=start.train_id and start.station_id = 'can'); --11
