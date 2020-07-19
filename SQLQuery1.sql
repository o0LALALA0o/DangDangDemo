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
	UserSex nchar(1) not null check(UserSex='��' or UserSex='Ů'),
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
insert into UserInfo values('admin','123456','��','1990-9-19','admin@qq.com')
insert into UserInfo values('user1','123456','Ů','1990-9-19','test001@qq.com')
insert into UserInfo values('amy','123456','Ů','1990-9-19','test002@qq.com')
--============WebBookType
insert into WebBookType values('����')
insert into WebBookType values('С˵')
insert into WebBookType values('��������')
--==========BookType
insert into BookType values('��������',1)
insert into BookType values('�����ʳ',1)
insert into BookType values('ʱ����ױ',1)

insert into BookType values('�й�����С˵',2)
insert into BookType values('���С˵',2)
insert into BookType values('���鼦��С˵',2)

insert into BookType values('.NET',3)
insert into BookType values('C++',3)
insert into BookType values('JAVA',3)
insert into BookType values('PHP',3)
--=======BookInfo
insert into BookInfo values(1,'�˶���ʳ1:9',16.70,0.8,'ɭ������','���ݳ�����','2012-05-06','1900335746-1_l.jpg',50)
insert into BookInfo values(1,'���ʳ',19.40,0.8,'��˶���Ī˹��','�ٻ������ճ�����','2012-05-06','1900450950-1_l_4.jpg',60)
insert into BookInfo values(1,'����Ѩλ��Ħ��ȫ',31.10,0.6,'��˳��','�����뽨�������','2012-05-06','1900430142-1_l_3.jpg',70)

insert into BookInfo values(2,'�ҳ���',16.70,0.8,'����','���ݳ�����','2012-05-06','1043133031-1_b_1.jpg',50)
insert into BookInfo values(2,'��ʽ�決����',19.40,0.8,'������','�ٻ������ճ�����','2012-05-06','1154688672-1_b_7.jpg',60)
insert into BookInfo values(2,'�Źǵ�150������',31.10,0.6,'�߼γ�','�����뽨�������','2012-05-06','1277925879-2_b_2.jpg',70)

insert into BookInfo values(3,'�٤',16.70,0.8,'����','���ݳ�����','2012-05-06','1163118140-1_b_4.jpg',50)
insert into BookInfo values(3,'�߹�֭',19.40,0.8,'����','�ٻ������ճ�����','2012-05-06','25278092-1_l.jpg',60)
insert into BookInfo values(3,'�������Ļ�',31.10,0.6,'CC','�����뽨�������','2012-05-06','24102376-1_b_6.jpg',70)

insert into BookInfo values(4,'��������Ĭ',16.70,0.8,'����','���ݳ�����','2012-05-06','20180424223706972673.png',50)
insert into BookInfo values(4,'С�延',19.40,0.8,'������','�ٻ������ճ�����','2012-05-06','20180424223723518240.png',60)
insert into BookInfo values(4,'Ц�Ż���ȥ',31.10,0.6,'�߼γ�','�����뽨�������','2012-05-06','20180424223940583148.png',70)

insert into BookInfo values(5,'���ǳ�����ó�',35.80,0.8,'˹���ء��ɿ�','�л��������ϳ�����','2012-05-06','20180424224215730397.png','80')

insert into BookInfo values(5,'���ַ���',67.00,0.8,'[Ӣ]����˹���׶�ķ','�������������','2012-05-06','20180424224555943454.png','20')
insert into BookInfo values(5,'ȥ����2',35.80,0.8,'���򡤿����޶�','������ѧ����������','2012-05-06','20180424223903732136.png','30')

insert into BookInfo values(6,'������������е��â ',15.80,0.8,'Ľ�ո�','������������','2012-05-06','20180424224002476193.png','20')
insert into BookInfo values(6,'���',18.00,0.8,'��Ȩ��','�������ճ�����','2012-05-06','20180424224037870530.png','20')
insert into BookInfo values(6,'Ը����ഺ��������',24.80,0.8,'������','�������ճ�����','2012-05-06','20180424224347449804.png','20')


insert into BookInfo values(7,'C#������ƻ���',60,0.8,'Charles Petzold','�����ʵ������','2011-02-01','9787302146452.jpg',51)
insert into BookInfo values(7,'C#������������',40,0.7,'Stanley B.Lippman','���ӹ�ҵ������','2011-02-19','9787121017223.jpg',12)
insert into BookInfo values(7,'ASP.NET���ž���',100,0.6,'Charles Petzold','�廪������','2012-04-25','9787302133247.jpg',1)
insert into BookInfo values(7,'ASP.NET�����������',89,0.5,'Jeff Prosise','�����ʵ������','2011-02-01','9787115129659.jpg',36)

insert into BookInfo values(8,'21��ѧͨC++',69,0.8,'Bjarne Stroustrup','�����ʵ������','2007-02-01','9787115136923.jpg',67)
insert into BookInfo values(8,'C++ Primer',120,0.7,'Stanley B.Lippman','�廪������','2001-02-05','9787115145543.jpg',9)
insert into BookInfo values(8,'C++���˼��',130,0.6,'Nicolai M.Josuttis','�����ʵ������','2011-02-25','9787111108078.jpg',8)
insert into BookInfo values(8,'C++��Ϸ�������',89,0.5,'Stanley B.Lippman','�����ʵ������','2011-02-01','9787113061548.jpg',0)

insert into BookInfo values(9,'Javaʵ������',120,0.7,'Bruce Eckel','�����ʵ������','2011-02-05','9787121036514.jpg',10)
insert into BookInfo values(9,'JavaME���ʵ��',130,0.6,'�ֺ�','���ӹ�ҵ������','2012-02-25','9787121033038.jpg',30)
insert into BookInfo values(9,'Hibernate��������',89,0.5,'������','���ӹ�ҵ������','2010-02-01','9787121026348.jpg',55)
insert into BookInfo values(9,'J2EEӦ�ÿ���',150,0.5,'James Gosling','�廪������','2009-02-01','9787121032158.jpg',0)

insert into BookInfo values(10,'ϸ˵PHP',69,0.8,'Bjarne Stroustrup','�����ʵ������','2007-02-01','RQKKMssAAnjj149.jpg',10)
insert into BookInfo values(10,'���㿪ʼѧPHP',120,0.7,'Stanley B.Lippman','�廪������','2001-02-05','5566e4b4Nb156fe14.jpg',5)
insert into BookInfo values(10,'PHP���ž���',130,0.6,'Nicolai M.Josuttis','�����ʵ������','2011-02-25','55b8a409N20918431.jpg',8)



select * from UserInfo
select * from BookInfo


select UserID from UserInfo where UserName='admin' and UserPwd='123456'