use master
go
if exists(select * from sysdatabases where name = 'NguyenVanA')
drop database NguyenVanA
Create database NguyenVanA
go
use NguyenVanA
go
create database QLsinhvienIT
use QLsinhvienIT

create table KETQUA
(
	MASV char(3),
	MAMH char(2),
	LANTHI Tinyint,
	DIEM Decimal(4,2),
	constraint PK_KETQUA primary key(MASV,MAMH, LANTHI)
)

create table DMKHOA
(
	MAKHOA char(2),
	TENKHOA nVarChar(20),
	constraint PK_DMKhoa primary key(MAKHOA),
)

create table DMMH
(
	MAMH char(2),
	TENMH nVarChar(30),
	SOTIET Tinyint,
	constraint PK_DMMH primary key(MAMH),
)

create table DMSV
(
	MASV char(3),
	HOSV nVarChar(30),
	TENSV nVarChar(10),
	PHAI bit,
	NGAYSINH Datetime,
	NOISINH nVarChar(25),
	MAKH char(2),
	HOCBONG float,
	constraint PK_DMSV primary key(MASV),
)


	alter table KETQUA add constraint FK_KETQUA_DMMH FOREIGN KEY (MAMH) references DMMH(MAMH)
	alter table KETQUA add	constraint FK_KETQUA_DMSV foreign key(MASV) references DMSV(MASV)
	alter table DMSV add constraint FK_DMSV_DMKHOA foreign key(MAKH) references DMKHOA(MAKHOA)

insert into DMKHOA
	values('AV', N'Anh Văn'),
	('TH', N'Tin Học'),
	('TR', N'Triết'),
	('VL', 'Vật Lý')

alter table dmmh add SOTIET Tinyint
insert into DMMH (MAMH,TENMH,SOTIET)
	values('01', N'Cơ sở dữ liệu', '45'),
	('02', N'Trí tuệ nhân tạo', '45'),
	('03', N'Truyền tin', '45'),
	('04', N'Đồ họa', '60'),
	('05', N'Văn phạm', '60'),
	('06', N'Kỹ thuật lập trình', '45')
	
insert into DMSV(MASV,HOSV,TENSV,PHAI,NGAYSINH,NOISINH,MAKH,HOCBONG)
	values('A01',N'Nguyễn Thị',N'Hải',1,23/02/1993,N'Hà Nội','TH',130000),
		('A02',N'Trần Văn',N'Chính',0,24/12/1992,N'Bình Định','VL',150000),
		('A03',N'Lê Thu Bạch',N'Yến',1,21/02/1993,'TP HCM','TH',170000),
		('A04',N'Trần Anh',N'Tuấn',0,20/12/1994,N'Hà Nội','AV',80000),
		('B01',N'Trần Thanh',N'Mai',1,12/08/1993,N'Hải Phòng','TR',0),
		('B02',N'Trần Thị Thu',N'Thủy',1,02/01/1994,'TP HCM','AV',0)
insert into KETQUA(MASV,MAMH,LANTHI,DIEM)
	values('A01','01',1,3),
		('A01','01',2,6),
		('A01','02',2,6),
		('A01','03',1,5),
		('A02','01',1,4.5),
		('A02','01',2,7),
		('A02','03',2,10),
		('A02','05',1,9),
		('A03','01',1,2),
		('A03','01',2,5),
		('A03','03',1,2.5),
		('A03','03',2,4),
		('A04','05',2,10),
		('B01','01',1,7),
		('B01','03',1,2.5),
		('B01','03',2,5),
		('B02','02',1,6),
		('B02','04',1,10)	
sp_tables DMKHOA
sp_columns DMSV
sp_pkeys DMSV
sp_helpconstraint DMKHOA
alter table DMKHOA add NamTL int
alter table DMKHOA alter column NamTL smallint 
exec sp_rename 'DMKHOA.NamTL', 'NamThanhLap' 
alter table DMKHOA drop column NamThanhLap
alter table DMSV drop  FK_DMSV_DMKHOA
alter table DMSV add constraint FK_DMSV_KHOA Foreign Key (MAKH) references DMKHOA (MAKHOA)

