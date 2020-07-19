use master
go

if exists(select * from sysdatabases where name='BookDB')
drop database BookDB
go

create database BookDB
go

use BookDB
go

if exists(select * from sysobjects where name='UserInfo')
drop table UserInfo
go

create table UserInfo
(
	UserID int primary key identity(1,1),
	UserName varchar(50) not null,
	UserPwd varchar(50) check(len(UserPwd)>=6 and len(UserPwd)<=50) not null,
	UserSex nchar(1) not null check(UserSex='男' or UserSex='女'),
	UserBirth datetime not null,
	Email varchar(50) not null
)
go

if exists(select * from sysobjects where name = 'wedBookType')
drop table webBookType 

create table webBookType
(
	wid int primary key identity(1,1),
	wname varchar(20) not null unique
)
go

if exists(select * from sysobjects where name = 'BookType')
drop table BookType

create table BookType
(
	TypeId int primary key identity(1,1),
	TypeName varchar(25) not null ,
	wid int not null
)
go

if exists(select * from sysobjects where name='BookInfo')
drop table BookInfo

create table BookInfo
(
	BookId int primary key identity(1,1),
	TypeId int not null references BookType(TypeId),
	BookName varchar(50) not null,
	BookPrice numeric(18,2) not null,
	BookDisCount numeric(4,1) not null,
	BookAuthor varchar(25) not null,
	BookPress varchar(25) not null,
	PressTime datetime not null,
	PicPath varchar(25) not null,
	SellCount int default(0)
)
go

if exists(select * from sysobjects where name = 'ShopCarInfo')
drop table ShopCarInfo

create table ShopCarInfo
(
	CarID int primary key identity(1,1),
	Num int,
	UserID int references UserInfo(UserID),
	GoodsID int references BookInfo(BookId)
)

go

--=======user==========
insert into UserInfo values('admin','123456','男','1990-9-19','admin@qq.com')
insert into UserInfo values('user1','123456','女','1990-9-19','test001@qq.com')
insert into UserInfo values('amy','123456','女','1990-9-19','test002@qq.com')
--============WebBookType
insert into WebBookType values('生活')
insert into WebBookType values('小说')
insert into WebBookType values('计算机编程')
--==========BookType
insert into BookType values('养生保健',1)
insert into BookType values('烹饪美食',1)
insert into BookType values('时尚美妆',1)

insert into BookType values('中国当代小说',2)
insert into BookType values('外国小说',2)
insert into BookType values('心灵鸡汤小说',2)

insert into BookType values('.NET',3)
insert into BookType values('C++',3)
insert into BookType values('JAVA',3)
insert into BookType values('PHP',3)
--=======BookInfo
insert into BookInfo values(1,'运动饮食1:9',16.70,0.8,'森拓郎著','九州出版社','2012-05-06','1900335746-1_l.jpg',50)
insert into BookInfo values(1,'轻断食',19.40,0.8,'麦克尔·莫斯利','百花洲文艺出版社','2012-05-06','1900450950-1_l_4.jpg',60)
insert into BookInfo values(1,'经络穴位按摩大全',31.10,0.6,'柳顺玉','民主与建设出版社','2012-05-06','1900430142-1_l_3.jpg',70)

insert into BookInfo values(2,'家常菜',16.70,0.8,'顾漫','九州出版社','2012-05-06','1043133031-1_b_1.jpg',50)
insert into BookInfo values(2,'法式烘焙宝典',19.40,0.8,'云拿月','百花洲文艺出版社','2012-05-06','1154688672-1_b_7.jpg',60)
insert into BookInfo values(2,'排骨的150种做法',31.10,0.6,'高嘉程','民主与建设出版社','2012-05-06','1277925879-2_b_2.jpg',70)

insert into BookInfo values(3,'瑜伽',16.70,0.8,'安安','九州出版社','2012-05-06','1163118140-1_b_4.jpg',50)
insert into BookInfo values(3,'蔬果汁',19.40,0.8,'宝贝','百花洲文艺出版社','2012-05-06','25278092-1_l.jpg',60)
insert into BookInfo values(3,'听肌肤的话',31.10,0.6,'CC','民主与建设出版社','2012-05-06','24102376-1_b_6.jpg',70)

insert into BookInfo values(4,'何以笙箫默',16.70,0.8,'顾漫','九州出版社','2012-05-06','20180424223706972673.png',50)
insert into BookInfo values(4,'小清欢',19.40,0.8,'云拿月','百花洲文艺出版社','2012-05-06','20180424223723518240.png',60)
insert into BookInfo values(4,'笑着活下去',31.10,0.6,'高嘉程','民主与建设出版社','2012-05-06','20180424223940583148.png',70)

insert into BookInfo values(5,'心智成熟的旅程',35.80,0.8,'斯科特·派克','中华工商联合出版社','2012-05-06','20180424224215730397.png','80')

insert into BookInfo values(5,'柳林风声',67.00,0.8,'[英]肯尼斯格雷厄姆','贵州人民出版社','2012-05-06','20180424224555943454.png','20')
insert into BookInfo values(5,'去旅行2',35.80,0.8,'米莉·卡布罗尔','广西科学技术出版社','2012-05-06','20180424223903732136.png','30')

insert into BookInfo values(6,'你的善良必须有点锋芒 ',15.80,0.8,'慕颜歌','古吴轩出版社','2012-05-06','20180424224002476193.png','20')
insert into BookInfo values(6,'格局',18.00,0.8,'何权峰','江苏文艺出版社','2012-05-06','20180424224037870530.png','20')
insert into BookInfo values(6,'愿你的青春不负梦想',24.80,0.8,'俞敏洪','湖南文艺出版社','2012-05-06','20180424224347449804.png','20')


insert into BookInfo values(7,'C#程序设计基础',60,0.8,'Charles Petzold','人民邮电出版社','2011-02-01','9787302146452.jpg',51)
insert into BookInfo values(7,'C#案例开发集锦',40,0.7,'Stanley B.Lippman','电子工业出版社','2011-02-19','9787121017223.jpg',12)
insert into BookInfo values(7,'ASP.NET入门精典',100,0.6,'Charles Petzold','清华出版社','2012-04-25','9787302133247.jpg',1)
insert into BookInfo values(7,'ASP.NET开发技术详解',89,0.5,'Jeff Prosise','人民邮电出版社','2011-02-01','9787115129659.jpg',36)

insert into BookInfo values(8,'21天学通C++',69,0.8,'Bjarne Stroustrup','人民邮电出版社','2007-02-01','9787115136923.jpg',67)
insert into BookInfo values(8,'C++ Primer',120,0.7,'Stanley B.Lippman','清华出版社','2001-02-05','9787115145543.jpg',9)
insert into BookInfo values(8,'C++编程思想',130,0.6,'Nicolai M.Josuttis','人民邮电出版社','2011-02-25','9787111108078.jpg',8)
insert into BookInfo values(8,'C++游戏程序设计',89,0.5,'Stanley B.Lippman','人民邮电出版社','2011-02-01','9787113061548.jpg',0)

insert into BookInfo values(9,'Java实例宝典',120,0.7,'Bruce Eckel','人民邮电出版社','2011-02-05','9787121036514.jpg',10)
insert into BookInfo values(9,'JavaME最佳实践',130,0.6,'阎宏','电子工业出版社','2012-02-25','9787121033038.jpg',30)
insert into BookInfo values(9,'Hibernate开发宝典',89,0.5,'孙卫琴','电子工业出版社','2010-02-01','9787121026348.jpg',55)
insert into BookInfo values(9,'J2EE应用开发',150,0.5,'James Gosling','清华出版社','2009-02-01','9787121032158.jpg',0)

insert into BookInfo values(10,'细说PHP',69,0.8,'Bjarne Stroustrup','人民邮电出版社','2007-02-01','RQKKMssAAnjj149.jpg',10)
insert into BookInfo values(10,'从零开始学PHP',120,0.7,'Stanley B.Lippman','清华出版社','2001-02-05','5566e4b4Nb156fe14.jpg',5)
insert into BookInfo values(10,'PHP入门经典',130,0.6,'Nicolai M.Josuttis','人民邮电出版社','2011-02-25','55b8a409N20918431.jpg',8)



select * from UserInfo
select * from BookInfo


select UserID from UserInfo where UserName='admin' and UserPwd='123456'