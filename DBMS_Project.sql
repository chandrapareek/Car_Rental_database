use car_rental;
create database car_rental;


create table customer_details(
customer_id varchar(8) primary key,
name varchar(20),
c_addhar_no varchar(12),
sex varchar(1),
e_mail varchar(20),
dob date,
c_address varchar(30),
customer_contact numeric(10),
age numeric(3)
);
alter table customer_details drop foreign key customer_details_ibfk_1;
alter table  customer_details modify c_address varchar(100) ;
alter table customer_details drop age;
desc customer_details;
create table c_contact(
customer_id varchar(8), foreign key(customer_id) references customer_details(customer_id),
c_contact_no numeric(10) primary key
);

create table login_details(
username varchar(10) primary key,
password varchar(20),
customer_id varchar(8), foreign key(customer_id) references customer_details(customer_id)
);

create table insurance_details(
insurance_id varchar(8) primary key,
customer_id varchar(8), foreign key(customer_id) references customer_details(customer_id),
insurance_Status varchar(1),
insurance_price numeric(7)
);


create table trip_details(
trip_id varchar(8) primary key,
start_point varchar(30),
end_point varchar(30),
start_date date,
end_date date,
customer_id varchar(8), foreign key(customer_id) references customer_details(customer_id)
);

create table payment_details(
customer_id varchar(8), foreign key(customer_id) references customer_details(customer_id),
cvv numeric(3),
card_no numeric(16),
expiry_date date,
payment_id varchar(8),
date_of_payment date,
total_pay numeric(10),
b_address varchar(30),
cash varchar(1)
);

update login_details set password="password1" where username = "user1";
desc login_details;
select * from login_details;
create table employee(
addhar_no numeric(12) primary key
);

alter table manager_details
add constraint foreign key (addhar_no) references employee(addhar_no);
create table manager_details(
manager_id varchar(8) primary key,
addhar_no numeric(12), foreign key (addhar_no) references employee(addhar_no),
m_name varchar(20),
m_dob date,
m_sex varchar(1),
m_address varchar(30),
m_age numeric(3)
);

alter table manager_details drop m_age;
alter table  manager_details modify m_address varchar(100) ;

create table m_contact(
m_contact_no numeric(10) primary key,
manager_id varchar(8),
foreign key(manager_id) references manager_details(manager_id)
);

create table driver_details(
driver_id varchar(8) primary key,
d_name varchar(20),
d_sex varchar(1),
d_dob date,
d_address varchar(30),
d_status varchar(1),
d_age numeric(3),
addhar_no numeric(12), foreign key(addhar_no) references employee(addhar_no),
manager_id varchar(8) ,foreign key(manager_id) references manager_details(manager_id),
trip_id varchar(8), foreign key(trip_id) references trip_details(trip_id),
d_mail varchar(20)
);
alter table driver_details drop d_age;
alter table  driver_details modify d_address varchar(100) ;
create table car_details(
car_id varchar(8),
car_no varchar(8),
car_model varchar(14),
car_type varchar(10),
status varchar(1),
trip_id varchar(8), foreign key(trip_id) references trip_details(trip_id),
driver_id varchar(8), foreign key(driver_id) references driver_details(driver_id)
);


alter table  d_contact modify d_contact_no numeric(10) ;
create table d_contact(
driver_id varchar(8), foreign key(driver_id) references driver_details(driver_id),
d_contact_no numeric(8) primary key 
);

INSERT INTO customer_details(customer_id, name, c_addhar_no, sex, e_mail, dob ,c_address, customer_contact) values
("C0000001","Ishaan","393723115632","M", "ishaan@gmail.com", "1998-09-06", "B 448 , Nehru Ground, N I T, Faridabad,Delhi","3638521816"),
("C0000002","Dhruv","416252058290","M", "dhruv@gmail.com", "1999-07-03","7/8, Nakhoda Roghay Mkt 7, 8th Nagdevi Street, Masjid Bunder (west),Mumbai","9061577753"),
("C0000003","Inaya","972026257738","f", "inaya@gmail.com", "2001-08-11","9/272 Mhb Colony, Sunder Nagar, Vidya Nagar Mumbai","7674442765"),
("C0000004","Shyla","401839783409","f", "shyla@gmail.com", "1996-03-15","58, Mahendra Chambers, Dr D N Rd, Fort Mumbai","2498559978"),
("C0000005","Amar","253917474756","M", "amar@gmail.com", "2002-05-18","E 156 Basement Delhi","6454667432"),
("C0000006","Diya","459527321129","f", "diya@gmail.com", "1997-02-04","16, Murugesh Mudaliar Lane, Nagarathpet Bangalore","7464900115"),
("C0000007","Agastya","221156647163","M", "agastya@gmail.com", "1992-01-19","Pl No 15/b2, B P T Coal Depot, Opp Charcoal Association, Sewri (east) Mumbai","6875170307"),
("C0000008","Ananya","512339738861","f", "ananya@gmail.com", "1989-07-15","D-127, Mohammadpur, Bhikaji Cama Place Delhi","2407740829"),
("C0000009","Aditi","502108706056","f", "aditi@gmail.com", "1994-09-22","D/88, Vashi Plaza, Sector 17, Vashi Mumbai","7718184771"),
("C0000010","Ajay","649403733859","M", "ajayn@gmail.com", "1991-11-27","1 St Flr, Unit No 106, Bhandup Indl Estate, Lbs Marg, Bhandup (west) Mumbai","9851577684");

INSERT INTO c_contact values
("C0000001", "9200507009"),
("C0000002", "9061374404"),
("C0000003", "5844657463"),
("C0000004", "5606963683"),
("C0000005", "4225949548"),
("C0000006", "1522438864"),
("C0000007", "6194986466"),
("C0000008", "2026057932"),
("C0000009", "4908696872"),
("C0000010", "3886507774");

INSERT INTO login_details values
("user1", "pass1", "C0000001"),
("user2", "pass2", "C0000002"),
("user3", "pass3", "C0000003"),
("user4", "pass4", "C0000004"),
("user5", "pass5", "C0000005"),
("user6", "pass6", "C0000006"),
("user7", "pass7", "C0000007"),
("user8", "pass8", "C0000008"),
("user9", "pass9", "C0000009"),
("user10", "pass10", "C0000010");


INSERT INTO manager_details values
("M000001", "957070275895", "Ryka Thakur", "1991-10-31", "M", "2a/13, Manali Apts, Evershine Nagar, Malad (west) Mumbai"),
("M000002", "456881528446", "Rajnish Pandit", "1991-03-23", "M", "1st Floor, Vireshwar Chambers, M G Road, Nr Suncity, Vile Parle (east) Mumbai"),
("M000003", "753049401562", "Upasana Cheema", "1990-12-18", "F", "B-61, Dvs, Mahadevpura Bangalore"),
("M000004", "936261090239", "Anjali Patla", "1987-11-20", "F", " 205, A Bld, Nagaesh Chs, Lbs Rd, Naupada, Thane(w) Mumbai");

INSERT INTO m_contact values
("6663493507", "M000001"),
("8267728177", "M000002"),
("3826019986", "M000003"),
("6631528910", "M000004");

INSERT INTO trip_details values 
("T0001", "Mumbai", "Raipur", "2021-08-19", "2021-08-22", "C0000001"),
("T0002", "New Delhi", "Dehradun", "2021-05-22", "2021-05-23", "C0000002"),
("T0003", "Madurai", "Lucknow", "2021-12-14", "2021-12-16", "C0000003"),
("T0004", "Jabalpur", "Jalandhar", "2021-12-03", "2021-12-08", "C0000004"),
("T0005", "Visakhapatnam", "Ujjain", "2021-10-21", "2021-10-23", "C0000005"),
("T0006", "Nashik", "Thiruvananthapuram", "2021-06-15", "2021-06-19", "C0000006"),
("T0007", "Ludhiana", "Tirunelveli", "2021-03-20", "2021-03-24", "C0000007"),
("T0008", "Gwalior", "Allahabad", "2022-01-17", "2022-01-21", "C0000008"),
("T0009", "Kanpur", "Kolkata", "2021-01-20", "2021-01-23", "C0000009"),
("T0010", "Agra", "Aurangabad", "2022-01-19", "2022-01-24", "C0000010");

INSERT INTO employee values
("957070275895"),
("456881528446"),
("753049401562"),
("936261090239"),
("646797717875"),
("290177197652"),
("110597176523"),
("149137483596"),
("259036634060"),
("464315910923"),
("593167859149"),
("424280019185"),
("242944158010"),
("347917506404");


INSERT INTO driver_details values
("D001", "driver1", "M", "1988-04-08", "101, B Wing/10 Th Floor, Mittal Tower, Nariman Point, Nariman Point Mumbai, Maharashtra","Y", "646797717875", "M0000001","T0001", "d1@gmail.com"),
("D002", "driver2", "F", "1991-09-19", "19, Jogani Industrial Estate, Senapati Bapat Marg, Dadar (west) Mumbai, Maharashtra","Y", "110597176523", "M0000001","T0002", "d2@gmail.com"),
("D003", "driver3", "M", "1994-08-27", "402 Ram Niwas, A G B Indulkar Road, Vile Parle (east) Mumbai, Maharashtra","Y", "290177197652", "M0000002","T0003", "d3@gmail.com"),
("D004", "driver4", "F", "1989-06-17", "20g, Park Street, Park Street Kolkata, West Bengal","Y", "149137483596", "M0000003","T0004", "d4@gmail.com"),
("D005", "driver5", "M", "1996-02-14", "76 A, Ratan Terrace, T H Kataria Road, Mahim Mumbai, Maharashtra","Y", "259036634060", "M0000002","T0005", "d5@gmail.com"),
("D006", "driver6", "F", "1986-08-10", "154, Ashram Erangal, Madhmarve Road, Malad(e) Mumbai, Maharashtra","Y", "464315910923", "M0000004","T0006", "d6@gmail.com"),
("D007", "driver7", "M", "1993-01-13", "Bajiwadi, Aliyawar Jung Marg, Opp Centaur Hotel, Vile Parle Mumbai, Maharashtra","Y", "593167859149", "M0000003","T0007", "d7@gmail.com"),
("D008", "driver8", "F", "1990-02-06", "Y - 41, Janta Market, Nangloi Delhi","Y", "424280019185", "M0000001","T0008", "d8@gmail.com"),
("D009", "driver9", "M", "1987-04-23", "Bhel Complex, Prof Cnr Rao Circle Opp Iisc, Malleshwaram Bangalore, Karnataka","Y", "242944158010", "M0000004","T0009", "d9@gmail.com"),
("D010", "driver10", "M", "1989-12-26", "1, Purniah Chatram Road, Opp Bata Showroom, Balepet Bangalore, Karnataka","Y", "347917506404", "M0000003","T0010", "d10@gmail.com");

INSERT INTO d_contact values
("D001", "9007631428"),
("D002", "8502558344"),
("D003", "7002136171"),
("D004", "8543421066"),
("D005", "8839381882"),
("D006", "5495203716"),
("D007", "7483701545"),
("D008", "9870762220"),
("D009", "6368470984"),
("D010", "9841725404");

INSERT INTO insurance_details values
("I00001", "C0000001", "N", "1400"),
("I00002", "C0000002", "N", "1400"),
("I00003", "C0000003", "N", "1400"),
("I00004", "C0000004", "Y", "1400"),
("I00005", "C0000005", "N", "1400"),
("I00006", "C0000006", "N", "1400"),
("I00007", "C0000007", "N", "1400"),
("I00008", "C0000008", "Y", "1400"),
("I00009", "C0000009", "N", "1400"),
("I00010", "C0000010", "Y", "1400");

INSERT INTO car_details values
("C0001", "XY-123", "Skoda Octavia", "5","Y","T0001", "D0001"),
("C0002", "YZ-451", "Tata Punch", "5","Y","T0004", "D0004"),
("C0003", "RJ-678", "MG Hector", "5","Y","T0002", "D0002"),
("C0004", "KL-987", "Thar", "5","Y" ,"T0003", "D0003");



INSERT INTO payment_details values
("C0000001", "234", "784514627619", "2028-08-05", "P0001", "2022-08-01", "2000", "ADD1", "Y"),
("C0000003", "623", "313910219294", "2028-09-06", "P0002", "2022-04-17", "2500", "ADD2", "N"),
("C0000004", "789", "555523066672", "2028-08-01", "P0003", "2022-02-11", "3500", "ADD3", "Y"),
("C0000007", "561", "616364650414", "2028-04-05", "P0004", "2022-11-19", "4000", "ADD4", "N");

select max(total_pay) from payment_details;
#7
select *from customer_details inner join payment_details on customer_details.customer_id=payment_details.customer_id;
#8
update login_details set password="sdjahvksjh" where username="user6";
#9
select c.coustomer_id,c.name,p.total_pay,ca.car_model from customer_details as c ,payment_details as p,car_details as ca 
where customer_id = (select customer_id from insurance_details where insurance_status ='Y');
#10
select *from customer_details where name like '%a';
#11
select driver_id,d_name from driver_details where d_status='y';
#12
select car_id,car_model from car_details where status='y';
#13
select sum(total_pay) as TOTAL_PAYMENT from payment_details;