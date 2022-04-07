use master
go
if exists(select * from sysdatabases where name = 'NguyenVanA')
	drop database NguyenVanA
Create database NguyenVanA
go
use NguyenVanA
go

create table KETQUA
(
	MASV char(3),
	MAMH char(2),
	LANTHI Tinyint,
	DIEM Decimal(4,2),
	constraint PK_KETQUA primary key(MASV,MAMH,LANTHI)
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
	HOCBONG int,
	constraint PK_DMSV primary key(MASV),
)


	alter table KETQUA add constraint FK_KETQUA_DMMH FOREIGN KEY (MAMH) references DMMH(MAMH)
	alter table KETQUA add constraint FK_KETQUA_DMSV foreign key(MASV) references DMSV(MASV)
	alter table DMSV add constraint FK_DMSV_DMKHOA foreign key(MAKH) references DMKHOA(MAKHOA)

insert into DMKHOA
	values('AV', N'Anh Văn'),
	('TH', N'Tin Học'),
	('TR', N'Triết'),
	('VL', N'Vật Lý')

--alter table DMMH add SOTIET Tinyint
insert into DMMH (MAMH,TENMH,SOTIET)
	values('01', N'Cơ sở dữ liệu', '45'),
	('02', N'Trí tuệ nhân tạo', '45'),
	('03', N'Truyền tin', '45'),
	('04', N'Đồ họa', '60'),
	('05', N'Văn phạm', '60'),
	('06', N'Kỹ thuật lập trình', '45')
set dateformat dmy
insert into DMSV(MASV,HOSV,TENSV,PHAI,NGAYSINH,NOISINH,MAKH,HOCBONG)
	values('A01',N'Nguyễn Thị',N'Hải',1,'23/02/1993',N'Hà Nội','TH',130000),
		('A02',N'Trần Văn',N'Chính',0,'24/12/1992',N'Bình Định','VL',150000),
		('A03',N'Lê Thu Bạch',N'Yến',1,'21/02/1993','TP HCM','TH',170000),
		('A04',N'Trần Anh',N'Tuấn',0,'20/12/1994',N'Hà Nội','AV',80000),
		('B01',N'Trần Thanh',N'Mai',1,'12/08/1993',N'Hải Phòng','TR',0),
		('B02',N'Trần Thị Thu',N'Thủy',1,'02/01/1994','TP HCM','AV',0)
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
		
			
alter table DMKHOA add NamTL int
alter table DMKHOA alter column NamTL smallint 
exec sp_rename 'DMKHOA.NamTL', 'NamThanhLap' 
alter table DMKHOA drop column NamThanhLap
alter table DMSV drop  FK_DMSV_DMKHOA
alter table DMSV add constraint FK_DMSV_KHOA Foreign Key (MAKH) references DMKHOA (MAKHOA)

select * from DMSV

update DMMH
set SOTIET = 45
where TENMH = N'Văn Phạm'

update DMSV
set TENSV = N'Kỳ'
Where HOSV = N'Trần Thanh' and TENSV = N'Mai'

update DMSV
set PHAI = 0
Where PHAI = 1

update DMSV
set NGAYSINH = 05/07/1997
where HOSV = N'Trần Thị Thu' and TENSV = N'Thủy'

update DMSV
set HOCBONG = HOCBONG + 100000
where MAKH = 'AV'

delete from KETQUA
where LANTHI =2 and DIEM<5

delete from DMSV
where HOCBONG = 0

SELECT MAMH, TENMH, SOTIET       
FROM  DMMH   
WHERE TenMH like N'T%' 

select HOSV,TENSV,NGAYSINH,PHAI
from DMSV
where TENSV like N'%i'

select MAKHOA, TENKHOA
from DMKHOA
where TENKHOA like N'_N%'

select TENSV
from DMSV
where TENSV like N'%Thị%'

select MASV,HOSV,TENSV,PHAI,HOCBONG
from DMSV
where TENSV like '[abcdefghijkm]%'

select HOSV,TENSV,MAKH,NOISINH,HOCBONG
from DMSV
where HOCBONG > 150000 and NOISINH = N'Hà Nội'

select MASV,MAKH,PHAI
from DMSV
where MAKH = '[AV,VL]'

select MASV,NGAYSINH,NOISINH,HOCBONG
from DMSV
where NGAYSINH >= 01/01/1992 and NGAYSINH <= 05/06/1993

select MASV,NGAYSINH,PHAI,MAKH
from DMSV 
where HOCBONG >= 80000 and HOCBONG <= 150000

select MAMH,TENMH,SOTIET
from DMMH
where SOTIET > 30 and SOTIET < 45

select MASV,HOSV,TENSV,TENKHOA,PHAI
from DMSV,DMKHOA
where DMSV.MAKH = DMKHOA.MAKHOA 
and PHAI = 0 and (TENKHOA = N'Anh Văn' or TENKHOA = 'Tin Học')

select * from DMSV
select * from DMKHOA
select * from DMMH
select * from KETQUA
select HOSV,TENSV,TENMH,PHAI,DIEM,KETQUA.MASV,DMSV.MASV
from DMSV,DMMH,KETQUA
where KETQUA.MASV=DMSV.MASV and KETQUA.MAMH = DMMH.MAMH
and DIEM<5 and TENMH = N'Cơ Sở Dữ Liệu'

select MASV,HOSV,TENSV,TENKHOA,NOISINH,HOCBONG
from DMKHOA,DMSV
where DMKHOA.MAKHOA=DMSV.MAKH
and TENKHOA = N'Anh Văn'and HOCBONG = 0

 SELECT HOSV+ ' ' +TENSV AS HoTenSV, NgaySinh, NoiSinh
 FROM DMSV
 WHERE TenSV like '%[a-m]%'
 ORDER BY TenSV ASC
 
select MASV,HOSV,TENSV,HOCBONG
from DMSV
where MASV like '[AB]%'
order by MASV ASC

select HOSV + ' ' + TENSV as HoTenSV, NGAYSINH,HOCBONG
from DMSV
order by NGAYSINH asc, HOCBONG desc

select MASV,HOSV + ' ' + TENSV as HOTENSV,MAKH,HOCBONG
from DMSV
order by MAKH DESC

SELECT HOSV, TENSV, NOISINH, NGAYSINH
FROM DMSV
WHERE NoiSinh like N'Hà Nội' AND MONTH(NgaySinh) = 2

select HOSV + ' ' +  TENSV as HOTENSV, (YEAR(GETDATE()) - YEAR(NGAYSINH)) as Tuoi ,HOCBONG
from DMSV
where (YEAR(GETDATE()) - YEAR(NGAYSINH)) > 20 

select * from DMKHOA
select HOSV + ' ' + TENSV as HOTENSV, (YEAR(GETDATE()) - YEAR(NGAYSINH)) as Tuoi,
TENKHOA 
from DMSV,DMKHOA
where (YEAR(GETDATE()) - YEAR(NGAYSINH)) between 20 and 25

select HOSV + ' ' + TENSV as HOTENSV,PHAI,NGAYSINH
from DMSV
where DATEPART("q", NGAYSINH) = 1 and YEAR(NGAYSINH) = 1990

SELECT MASV, PHAI, MaKH,
MucHocBong = CASE WHEN HocBong > 500000
THEN 'Hoc bong cao' ELSE 'Muc trung binh' END
FROM DMSV

select HOSV + ' ' + TENSV as HOTENSV,LANTHI,DIEM,
ketqua = case when DIEM > 5 then N'ĐẬU' else N'RỚT'END
from DMSV, KETQUA,DMMH
where DMMH.MAMH = KETQUA.MAMH
order by DIEM asc
--4.1 
select COUNT(*) as slsv
from DMSV
--4.2
select SUM(case PHAI when 1 then 1
else null END) as SLNU
,SUM(case PHAI when 0 then 1
else null END) as SLNAM
from DMSV
--4.3
select MAKH,TENKHOA,COUNT(MASV) as SOSV
from DMSV,DMKHOA
where DMSV.MAKH = DMKHOA.MAKHOA
group by DMSV.MAKH,TENKHOA
--4.4
select * from KETQUA
select TENMH,COUNT(DISTINCT MASV) as SOMH
from DMMH,KETQUA
where DMMH.MAMH=KETQUA.MAMH
GROUP BY DMMH.MAMH,TENMH
--4.5
select * from KETQUA
select MAMH,COUNT(MAMH) as SLMH
from KETQUA
group by MAMH
--4.6
select MAKH, MAX(HOCBONG)as HBCK
from DMSV,DMKHOA
where DMSV.HOCBONG = DMKHOA.MAKHOA
group by DMSV.HOCBONG,MAKH
--4.7
select MAKHOA,TENKHOA,
SUM(CASE WHEN PHAI = 0 THEN 1 else 0 end) as TNAM,
sum(Case when phai =1 then 1 else 0 end) as TNU
from DMSV,DMKHOA
where DMKHOA.MAKHOA = DMSV.MAKH
group by DMKHOA.MAKHOA, TENKHOA
--4.8 
select COUNT(MASV) as SLSV, YEAR(GETDATE()) - YEAR(NGAYSINH) as TUOI
from DMSV 
group by YEAR(GETDATE()) - YEAR(NGAYSINH)
--4.9
select ketqua = case when DIEM > 5 then N'ĐẬU' else N'RỚT'END,
LANTHI = case when LANTHI = 1 then 1 else null end
from DMSV,KETQUA
where DMSV.MASV = KETQUA.MASV 
--5.1
select YEAR(NGAYSINH) as namsinh,COUNT(*)
from DMSV
group by YEAR(NGAYSINH)
having COUNT(*)= 2
--5.2 
select NOISINH,COUNT(*)as SL
from DMSV
group by NOISINH
having COUNT(*) >= 2
--5.3
select * from KETQUA
select MASV,MAMH,COUNT(*)as SOLUONGSVTHI
from KETQUA
group by MAMH,MASV
having MAMH >=3