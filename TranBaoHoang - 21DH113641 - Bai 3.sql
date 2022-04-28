use master
go
if exists( select * from sysdatabases where name = 'TranBaoHoang')
drop database TranBaoHoang
create database TranBaoHoang
use TranBaoHoang

create table CHUYENBAY
( MaCB char (5),
GaDi char (3),
GaDen char (3),
Dodai int,
Giodi time,
Gioden time,
ChiPhi int
constraint pk_CHUYENBAY primary key (MaCB))

create table MAYBAY
( MaMB char (3) 
constraint pk_MAYBAY primary key (MaMB),
Loai char (25),
TamBay int)

create table NHANVIEN
( MaNV char (9) constraint pk_NHANVIEN primary key (MaNV),
Ten char (35),
Luong int)

create table CHUNGNHAN
( MaNV char (9),
MaMB char (3)
constraint pk_CHUNGNHAN primary key (MaNV, MaMB))


insert into CHUYENBAY (MaCB, GaDi, GaDen, DoDai, GioDi, GioDen, ChiPhi)
values ('VN431', 'SGN', 'CAH',3693, '05:55','06:55',236),
('VN320', 'SGN','DAD',2798,'06:00','07:10',221),
('VN464', 'SGN','DLI',2002, '07:20','08:05', 225),
('VN216', 'SGN','DIN',4170, '10:30','14:20',464),
('VN280','SGN', 'HPH', 11979,'06:00','08:00',1279),
('VN254','SGN','HUI', 8765, '18:40', '20:00',781),
('VN338','SGN', 'BMV' ,4081, '15:25','16:25',375),
('VN440','SGN','BMV', 4081,'18:30','19:30',426),
('VN651', 'DAD','SGN', 2798, '19:30','08:00',221),
('VN276', 'DAD', 'CXR',1283,'09:00','12:00',203),
('VN374', 'HAN', 'VII',510,'11:40','13:25',120),
('VN375','VII', 'CXR', 752,'14:15','16:00',181),
('VN269','HAN','CXR', 1262,'14:10','15:50',202),
('VN315','HAN','DAD',134,'11:45','13:00',112),
('VN317','HAN','UIH',827,'15:00','16:15',190),
('VN741','HAN','PXU',395, '06:30','08:30',120),
('VN474', 'PXU','PQC',1586,'08:40','11:20',102)

insert into MAYBAY (MaMB, Loai, TamBay)
values ('747','Boeing 747 - 400',13488),
('737','Boeing 737 - 800',5413),
('340', 'Airbus A340 - 300',11392),
('757', 'Boeing 757 - 300', 6416),
('777', 'Boeing 777 - 300' , 10306),
('767', ' Boeing 767 - 400ER',10360),
('320', 'Airbus A320', 4168),
('319', 'Airbus A319', 2888),
('727', 'Boeing 727',2406),
('154','Tupolev 154',6565)
insert into NHANVIEN (MaNV, Ten, Luong)
values ('242518965','Tran Van Son',120433),
('141582651','Doan Thi Mai',178345),
('011564812','Ton Van Quy',153972),
('567354612','Quan Cam Ly',256481),
('552455318','La Que', 101745),
('550156548','Nguyen Thi Cam',205187),
('390487451','Le Van Luat',212156),
('274878974','Mai Quoc Minh',99890),
('254099823','Nguyen Thi Quynh',24450),
('356187925','Nguyen Vinh Bao',44740),
('355548784', 'Tran Thi Hoai An', 212156),
('310454876', 'Ta Van Do' , 212156),
('489456522', 'Nguyen Thi Quy Linh', 127984),
('489221823', 'Bui Quoc Chinh',23980),
('548977562','Le Van Quy', 84476),
('310454877', 'Tran Van Hao', 33546),
('142519864', 'Nguyen Thi Xuan Dao',227489),
('287321212', 'Duong Van Minh',48090),
('552455348', 'Bui Thi Dung', 92013),
('248965255', ' Tran Thi Ba', 43723),
('159542516', 'Le Van Ky', 48250),
('348121549', 'Nguyen Van Thanh', 32899),
('574489457', 'Bui Van Lap', 20)
insert into CHUNGNHAN (MaNV,MaMB)
values ('567354612','747'),
('567354612','737'),
('567354612', '757'),
('567354612', '777'),
('567354612', '767'),
('567354612', '727'),
('567354612', '340'),
('552455318', '737'),
('552455318', '319'),
('552455318', '747'),
('552455318', '767'),
('390487451', '340'),
('390487451', '320'),
('390487451', '319'),
('274878974', '757'),
('274878974', '767'),
('355548984', '154'),
('310454876','154'),
('142519864', '747'),
('142519864', '757'),
('142519864', '777'),
('142519864', '767'),
('142519864', '737'),
('142519864', '340'),
('142519864', '320'),
('269734834', '747'),
('269734834', '737'),
('269734834', '340'),
('269734834', '757'),
('269734834', '777'),
('269734834', '767'),
('269734834', '320'),
('269734834', '319'),
('269734834', '727'),
('269734834', '154'),
('242518965', '737'),
('242518965', '757'),
('141582651', '737'),
('141582651', '757'),
('141582651', '767'),
('011564812', '737'),
('011564812', '757'),
('574489457', '154')
--cau1--
select * from CHUYENBAY
where GaDi = 'SGN' and GaDen = 'BMV'

--cau2--
select COUNT (MaCB) as sochuyenbai_tuSaiGon
from CHUYENBAY
where GaDi = 'SGN'

--cau3--
select Sum (Luong) as tongsoluong_phaitra
from NHANVIEN

--cau4--
select NHANVIEN.MaNV, Ten, Luong
from CHUNGNHAN,NHANVIEN
where NHANVIEN.MaNV = CHUNGNHAN.MaNV and MaMB = '747'

--cau5--
select *
from CHUYENBAY
where Dodai <= (select TamBay from MAYBAY where Loai= 'Airbus A320')  

--cau6--
select NHANVIEN.MaNV, Ten, Luong
from CHUNGNHAN,NHANVIEN
where NHANVIEN.MaNV = CHUNGNHAN.MaNV and MaMB = any (select MaMB from MAYBAY where Loai like '%Boeing%')  and MaMB = any (select MaMB from MAYBAY where Loai like '%Airbus%') 
group by NHANVIEN.MaNV, Ten, Luong		
--cau7--
select *
from MAYBAY
where TamBay >= (select Dodai from CHUYENBAY where MaCB = 'VN280')

--cau8--
select MAYBAY.MaMB,Loai, COUNT (distinct MaNV) as luongphicong
from MAYBAY, CHUNGNHAN
where MAYBAY.MaMB = CHUNGNHAN.MaMB
group by MAYBAY.MaMB,Loai

--cau9--

--cau10--
select GaDi, count (MaCB) as luongchuyenbay
from CHUYENBAY
where Giodi > '12:00'
group by GaDi

--cau11--
select Ten, count (distinct MaMB) as luongmaybaylai
from NHANVIEN,CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV 
group by Ten
having count (distinct MaMB) >=3

--cau12--
select Ten, count (distinct Chungnhan.MaMB) as luongmaybaylai, Max(TamBay) as maxtambay
from NHANVIEN,CHUNGNHAN, MAYBAY
where NHANVIEN.MaNV=CHUNGNHAN.MaNV and MAYBAY.MaMB = CHUNGNHAN.MaMB
group by Ten
having count (distinct chungnhan.MaMB) >=3

--cau13--
select Ten, count (distinct MaMB) as luongmaybaylai
from NHANVIEN,CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV 
group by Ten
having count (distinct MaMB) >= all (select count (distinct MaMB) a
from NHANVIEN,CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV
group by Ten)

--cau14--
select Ten, count (distinct MaMB) as luongmaybaylai
from NHANVIEN,CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV 
group by Ten
having count (distinct MaMB) <= all (select count (distinct MaMB) a
from NHANVIEN,CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV
group by Ten)

--cau15--
select Ten
from NHANVIEN
where MaNV not in (select MaNV from CHUNGNHAN)


--cau16--
select top 1 Luong,Ten
from NHANVIEN
where MaNV in (select MaNV from CHUNGNHAN)
order by Luong DESC

--cau17--
select top 2 Luong,Ten
from NHANVIEN
where MaNV not in (select MaNV from CHUNGNHAN)
order by Luong DESC

--cau18--
select SUM(luong) as tongphicong
from NHANVIEN
where MaNV in (select MaNV from CHUNGNHAN)

--cau19--
select *
from CHUYENBAY
where Dodai <= (select min (TamBay) from MAYBAY where Loai like '%Boeing%')

--cau20--
select *
from MAYBAY
where TamBay >= (select Dodai from CHUYENBAY where GaDi like 'SGN' and GaDen like 'HUI')

--cau21--
select * 
from CHUYENBAY
where Dodai <= any (select distinct tambay from maybay,NHANVIEN,CHUNGNHAN where MAYBAY.MaMB=CHUNGNHAN.MaMB and NHANVIEN.MaNV=CHUNGNHAN.MaNV and Luong >100000 and NHANVIEN.MaNV in (select MaNV from CHUNGNHAN))

--cau22--
select *
from NHANVIEN
where MaNV in (select MaNV from CHUNGNHAN) and Luong < (select min(chiphi) from CHUYENBAY where GaDi like 'SGN' and GaDen like 'BMV')

--cau23--
select top 2 Luong,Ten
from NHANVIEN

--cau24--
select *
from NHANVIEN
where Luong >= (select avg(luong) from NHANVIEN) and MaNV not in (select MaNV from CHUNGNHAN)

--cau25--
select NHANVIEN.MaNV,Ten,Luong
from NHANVIEN,MAYBAY,CHUNGNHAN
where NHANVIEN.MaNV = CHUNGNHAN.MaNV and MAYBAY.MaMB =CHUNGNHAN.MaMB and NHANVIEN.MaNV in (select MaNV from CHUNGNHAN) 
and TamBay > 4800 and CHUNGNHAN.MaMB not in (select MaMB from MAYBAY where Loai like '%Boeing%')

--cau26--
select Ten, count (distinct Chungnhan.MaMB) as luongmaybaylai
from NHANVIEN,CHUNGNHAN, MAYBAY
where NHANVIEN.MaNV=CHUNGNHAN.MaNV and MAYBAY.MaMB = CHUNGNHAN.MaMB and TamBay >3200
group by Ten
having count (distinct chungnhan.MaMB) >=3

--cau27--
select Ten,NHANVIEN.MaNV, count (MaMB) as luongmaybay
from NHANVIEN, CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV and NHANVIEN.MaNV in (select MaNV from CHUNGNHAN)
group by Ten,NHANVIEN.MaNV

--cau28--
select Ten,NHANVIEN.MaNV, count (distinct MaMB) as luongmaybayboeing
from NHANVIEN, CHUNGNHAN
where NHANVIEN.MaNV=CHUNGNHAN.MaNV and NHANVIEN.MaNV in (select MaNV from CHUNGNHAN) and MaMB in (select MaMB from MAYBAY where Loai like '%Boeing%')
group by Ten,NHANVIEN.MaNV

--cau29--
select MAYBAY.MaMB,Loai, COUNT (distinct MaNV) as songuoilai
from MAYBAY,CHUNGNHAN
Where MAYBAY.MaMB= CHUNGNHAN.MaMB
group by  MAYBAY.MaMB,Loai

--cau30--
select Loai,Count (Dodai) as sochuyenbaykhongthuchien
from MAYBAY,CHUYENBAY
where Dodai > TamBay
group by Loai

--cau31--
select Loai,AVG (luong) as luongtrungbinh
from MAYBAY,NHANVIEN,CHUNGNHAN
where MAYBAY.MaMB = CHUNGNHAN.MaMB and NHANVIEN.MaNV = CHUNGNHAN.MaNV and TamBay > 3200
group by Loai

--cau32--
select Loai,(select count (distinct MaNV)
from CHUNGNHAN ) - Count ( distinct MaNV) as soluongkhonglai
from CHUNGNHAN,MAYBAY
where CHUNGNHAN.MaMB=MAYBAY.MaMB 
group by Loai

--cau33--
select NHANVIEN.MaNV,Ten,count(Dodai)as sochuyenbay
from NHANVIEN,CHUNGNHAN,CHUYENBAY,MAYBAY
where NHANVIEN.MaNV = CHUNGNHAN.MaNV and Dodai <= TamBay and
MAYBAY.MaMB =CHUNGNHAN.MaMB and GaDen = 'SGN'
group by NHANVIEN.MaNV,Ten

--cau34--
select NHANVIEN.MaNV,Ten,count(Dodai)as sochuyenbay
from NHANVIEN,CHUNGNHAN,CHUYENBAY,MAYBAY
where NHANVIEN.MaNV = CHUNGNHAN.MaNV and Dodai <= TamBay and 
MAYBAY.MaMB =CHUNGNHAN.MaMB and GaDen = 'SGN'
group by NHANVIEN.MaNV,Ten

--cau35--
select MaCB, COUNT (Tambay) as somaybay
from CHUYENBAY,MAYBAY
where TamBay >= Dodai
group by MaCB

--cau36--
select MaCB, COUNT (Tambay) as somaybay
from CHUYENBAY,MAYBAY
where TamBay < Dodai
group by MaCB

--cau37--
select distinct Loai
from MAYBAY,CHUNGNHAN
where CHUNGNHAN.MaMB = MAYBAY.MaMB and MaNV in (select MaNV from NHANVIEN where Luong >200000)

--cau38--
select NHANVIEN.MaNV, Ten, Luong
from CHUNGNHAN,NHANVIEN
where MaMB = all (select MaMB from MAYBAY) and NHANVIEN.MaNV = CHUNGNHAN.MaNV

--cau39--
select NHANVIEN.MaNV, Ten, Luong
from CHUNGNHAN,NHANVIEN
where MaMB = all (select MaMB from MAYBAY where Loai like '%Boeing%') and NHANVIEN.MaNV = CHUNGNHAN.MaNV

--cau40--
select distinct MaCB
from CHUYENBAY,CHUNGNHAN
where MaNV in (select MaNV from NHANVIEN where Luong >100000) and MaNV in (select MaNV from NHANVIEN)
