use master
go
if exists(select * from sysdatabases where name = 'TranBaoHoang')
	drop database TranBaoHoang
create DATABASE TranBaoHoang
go
USE TranBaoHoang


-- BANG CHUYEN BAY
CREATE TABLE CHUYENBAY
(
    MACB CHAR (5),
    GADI CHAR (3),
    GADEN CHAR (3),
    DODAI INT ,
    GIODI TIME (0) NOT NULL,
    GIODEN TIME (0) NOT NULL,
    CHIPHI INT,
    CONSTRAINT PK_CHUYENBAY PRIMARY KEY(MACB),
)

--BANG MAY BAY
CREATE TABLE MAYBAY
(
    MAMB CHAR(3),
    LOAI CHAR(20),
    TAMBAY INT,
    CONSTRAINT PK_MAYBAY PRIMARY KEY (MAMB)
)

--BANG NHAN VIEN
CREATE TABLE NHANVIEN
(
    MANV CHAR(9),
    TEN CHAR(30),
    LUONG INT,
    CONSTRAINT PK_NHANVIEN PRIMARY KEY(MANV)
)

--BANG CHUNG NHAN
CREATE TABLE CHUNGNHAN
(
    MANV CHAR(9),
    MAMB CHAR(3)
    CONSTRAINT PK_CHUNGNHAN PRIMARY KEY(MANV, MAMB)
)

--NHAP BANG CHUYEN BAY
INSERT INTO CHUYENBAY(MACB,GADI,GADEN,DODAI,GIODI,GIODEN,CHIPHI)
    VALUES ('VN431','SGN','CAH',3693,'05:55:00','06:55:00',236),
        ('VN320','SGN','DAD',2798,'06:00:00','07:10:00',221),
        ('VN464','SGN','DLI',2002,'07:20:00','08:05:00',225),
        ('VN216','SGN','DIN',4170,'10:30:00','14:20:00',262),
        ('VN280','SGN','HPH',11979,'06:00:00','08:00:00',1279),
        ('VN254','SGN','HUI',8765,'18:40:00','20:00:00',781),
        ('VN338','SGN','BMV',4081,'15:25:00','16:25:00',375),
        ('VN440','SGN','BMV',4081,'18:30:00','19:30:00',426),
        ('VN651','DAD','SGN',2798,'19:30:00','08:00:00',221),
        ('VN276','DAD','CXR',1283,'09:00:00','12:00:00',203),
        ('VN374','HAN','VII',510,'11:40:00','13:25:00',120),
        ('VN375','VII','CXR',752,'14:15:00','16:00:00',181),
        ('VN269','HAN','CXR',1262,'14:10:00','15:50:00',202),
        ('VN315','HAN','DAD',134,'11:45:00','13:00:00',112),
        ('VN317','HAN','UIH',827,'15:00:00','16:15:00',190),
        ('VN741','HAN','PXU',395,'06:30:00','08:30:00',120),
        ('VN474','PXU','PQC',1586,'08:40:00','11:20:00',102)

--NHAP BANG MAY BAY
INSERT INTO MAYBAY(MAMB, LOAI, TAMBAY)
        VALUES ('747','Boeing 747 - 400',13488),
            ('737','Boeing 737 - 800',5413),
            ('340','Airbus A340 - 300',11392),
            ('757','Boeing 757 - 300',6416),
            ('777','Boeing 777 - 300',10306),
            ('767','Boeing 767 - 400ER',10360),
            ('320','Airbus A320',4168),
            ('319','Airbus A319',2888),
            ('727','Boeing 727',2406),
            ('154','Tupolev 154',6565)

--NHAP BANG NHAN VIEN
INSERT INTO NHANVIEN(MANV, TEN, LUONG)
    VALUES ('242518965','Tran Van Son',120433),
        ('141582651','Doan Thi Mai',178345),
        ('011564812','Ton Van Quy',153972),
        ('567354612','Quan Cam Ly',256481),
        ('552455318','La Que',101745),
        ('550156548','Nguyen Thi Cam',205187),
        ('390487451','Le Van Luat',212156),
        ('274878974','Mai Quoc Minh',99890),
        ('254099823','Nguyen Thi Quynh',24450),
        ('356187925','Nguyen Vinh Bao',44740),
        ('355548984','Tran Thi Hoai An',212156),
        ('310454876','Ta Van Do',212156),
        ('489456522','Nguyen Thi Quy Linh',127984),
        ('489221823','Bui Qu???c Chinh',23980),
        ('548977562','Le Van Quy',84476),
        ('310454877','Tran Van Hao',33546),
        ('142519864','Nguyen Thi Xuan Dao',227489),
        ('287321212','Duong Van Minh',48090),
        ('552455348','Bui Thi Dung',92013),
        ('248965255','Tran Thi Ba',43723),
        ('159542516','Le Van Ky',48250),
        ('348121549','Nguyen Van Thanh',32899),
        ('574489457','Bui Van Lap',20),
        ('269734834','Le Minh Thanh',450347)

--NHAP BANG CHUNG NHAN
INSERT INTO CHUNGNHAN(MANV, MAMB)
    VALUES ('567354612','747'),
        ('567354612','737'),
        ('567354612','757'),
        ('567354612','777'),
        ('567354612','767'),
        ('567354612','727'),
        ('567354612','340'),
        ('552455318','737'),
        ('552455318','319'),
        ('552455318','747'),
        ('552455318','767'),
        ('390487451','340'),
        ('390487451','320'),
        ('390487451','319'),
        ('274878974','757'),
        ('274878974','767'),
        ('355548984','154'),
        ('310454876','154'),
        ('142519864','747'),
        ('142519864','757'),
        ('142519864','777'),
        ('142519864','767'),
        ('142519864','737'),
        ('142519864','340'),
        ('142519864','320'),
        ('269734834','747'),
        ('269734834','737'),
        ('269734834','340'),
        ('269734834','757'),
        ('269734834','777'),
        ('269734834','767'),
        ('269734834','320'),
        ('269734834','319'),
        ('269734834','727'),
        ('269734834','154'),
        ('242518965','737'),
        ('242518965','757'),
        ('141582651','737'),
        ('141582651','757'),
        ('141582651','767'),
        ('011564812','737'),
        ('011564812','757'),
        ('574489457','154')

--LIEN KET KHOA CHINH PHU

ALTER TABLE CHUNGNHAN ADD CONSTRAINT FK_CHUNGNHAN_NHANVIEN FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE CHUNGNHAN ADD CONSTRAINT FK_CHUNGNHAN_MAYBAY FOREIGN KEY(MAMB) REFERENCES MAYBAY(MAMB)

--------BAI TAP
--1. Cho bi???t c??c chuy???n bay xu???t ph??t t??? S??i G??n (SGN) ??i Bu??n M?? Thu???c (BMV)
SELECT *
FROM CHUYENBAY
WHERE GADI LIKE 'SGN' 
    AND GADEN LIKE 'BMV'

--2. C?? bao nhi??u chuy???n bay xu???t ph??t t??? S??i G??n (SGN).
SELECT COUNT(GADI) AS SoChuyenBaySG
FROM CHUYENBAY
WHERE GADI LIKE 'SGN' 

--3. Cho bi???t t???ng s??? l????ng ph???i tr??? cho c??c nh??n vi??n.
SELECT SUM(LUONG) AS TongLuong
FROM NHANVIEN

--4. Cho bi???t c??c nh??n vi??n c?? th??? l??i m??y bay c?? m?? 747.
SELECT CHUNGNHAN.MANV, TEN
FROM CHUNGNHAN, NHANVIEN
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
    AND MAMB = '747'

--5. Cho bi???t c??c chuy???n bay c?? th??? th???c hi???n b???i m??y bay Airbus A320.
SELECT *
FROM CHUYENBAY
WHERE DODAI < ANY(SELECT TAMBAY
                    FROM MAYBAY
                    WHERE LOAI = 'Airbus A320')

--6. Cho bi???t c??c phi c??ng v???a l??i ???????c m??y bay Boeing v???a l??i ???????c Airbus.
SELECT *
FROM NHANVIEN
WHERE MANV = ANY (SELECT MANV
                    FROM CHUNGNHAN
                    WHERE MAMB = ANY (SELECT MAMB
                                        FROM MAYBAY
                                        WHERE LOAI LIKE 'Boeing%')
                INTERSECT(SELECT MANV
                    FROM CHUNGNHAN
                    WHERE MAMB = ANY (SELECT MAMB
                                        FROM MAYBAY
                                        WHERE LOAI LIKE 'Airbus%'))
                )

--7. Cho bi???t c??c lo???i m??y bay c?? th??? th???c hi???n chuy???n bay VN280.
SELECT LOAI
    FROM MAYBAY
    WHERE TAMBAY > ANY (SELECT DODAI
                            FROM CHUYENBAY
                            WHERE MACB = 'VN280')

--8. V???i m???i lo???i m??y bay c?? phi c??ng l??i cho bi???t m?? s???, 
------lo???i m??y bay v?? t???ng s??? phi c??ng c?? th??? l??i m??y bay ????.
SELECT CHUNGNHAN.MAMB, LOAI, COUNT(MANV) AS SOPC
FROM CHUNGNHAN, MAYBAY
WHERE CHUNGNHAN.MAMB = MAYBAY.MAMB
GROUP BY CHUNGNHAN.MAMB, LOAI

--9. Gi??? s??? m???t h??nh kh??ch mu???n ??i th???ng t??? ga A ????? nga B r???i quay v??? ga A.
------Cho bi???t c??c ???????ng bay n??o c?? th??? ????p ???ng y??u c???u n??y.
SELECT *
FROM CHUYENBAY CBAB, CHUYENBAY CBBA
WHERE CBAB.GADI = CBBA.GADEN
    AND CBAB.GADEN = CBBA.GADI

--10. V???i m???i ?????a ??i???m xu???t ph??t cho bi???t bao nhi??u chuy???n bay kh???i h??nh tr?????c 12 :00.
SELECT GADI, COUNT(GIODI)
FROM CHUYENBAY
WHERE GIODI < '12:00:00'
GROUP BY GADI

--11. Cho bi???t nh???ng phi c??ng l??i ???????c 3 l???i m??y bay.
SELECT CHUNGNHAN.MANV, TEN, COUNT(MAMB)
FROM CHUNGNHAN, NHANVIEN
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
GROUP BY CHUNGNHAN.MANV, TEN
HAVING COUNT(MAMB) = 3

--12. V???i m???i phi c??ng c?? th??? l??i nhi???u h??n 3 lo???i m??y bay, 
------cho bi???t m?? phi c??ng v?? t???m bay l???n nh???t c???a c??c lo???i m??y bay m?? phi c??ng ???? c?? th??? l??i.
SELECT CHUNGNHAN.MANV, TEN, MAX(TAMBAY) AS TAMBAYMAX , COUNT(CHUNGNHAN.MAMB) AS SOMB
FROM CHUNGNHAN, NHANVIEN, MAYBAY
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
    AND MAYBAY.MAMB = CHUNGNHAN.MAMB
GROUP BY CHUNGNHAN.MANV, TEN
HAVING COUNT(CHUNGNHAN.MAMB) >= 3

--13. Cho bi???t nh???ng phi c??ng c?? th??? l??i nhi???u lo???i m??y bay nh???t.
SELECT CHUNGNHAN.MANV, TEN, COUNT(MAMB) AS SOMB
FROM CHUNGNHAN, NHANVIEN
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
GROUP BY CHUNGNHAN.MANV, TEN
HAVING COUNT(MAMB) >= ALL (SELECT COUNT(MAMB)
                            FROM CHUNGNHAN
                            GROUP BY MANV)

--14. Cho bi???t nh???ng phi c??ng c?? th??? l??i ??t lo???i m??y bay nh???t.
SELECT CHUNGNHAN.MANV, TEN, COUNT(MAMB) AS SOMB
FROM CHUNGNHAN, NHANVIEN
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
GROUP BY CHUNGNHAN.MANV, TEN
HAVING COUNT(MAMB) <= ALL (SELECT COUNT(MAMB)
                            FROM CHUNGNHAN
                            GROUP BY MANV)

--15. Cho bi???t nh???ng nh??n vi??n kh??ng ph???i l?? phi c??ng.
SELECT *
FROM NHANVIEN
WHERE MANV NOT IN (SELECT DISTINCT MANV
                    FROM CHUNGNHAN)

--16. Cho bi???t nh???ng phi c??ng c?? l????ng cao nh???t.
SELECT *
FROM NHANVIEN 
WHERE MANV IN (SELECT DISTINCT MANV
                FROM CHUNGNHAN)
    AND LUONG  = (SELECT MAX(LUONG)
                        FROM NHANVIEN)

--17. Cho bi???t nh???ng ti???p vi??n c?? l????ng cao nh??.
SELECT *
FROM NHANVIEN
WHERE LUONG = (SELECT TOP 1 LUONG
                FROM NHANVIEN
                WHERE MANV NOT IN (SELECT DISTINCT MANV
                                    FROM CHUNGNHAN)
                    AND LUONG < (SELECT TOP 1 LUONG
                                    FROM NHANVIEN
                                    WHERE MANV NOT IN (SELECT DISTINCT MANV
                                                        FROM CHUNGNHAN)
                                    ORDER BY LUONG DESC)
                ORDER BY LUONG DESC)

--18. Cho bi???t t???ng s??? l????ng ph???i tr??? cho c??c phi c??ng.
SELECT SUM(LUONG) AS TONGLUONGPC
FROM NHANVIEN 
WHERE MANV IN (SELECT DISTINCT MANV
                FROM CHUNGNHAN)

--19. T??m c??c chuy???n bay c?? th??? th???c hi???n b???i c??c lo???i m??y bay Boeing.
SELECT *
FROM CHUYENBAY
WHERE DODAI < (SELECT MAX(TAMBAY)
                FROM MAYBAY
                WHERE LOAI LIKE 'Boeing%')

--20.Cho bi???t c??c m??y bay c?? th??? ???????c s??? d???ng ????? th???c hi???n 
-----chuy???n bay t??? S??i G??n (GSN) ?????n Hu??? (HUI)
SELECT *
FROM MAYBAY
WHERE TAMBAY > (SELECT DODAI
                FROM CHUYENBAY
                WHERE GADI LIKE 'SGN' 
                    AND GADEN LIKE 'HUI')

--21. T??m c??c chuy???n bay c?? th??? l??i b???i c??c phi c??ng c?? l????ng l???n h??n 100,000.
SELECT *
FROM CHUYENBAY
WHERE DODAI < (SELECT MAX(TAMBAY)
                FROM CHUNGNHAN, MAYBAY
                WHERE CHUNGNHAN.MAMB = MAYBAY.MAMB
                    AND MANV IN (SELECT MANV
                                    FROM NHANVIEN
                                    WHERE LUONG > 100000
                                        AND MANV IN (SELECT DISTINCT MANV
                                                        FROM CHUNGNHAN)))

--22.Cho bi???t c??c phi c??ng c?? l????ng nh??? h??n chi ph?? th???p nh???t c???a 
------???????ng bay t??? S??i G??n (SGN) ?????n Bu??n M?? Thu???c (BMV).
SELECT *
FROM NHANVIEN
WHERE LUONG <= (SELECT MIN(CHIPHI)
                FROM CHUYENBAY
                WHERE GADI LIKE 'SGN'
                    AND GADEN LIKE 'BMV')

--23. Cho bi???t nh???ng nh??n vi??n c?? l????ng cao th??? nh???t ho???c th??? nh??.
SELECT TOP 2 LUONG, MANV, TEN
FROM NHANVIEN
ORDER BY LUONG DESC

--24. Cho bi???t t??n v?? l????ng c???a c???a c??c nh??n vi??n kh??ng ph???i 
------l?? phi c??ng c?? l????ng l???n h??n trung b??nh c???a t???t c??? c??c phi c??ng.
SELECT *
FROM NHANVIEN
WHERE MANV NOT IN (SELECT DISTINCT MANV
                    FROM CHUNGNHAN)
    AND LUONG >= (SELECT AVG(LUONG)
                    FROM NHANVIEN
                    WHERE MANV IN (SELECT DISTINCT MANV
                                    FROM CHUNGNHAN))

--25. Cho bi???t t??n c??c phi c??ng c?? th??? l??i m??y bay c?? 
-----t???m bay l???n h??n 4800km nh??ng kh??ng c?? ch???ng nh???n m??y bay Boeing.
SELECT MANV, TEN
FROM NHANVIEN
WHERE MANV = ANY (SELECT MANV
                    FROM CHUNGNHAN
                    WHERE MAMB = (SELECT MAMB
                                    FROM MAYBAY
                                    WHERE TAMBAY >= 4800
                                        AND LOAI NOT LIKE 'Boeing%'))

--26. Cho bi???t nh???ng phi c??ng l??i ??t nh???t 3 lo???i m??y bay c?? t???m bay xa h??n 3200km.
SELECT CHUNGNHAN.MANV, TEN, COUNT(MAMB)
FROM CHUNGNHAN, NHANVIEN
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
    AND MAMB = ANY (SELECT MAMB
                    FROM MAYBAY
                    WHERE TAMBAY >= 3200)
GROUP BY CHUNGNHAN.MANV, TEN
HAVING COUNT(MAMB) >= 3

--27. V???i m???i phi c??ng cho bi???t m?? s???, t??n nh??n vi??n v?? t???ng s??? lo???i m??y bay 
----------m?? phi c??ng ???? c?? th??? l??i.
SELECT CHUNGNHAN.MANV, TEN, COUNT(MAMB)
FROM CHUNGNHAN, NHANVIEN
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
GROUP BY CHUNGNHAN.MANV, TEN

--28. V???i m???i phi c??ng cho bi???t m?? s???, 
-----t??n v?? t???ng s??? lo???i m??y bay Boeing m?? phi c??ng ???? c?? th??? l??i.
SELECT CHUNGNHAN.MANV,TEN, COUNT(MAMB)
FROM CHUNGNHAN, NHANVIEN
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
    AND MAMB = ANY (SELECT MAMB
                    FROM MAYBAY
                    WHERE LOAI LIKE 'Boeing%')
GROUP BY CHUNGNHAN.MANV, TEN
UNION (SELECT CHUNGNHAN.MANV, TEN, SUM(0)
        FROM CHUNGNHAN, NHANVIEN
        WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
            AND CHUNGNHAN.MANV NOT IN (SELECT MANV
                                FROM CHUNGNHAN
                                WHERE MAMB = ANY (SELECT MAMB
                                                    FROM MAYBAY
                                                    WHERE LOAI LIKE 'Boeing%'))
        GROUP BY CHUNGNHAN.MANV, TEN)

--29. V???i m???i lo???i m??y bay cho bi???t lo???i m??y bay v?? 
--------t???ng s??? phi c??ng c?? th??? l??i lo???i m??y bay ????.
SELECT CHUNGNHAN.MAMB, LOAI, COUNT(MANV)
FROM CHUNGNHAN, MAYBAY
WHERE CHUNGNHAN.MAMB =MAYBAY.MAMB
GROUP BY CHUNGNHAN.MAMB, LOAI

--30. V???i m???i lo???i m??y bay cho bi???t lo???i m??y bay v?? 
------t???ng s??? chuy???n bay kh??ng th??? th???c hi???n b???i lo???i m??y bay ????.
SELECT MAMB, LOAI, COUNT(DODAI) AS SoChuyenBayKhongTheBay
FROM MAYBAY, CHUYENBAY
WHERE TAMBAY < DODAI
GROUP BY MAMB, LOAI

--31. V???i m???i lo???i m??y bay c?? t???m bay tr??n 3200km, cho bi???t t??n c???a 
-----lo???i m??y bay v?? l????ng trung b??nh c???a c??c phi c??ng c?? th??? l??i lo???i m??y bay ????.
SELECT CHUNGNHAN.MAMB, LOAI, AVG(LUONG)
FROM CHUNGNHAN, NHANVIEN, MAYBAY
WHERE CHUNGNHAN.MANV = NHANVIEN.MANV
    AND MAYBAY.MAMB = CHUNGNHAN.MAMB
    AND CHUNGNHAN.MAMB IN (SELECT MAMB
                            FROM MAYBAY
                            WHERE TAMBAY >= 3200)
GROUP BY CHUNGNHAN.MAMB, LOAI

--32. V???i m???i lo???i m??y bay cho bi???t lo???i m??y bay 
--------v?? t???ng s??? phi c??ng kh??ng l??i lo???i m??y bay ????.
SELECT CHUNGNHAN.MAMB, LOAI, (SELECT COUNT(DISTINCT CHUNGNHAN.MANV) FROM CHUNGNHAN) - COUNT(CHUNGNHAN.MANV)
FROM MAYBAY, CHUNGNHAN, NHANVIEN
WHERE MAYBAY.MAMB = CHUNGNHAN.MAMB
    AND NHANVIEN.MANV = CHUNGNHAN.MANV
GROUP BY CHUNGNHAN.MAMB, LOAI

--33. V???i m???i nh??n vi??n c?? bi???t m?? s???, t??n nh??n vi??n v?? t???ng s??? 
------chuy???n bay xu???t ph??t t??? S??i g??n m?? nh??n vi??n ???? c?? th??? l??i.



--34. V???i m???i phi c??ng cho bi???t m?? s???, t??n phi c??ng v?? t???ng s??? 
------chuy???n bay xu???t ph??t t??? S??i g??n m?? nh??n vi??n ???? c?? th??? l??i.


--35. V???i v???i chuy???n bay cho bi???t m?? s??? chuy???n bay 
------v?? t???ng s??? lo???i m??y bay c?? th??? th???c hi???n chuy???n bay ????.

--36. V???i v???i chuy???n bay cho bi???t m?? s??? chuy???n bay 
-----v?? t???ng s??? lo???i m??y bay kh??ng th??? th???c hi???n chuy???n bay ????.

--37.Cho bi???t t??n c??c lo???i m??y bay m?? t???t c??? c??c phi c??ng 
--------c?? th??? l??i ?????u c?? l????ng l???n h??n 200,000.

--38. T??m c??c phi c??ng c?? th??? l??i t???t c??? c??c lo???i m??y bay.
SELECT CHUNGNHAN.MANV, TEN, COUNT(DISTINCT MAMB)
FROM NHANVIEN, CHUNGNHAN
WHERE NHANVIEN.MANV = CHUNGNHAN.MANV
GROUP BY CHUNGNHAN.MANV, TEN
HAVING COUNT(DISTINCT MAMB) = (SELECT COUNT(MAMB)
                                    FROM MAYBAY)

--39. T??m c??c phi c??ng c?? th??? l??i t???t c??? c??c lo???i m??y bay Boeing.
SELECT CHUNGNHAN.MANV, TEN, COUNT(DISTINCT MAMB)
FROM NHANVIEN, CHUNGNHAN
WHERE NHANVIEN.MANV = CHUNGNHAN.MANV
    AND MAMB IN (SELECT MAMB
                    FROM MAYBAY
                    WHERE LOAI LIKE 'Boeing%')
GROUP BY CHUNGNHAN.MANV, TEN
HAVING COUNT(DISTINCT MAMB) = (SELECT COUNT(MAMB)
                                FROM MAYBAY
                                WHERE LOAI LIKE 'Boeing%')

--40. Cho bi???t th??ng tin c??c ???????ng bay m?? t???t c??? c??c phi c??ng 
-------c?? th??? bay tr??n ???????ng bay ???? ?????u c?? l????ng l???n h??n 100,000.
