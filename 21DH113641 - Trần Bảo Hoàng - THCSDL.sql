use master
go
if exists(select * from sysdatabases where name = 'TranBaoHoang')
	drop database TranBaoHoang
Create database TranBaoHoang
go
use TranBaoHoang
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
--5.4
SELECT KETQUA.MASV, HOSV, TENSV, SUM(
									CASE
									WHEN (LANTHI >= 2) THEN 1 ELSE 0 END) AS SOLAN
FROM KETQUA, DMSV
WHERE KETQUA.MASV = DMSV.MASV
GROUP BY KETQUA.MASV, HOSV, TENSV
HAVING SUM(	CASE
			WHEN (LANTHI >= 2) THEN 1 ELSE 0 END) >= 2

--5.5
select DMSV.MASV, HOSV, TENSV,avg(diem)as dtb
	from DMSV, KETQUA
	where DMSV.MASV= KETQUA.MASV
	and PHAI=0 and LANTHI =1
	group by DMSV.MASV, HOSV, TENSV
	having AVG(DIEM)>=7

--5.6
SELECT *FROM KETQUA
SELECT KETQUA.MASV, HOSV, TENSV, COUNT(DISTINCT MAMH)
	from DMSV, KETQUA
	WHERE (DMSV.MASV = KETQUA.MASV)
		AND (LANTHI = 1) AND (DIEM < 5)
	GROUP BY KETQUA.MASV, HOSV, TENSV
	HAVING  (COUNT(MAMH)>= 2)
	
--5.7
SELECT TENKHOA, SUM(
					CASE
					WHEN (PHAI = 0) THEN 1 ELSE 0 END) AS SOLSV

	FROM DMSV, DMKHOA
	WHERE DMSV.MAKH = DMKHOA.MAKHOA
	GROUP BY TENKHOA
	HAVING SUM(
				CASE
				WHEN (PHAI = 0) THEN 1 ELSE 0 END) >=2

--5.8
SELECT TENKHOA, COUNT(MAKH)
	FROM DMSV, DMKHOA
	WHERE DMSV.MAKH = DMKHOA.MAKHOA
	GROUP BY TENKHOA



SELECT*
	FROM DMSV, DMKHOA
	WHERE DMSV.MAKH = DMKHOA.MAKHOA
	
	
--6.2. Cho biết những sinh viên có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
--IM GAI TRI LON NHA CUA MON CSDL
--B2 TIM SV CO DIEM THI LAN THI MON CSDL = DIEM B1
SELECT DMSV.MASV, HOSV, TENSV, TENMH, DIEM
FROM KETQUA, DMMH, DMSV
WHERE KETQUA.MAMH= DMMH.MAMH AND DMSV.MASV=KETQUA.MASV
AND TENMH=N'Cơ sở dữ liệu'
AND LANTHI=1
AND DIEM=(SELECT MAX(DIEM)
			FROM KETQUA, DMMH
			WHERE KETQUA.MAMH= DMMH.MAMH
			AND TENMH=N'Cơ sở dữ liệu'
			AND LANTHI=1)
--Cho biết sinh viên khoa anh văn có tuổi lớn nhất. 
SELECT *
FROM DMSV, DMKHOA
WHERE DMSV.MAKH= DMKHOA.MAKHOA
AND TENKHOA=N'Anh Văn'
AND YEAR(NGAYSINH)=(SELECT MIN(YEAR(NGAYSINH))
					FROM DMSV, DMKHOA
					WHERE DMSV.MAKH= DMKHOA.MAKHOA
					AND TENKHOA=N'Anh Văn')

--6.4. Cho biết những sinh viên có cùng nơi sinh với sinh viên có mã số “A01” 
SELECT *
FROM DMSV
WHERE NOISINH = (SELECT NOISINH
	FROM DMSV
	WHERE MASV = 'A01')
	
--6.5. Cho biết sinh viên khoa anh văn học môn văn phạm có điểm thi lần 1 thấp nhất. 
SELECT *
FROM DMKHOA, KETQUA, DMSV
WHERE (DMKHOA.MAKHOA = DMSV.MAKH) AND (KETQUA.MASV = DMSV.MASV)
AND (TENKHOA = N'Anh Văn')
AND DIEM = (SELECT MIN(DIEM)
			FROM DMKHOA, KETQUA, DMSV
			WHERE (DMKHOA.MAKHOA = DMSV.MAKH) AND (KETQUA.MASV = DMSV.MASV)
			AND (TENKHOA = N'Anh Văn')
			AND (LANTHI = 1))

--6.6. Cho biết sinh viên thi môn cơ sở dữ liệu lần 2 có điểm bằng điểm cao nhất của sinh viên thi môn cơ sở dữ liệu lần 1. 
SELECT *
FROM DMSV, KETQUA, DMMH
WHERE DMSV.MASV = KETQUA.MASV AND DMMH.MAMH = KETQUA.MAMH
AND TENMH = N'Cơ sở dữ liệu'
AND LANTHI = 2
AND DIEM = (SELECT MAX(DIEM)
			FROM DMSV, KETQUA, DMMH
			WHERE DMSV.MASV = KETQUA.MASV AND DMMH.MAMH = KETQUA.MAMH
			AND TENMH = N'Cơ sở dữ liệu'
			AND LANTHI = 1)
			
--6.7. Cho biết sinh viên có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 môn cơ sở dữ liệu của những sinh viên khác. 
SELECT *
FROM DMSV, KETQUA, DMMH
WHERE DMSV.MASV = KETQUA.MASV AND DMMH.MAMH = KETQUA.MAMH 
AND TENMH = N'Cơ sở dữ liệu'
AND LANTHI = 2
AND DIEM > (SELECT MAX(DIEM)
			FROM DMSV, KETQUA, DMMH
			WHERE DMSV.MASV = KETQUA.MASV AND DMMH.MAMH = KETQUA.MAMH
			AND TENMH = N'Cơ sở dữ liệu' 
			AND LANTHI = 1)

--6.8. Cho biết những sinh viên có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn 
SELECT *
FROM DMSV, DMKHOA
WHERE DMSV.MAKH = DMKHOA.MAKHOA
AND HOCBONG > (SELECT MAX(HOCBONG)
				FROM DMSV, DMKHOA
				WHERE DMSV.MAKH = DMKHOA.MAKHOA
				AND TENKHOA = N'Anh Văn')
				
--7.1. Cho biết sinh viên có nơi sinh cùng với Hải.
SELECT *
FROM DMSV
WHERE TENSV NOT LIKE N'Hải'
AND NOISINH IN (SELECT NOISINH
					FROM DMSV
					WHERE TENSV LIKE N'Hải') 
					
	
--7.2. Cho biết những sinh viên có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn. 		
SELECT *
FROM DMSV
WHERE HOCBONG>ALL(SELECT HOCBONG
				FROM DMSV, DMKHOA
				WHERE DMSV.MAKH = DMKHOA.MAKHOA
				AND TENKHOA = N'Anh Văn')		

--7.3. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn. 
SELECT *
FROM DMSV, DMKHOA
WHERE DMSV.MAKH = DMKHOA.MAKHOA
AND TENKHOA != N'Anh Văn'
AND HOCBONG >= ANY (SELECT HOCBONG
					FROM DMSV, DMKHOA
					WHERE DMSV.MAKH = DMKHOA.MAKHOA
					AND TENKHOA = N'Anh Văn')

--7.4. Cho biết sinh viên có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 môn cơ sở dữ liệu của những sinh viên khác
SELECT DMSV.MASV, HOSV, TENSV, DIEM
FROM KETQUA, DMSV
WHERE KETQUA.MASV = DMSV.MASV
AND LANTHI = 2
AND DIEM >= ALL( SELECT DIEM
				FROM KETQUA, DMSV
				WHERE KETQUA.MASV = DMSV.MASV
				AND LANTHI = 2)


--7.5 Với mỗi sinh viên cho biết điểm thi cao nhất của môn tương ứng. 
SELECT K1.MASV, HOSV, TENSV, TENMH, DIEM
FROM KETQUA K1, DMSV, DMMH
WHERE K1.MASV=DMSV.MASV AND K1.MAMH = DMMH.MAMH
AND DIEM>=ALL(SELECT DIEM
				FROM KETQUA K2
				WHERE K2.MASV=K1.MASV)
	
--7.6. Cho biết môn nào có nhiều sinh viên học nhất. 
SELECT DMMH.MAMH, TENMH,COUNT(DISTINCT MASV)
FROM KETQUA, DMMH
WHERE KETQUA.MAMH= DMMH.MAMH
GROUP BY DMMH.MAMH, TENMH
HAVING COUNT(DISTINCT MASV)>=ALL(SELECT COUNT(DISTINCT MASV)
								FROM KETQUA
								GROUP BY MAMH)
--7.7. Cho biết những khoa có đông sinh viên nam học nhất. 
SELECT  TENKHOA, COUNT(MASV)AS SLSV
FROM DMSV, DMKHOA
WHERE DMSV.MAKH = DMKHOA.MAKHOA
AND PHAI = 0
GROUP BY TENKHOA
HAVING COUNT(MASV)>= ALL(SELECT COUNT(MASV)
							FROM DMSV, DMKHOA
							WHERE DMSV.MAKH = DMKHOA.MAKHOA
							AND PHAI = 0
							GROUP BY TENKHOA)

--7.8. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít sinh viên nhận học bổng nhất. 
SELECT TENKHOA, SUM(
					CASE
					WHEN (HOCBONG > 0) THEN 1 ELSE 0 END) AS SOLSV
FROM DMSV, DMKHOA
WHERE DMSV.MAKH = DMKHOA.MAKHOA
GROUP BY TENKHOA
HAVING SUM(
		CASE
		WHEN (HOCBONG > 0) THEN 1 ELSE 0 END) >=ALL(SELECT SUM(
																		CASE
																		WHEN (HOCBONG > 0) THEN 1 ELSE 0 END) AS SOLSV
													FROM DMSV, DMKHOA
													WHERE DMSV.MAKH = DMKHOA.MAKHOA
													GROUP BY TENKHOA)
UNION
(SELECT TENKHOA, SUM(
					CASE
					WHEN (HOCBONG > 0) THEN 1 ELSE 0 END) AS SOLSV
FROM DMSV, DMKHOA
WHERE DMSV.MAKH = DMKHOA.MAKHOA
GROUP BY TENKHOA
HAVING SUM(
		CASE
		WHEN (HOCBONG > 0) THEN 1 ELSE 0 END) <= ALL(SELECT SUM(
																		CASE
																		WHEN (HOCBONG > 0) THEN 1 ELSE 0 END) AS SOLSV
													FROM DMSV, DMKHOA
													WHERE DMSV.MAKH = DMKHOA.MAKHOA
													GROUP BY TENKHOA))


--7.9 Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất. 

--7.10. Cho biết 3 sinh viên có học nhiều môn nhất. 
--SELECT TOP 3 MASV, HOSV, TENSV, COUNT( DISTIN

--8.1. Cho biết sinh viên chưa thi môn cơ sở dữ liệu. 
SELECT * FROM DMSV
WHERE MASV NOT IN(SELECT MASV
				FROM KETQUA, DMMH
				WHERE KETQUA.MAMH= DMMH.MAMH
				AND TENMH=N'Cơ sở dữ liệu')
				
--8.2 Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
SELECT * FROM DMSV
WHERE MASV NOT IN (SELECT MASV 
					FROM KETQUA
					WHERE LANTHI = 1)
	AND MASV IN (SELECT MASV 
					FROM KETQUA
					WHERE LANTHI = 2)


--8.3. Cho biết môn nào không có sinh viên khoa anh văn học
SELECT * FROM DMSV
WHERE MASV NOT IN (SELECT MASV
					FROM DMSV, DMKHOA
					WHERE DMSV.MAKH = DMKHOA.MAKHOA
					AND TENKHOA = N'Anh Văn')


--8.4. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm
SELECT *
FROM DMSV, DMKHOA
WHERE DMSV.MAKH = DMKHOA.MAKHOA
AND TENKHOA = N'Anh Văn'
AND MASV NOT IN (SELECT DMSV.MASV
					FROM DMSV, DMMH, KETQUA
					WHERE KETQUA.MASV = DMSV.MASV
					AND DMMH.MAMH = KETQUA.MAMH
					AND TENMH = N'Văn phạm')
					
--8.5Cho biết những môn không có sinh viên rớt ở lần 1. 
SELECT * FROM DMSV
WHERE MAMH NOT IN(SELECT MAMH
					FROM KETQUA
					WHERE DIEM<5 AND LANTHI=1)
		
--8.6. Cho biết những khoa không có sinh viên nữ.
SELECT *
FROM DMKHOA
WHERE MAKHOA NOT IN (SELECT MAKH 
					FROM DMSV, DMKHOA
					WHERE DMSV.MAKH =DMKHOA.MAKHOA
					AND PHAI = 1)

			
--8.7. Cho biết những sinh viên: - Học khoa anh văn có học bổng hoặc - Chưa bao giờ rớt.
SELECT MASV, HOSV, TENSV, PHAI,NGAYSINH,NOISINH,MAKH,HOCBONG
FROM DMSV, DMKHOA
WHERE DMSV.MAKH= DMKHOA.MAKHOA
AND TENKHOA=N'Anh Văn' AND HOCBONG>0
UNION
(SELECT MASV, HOSV, TENSV, PHAI,NGAYSINH,NOISINH,MAKH,HOCBONG
FROM DMSV
WHERE MASV NOT IN(SELECT MASV
				FROM KETQUA
				WHERE DIEM<5))
--	8.8. Cho biết những sinh viên:
--    - Không có học bổng hoặc
--    - Bị rớt môn học (sinh viên thi lần 1 bị rớt mà không thi lần 2 và sinh viên thi lần 2 bị ROT)
SELECT MASV, HOSV, TENSV, PHAI,NGAYSINH,NOISINH,MAKH,HOCBONG
FROM DMSV
WHERE HOCBONG = 0
UNION
(SELECT MASV, HOSV, TENSV, PHAI,NGAYSINH,NOISINH,MAKH,HOCBONG
FROM DMSV
WHERE MASV IN (SELECT MASV
				FROM KETQUA
				WHERE DIEM<5))


--9.1Cho biết những môn được tất cả các sinh viên theo học. (những môn học mà không có sinh viên nào không không học)


----CHO BIET MOM NAO DUOC TAT CA CAC SIHNH VIEN THEO HOC : KETQUAW : SV
----CHO BIET MON HOC NAO KHONG CO SINH VIEN KHONG HOC: KETQUA-(SIHVIEN-KETQUA)

SELECT *
FROM KETQUA K1
WHERE NOT EXISTS(SELECT *
				FROM DMSV
				WHERE NOT EXISTS(SELECT *
								FROM KETQUA K2
								WHERE K2.MASV=DMSV.MASV
								AND K2.MAMH=K1.MAMH))
								
SELECT * FROM DMSV
SELECT * FROM KETQUA
ORDER BY MAMH

--9.2 Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
-------*** KHONG HOC NHUNG MON MA A02 KHONG HOC
SELECT *
FROM KETQUA R1
WHERE NOT EXISTS (SELECT *
					FROM KETQUA S
					WHERE MASV = 'A02'
					AND NOT EXISTS (SELECT * 
										FROM KETQUA R2
										WHERE R2.MAMH = S.MAMH
										AND R2.MASV = R1.MASV))
										
--
--10.1.Với mỗi môn học cho biết bao nhiêu sinh viên đã học môn đó
select DMMH.MAMH,TENMH,COUNT(DISTINCT MASV) as SOSV
from DMMH left join KETQUA on DMMH.MAMH = KETQUA.MAMH
group by DMMH.MAMH,TENMH
--10.2.Với mỗi khoa cho biết có bao nhiêu sinh viên
select DMKHOA.MAKHOA, COUNT(Distinct MASV) as SOSV
from DMKHOA left join DMSV on DMKHOA.MAKHOA = DMSV.MAKH
group by DMKHOA.MAKHOA
--10.3..Với mỗi sinh viên cho biết đã học bao nhiêu môn.

select KETQUA.MASV,COUNT(DISTINCT KETQUA.MAMH) as MONHOC
from DMMH left join KETQUA on DMMH.MAMH = KETQUA.MAMH 
group by KETQUA.MASV

--11.1..Tạo một bảng mới tên SinhVien_KetQua: gồm: MASV, HoSV, TenSV, SoMonHoc.
--Sau đó Thêm dữ liệu vào bảng này dựa vào dữ liệu đã có.
Create table sinhvien_ketqua
(
	MASV Char (3),
	HOSV NVARCHAR (20),
	TENSV NVARCHAR(20),
	SOMONHOC SMALLINT,
)
insert into sinhvien_ketqua
select DMSV.MASV,HOSV,TENSV,COUNT(DISTINCT MAMH)
from DMSV,KETQUA
WHERE DMSV.MASV = KETQUA.MASV
GROUP BY DMSV.MASV,HOSV,TENSV
select * from sinhvien_ketqua
--11.2.Thêm vào bảng khoa cột Siso, lần lượt cập nhật sỉ số vào khoa từ dữ liệu sinh viên
alter table DMKHOA add SISO int
select * from DMKHOA
UPDATE DMKHOA
SET SISO = (select COUNT(*)
			from DMSV
			WHERE MAKHOA = 'AV')
where MAKHOA = 'AV'
UPDATE DMKHOA
SET SISO = (select COUNT(*)
			from DMSV
			WHERE MAKHOA = 'TH')
where MAKHOA = 'TH'
UPDATE DMKHOA
SET SISO = (select COUNT(*)
			from DMSV
			WHERE MAKHOA = 'TR')
where MAKHOA = 'TR'
UPDATE DMKHOA
SET SISO = (select COUNT(*)
			from DMSV
			WHERE MAKHOA = 'VL')
where MAKHOA = 'VL'
--11.3..Thiết lập học bổng bằng 0 cho những sinh viên thi hai môn rớt ở lần 1
update DMSV
set HOCBONG = 0
from KETQUA
where LANTHI = 1 and DIEM <5
--11.4 Tăng thêm 1 điểm cho các sinh viên rớt lần 2. Nhưng chỉ tăng tối đa là 5 điểm
select * from DMMH
select * from DMSV
select * from DMKHOA
select * from KETQUA
alter table KETQUA add DIEMMOI smallint
alter table KETQUA drop column DIEMMOI 


