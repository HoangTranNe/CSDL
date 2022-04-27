use master
go
if exists(select * from sysdatabases where name = 'TranBaoHoang')
	drop database TranBaoHoang
create DATABASE TranBaoHoang
go
USE TranBaoHoang


-- BANG NHAN VIEN
CREATE TABLE NHANVIEN
(
    HONV CHAR(10),
    TENLOT CHAR(10),
    TEN CHAR(10),
    MANV CHAR(9),
    NGSINH DATETIME,
    DCHI CHAR(100),
    PHAI CHAR(3),
    LUONG FLOAT,
    MA_NQL CHAR(9),
    PHG CHAR(3),
    CONSTRAINT PK_NHANVIEN PRIMARY KEY(MANV),
)

--BANG PHONG BAN
CREATE TABLE PHONGBAN
(
    TENPHG CHAR(20),
    MAPH CHAR(3),
    TRPHG CHAR(9),
    NG_NHANCHUC DATETIME,
    CONSTRAINT PK_PHONGBAN PRIMARY KEY(MAPH)
)

--BANG DIA DIEM PHG
CREATE TABLE DIADIEM_PHG
(
    MAPHG CHAR(3),
    DIADIEM CHAR(20),
    CONSTRAINT PK_DIADIEM_PHG PRIMARY KEY(MAPHG, DIADIEM)
)

--BANG THAN NHAN
CREATE TABLE THANNHAN
(
    MA_NHANVIEN CHAR(9),
    TENTN CHAR(10),
    PHAI CHAR(3),
    NGSINH DATETIME,
    QUANHE CHAR(10),
    CONSTRAINT PK_THANNHA PRIMARY KEY(MA_NHANVIEN, TENTN)
)

--BANG DE AN
CREATE TABLE DEAN
(
    TENDA CHAR(20),
    MADA CHAR(5),
    DDIEM_DA CHAR(20),
    PHONG CHAR(3),
    CONSTRAINT PK_DEAN PRIMARY KEY(MADA)
)

--BANG PHAN CONG
CREATE TABLE PHANCONG
(
    MA_NVIEN CHAR(9),
    SODA CHAR(5),
    THOIGIAN FLOAT,
    CONSTRAINT PK_PHANCONG PRIMARY KEY(MA_NVIEN, SODA)
)

--NHAP BANG NHAN VIEN
SET DATEFORMAT DMY
INSERT INTO NHANVIEN(HONV, TENLOT, TEN, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
    VALUES ('Dinh','Ba','Tien','123456789','09/01/1955','731 Tran Hung Dao, Q1, TPHCM','Nam',30000,'333445555','5'),
            ('Nguyen','Thanh','Tung','333445555','08/12/1945','638 Nguyen Van Cu, Q5, TPHCM','Nam',40000,'888665555','5'),
            ('Bui','Thuy','Vu','999887777','19/07/1958','332 Nguyen Thai Hoc, Q1, TPHCM','Nam',25000,'987654321','4'),
            ('Le','Thi','Nhan','987654321','20/06/1931','291 Ho Van Hue, QPN, TPHCM','Nu',43000,'888665555','4'),
            ('Nguyen','Manh','Hung','666884444','15/09/1952','975 Ba Ria, Vung Tau','Nam',38000,'333445555','5'),
            ('Tran','Thanh','Tam','453453453','31/07/1962','543 Mai Thi Luu, Q1, TPHCM','Nam',25000,'333445555','5'),
            ('Tran','Hong','Quan','987987987','29/03/1959','980Le Hong Phong, Q10, TPHCM','Nam',25000,'987654321','4'),
            ('Vuong','Ngoc','Quyen','888665555','10/10/1927','450 Trung Vuong, HaNoi','Nu',55000,'','1')

--NHAP BANG PHONG BAN
INSERT INTO PHONGBAN(TENPHG, MAPH, TRPHG, NG_NHANCHUC)
    VALUES ('Nghien cuu','5','333445555','22/05/1978'),
            ('Dieu hanh','4','987987987','01/01/1985'),
            ('Quan ly','1','888665555','19/06/1971')

--NHAP BANG DIA DIEM PHG
INSERT INTO DIADIEM_PHG(MAPHG, DIADIEM)
    VALUES ('1','TP HCM'),
            ('4','HA NOI'),
            ('5','VUNG TAU'),
            ('5','NHA TRANG'),
            ('5','TP HCM')

--NHAP BANG THAN NHAN
INSERT INTO THANNHAN(MA_NHANVIEN, TENTN, PHAI, NGSINH, QUANHE)
    VALUES ('333445555','Quang','Nu','05/04/1976','Con gai'),
            ('333445555','Khang','Nam','25/10/1973','Con trai'),
            ('333445555','Duong','Nu','03/05/1948','Vo chong'),
            ('987654321','Dang','Nam','29/02/1932','Vo chong'),
            ('123456789','Duy','Nam','01/01/1978','Con trai'),
            ('123456789','Chau','Nu','31/12/1978','Con gai'),
            ('123456789','Phuong','Nu','05/05/1957','Vo chong')

--NHAP BANG DE AN
INSERT INTO DEAN(TENDA, MADA, DDIEM_DA, PHONG)
    VALUES ('San pham X','1','VUNG TAU','5'),
            ('San pham Y','2','NHA TRANG','5'),
            ('San pham Z','3','TP HCM','5'),
            ('Tin hoc hoa','10','HA NOI','4'),
            ('Cap quang','20','TP HCM','1'),
            ('Dao tao','30','HA NOI','4')

--NHAP BANG PHA CONG
INSERT INTO PHANCONG(MA_NVIEN, SODA, THOIGIAN)
    VALUES ('123456789','1','32.5'),
            ('123456789','2','7.5'),
            ('666884444','3','40.0'),
            ('453453453','1','20.0'),
            ('453453453','2','20.0'),
            ('333445555','3','10.0'),
            ('333445555','10','10.0'),
            ('333445555','20','10.0'),
            ('999887777','30','30.0'),
            ('999887777','10','10.0'),
            ('987987987','10','35.0'),
            ('987987987','30','5.0'),
            ('987654321','30','20.0'),
            ('987654321','20','15.0'),
            ('888665555','20','')

--THIET LAP LIEN KET KHOA
ALTER TABLE DIADIEM_PHG ADD CONSTRAINT FK_DIADIEM_PHG_PHONGBAN FOREIGN KEY (MAPHG) REFERENCES PHONGBAN(MAPH)
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PHANCONG_NVIEN FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV)
ALTER TABLE PHANCONG ADD CONSTRAINT FK_PHANCONG_DEAN FOREIGN KEY (SODA) REFERENCES DEAN(MADA)
ALTER TABLE THANNHAN ADD CONSTRAINT FK_THANNHAN_NHANVIEN FOREIGN KEY (MA_NHANVIEN) REFERENCES NHANVIEN(MANV)


------BAI TAP

--1. Danh sách những đề án có:
-----o Người tham gia có họ “Dinh”
-----o Có người trưởng phòng chủ trì đề án họ “Dinh”
SELECT TENDA
FROM DEAN, PHANCONG, NHANVIEN
WHERE DEAN.MADA = PHANCONG.SODA
    AND PHANCONG.MA_NVIEN = NHANVIEN.MANV
    AND HONV = 'Dinh'
    OR MA_NQL = (SELECT MANV
                    FROM NHANVIEN
                    WHERE HONV = 'Dinh')

--2. Cho biết những nhân viên có cùng tên với người thân.
SELECT *
    FROM NHANVIEN K1
    WHERE TEN = ANY (SELECT TENTN
                    FROM THANNHAN K2
                    WHERE K1.MANV = K2.MA_NHANVIEN)

--3. Cho biết những nhân viên không có người thân nào.
SELECT *
    FROM NHANVIEN
    WHERE MANV NOT IN (SELECT MA_NHANVIEN
                        FROM THANNHAN)

--4. Cho biết danh sách những nhân viên có 2 thân nhân trở lên.
SELECT MA_NHANVIEN, HONV, TENLOT, TEN, COUNT(TENTN) AS SOTN
    FROM THANNHAN, NHANVIEN
    WHERE NHANVIEN.MANV = THANNHAN.MA_NHANVIEN
    GROUP BY MA_NHANVIEN, HONV, TENLOT, TEN
    HAVING COUNT(TENTN) >= 2

--5. Cho biết những trưởng phòng có tối thiểu 1 thân nhân.
SELECT *
    FROM NHANVIEN
    WHERE MANV IN (SELECT TRPHG
                        FROM PHONGBAN, THANNHAN
                        WHERE THANNHAN.MA_NHANVIEN = PHONGBAN.TRPHG)

--6. Cho biết những trưởng phòng có mức lương ít hơn (ít nhất một) nhân viên của mình.
SELECT *
    FROM NHANVIEN K1
    WHERE LUONG <= ANY(SELECT LUONG
                        FROM NHANVIEN K2
                        WHERE K1.MANV = K2.MA_NQL)

--7. Cho biết tên phòng, số lượng nhân viên và tổng lương của từng phòng.
SELECT TENPHG, COUNT(MAPH) AS SOLNV, SUM(LUONG) AS TONGLUONG
    FROM PHONGBAN, NHANVIEN
    WHERE PHONGBAN.MAPH = NHANVIEN.PHG
    GROUP BY TENPHG

--8. Cho biết mã nhân viên (MA_NVIEN) nào có nhiều thân nhân nhất.
SELECT MA_NHANVIEN, COUNT(TENTN) AS SOTN
FROM THANNHAN
GROUP BY MA_NHANVIEN
HAVING COUNT(TENTN) >= ALL( SELECT COUNT(TENTN)
                            FROM THANNHAN
                            GROUP BY MA_NHANVIEN)

--9. Với mỗi nhân viên, cho biết họ tên nhân viên và số thân nhân của nhân viên.
SELECT HONV, TENLOT, TEN, MANV, SUM( CASE WHEN MANV = '' THEN 1 ELSE 0 END) AS SOTN
    FROM NHANVIEN
    WHERE  MANV NOT IN (SELECT MA_NHANVIEN
                            FROM THANNHAN)
    GROUP BY HONV, TENLOT, TEN, MANV
UNION (SELECT HONV, TENLOT, TEN, MA_NHANVIEN, COUNT(TENTN) AS SOTN
            FROM THANNHAN, NHANVIEN
            WHERE THANNHAN.MA_NHANVIEN = NHANVIEN.MANV
            GROUP BY HONV, TENLOT, TEN, MA_NHANVIEN)

--10. Cho biết lương trung bình của tất các nhân viên nữ.
SELECT AVG( CASE WHEN PHAI = 'Nu' THEN LUONG END) AS LUONGTB
FROM NHANVIEN

--11. Cho biết tên của các nhân viên và tên các phòng ban mà họ phụ trách nếu có.


--12. Cho biết họ tên nhân viên và tên các đề án mà nhân viên đó tham gia.
SELECT HONV, TENLOT, TEN, TENDA
FROM PHANCONG, DEAN, NHANVIEN
WHERE DEAN.MADA = PHANCONG.SODA
        AND NHANVIEN.MANV = PHANCONG.MA_NVIEN

--13. Cho biết họ tên trưởng phòng của phòng có đông nhân viên nhất.
SELECT HONV, TENLOT, TEN
FROM NHANVIEN
WHERE MANV = (SELECT MA_NQL
                FROM NHANVIEN
                GROUP BY MA_NQL
                HAVING COUNT(MANV) >= ALL (SELECT COUNT(MANV)
                                            FROM NHANVIEN
                                            GROUP BY MA_NQL))

--14. Ứng với mỗi phòng cho biết họ, tên nhân viên có mức lương CAO nhất.
SELECT TENPHG, HONV, TENLOT, TEN, LUONG
FROM NHANVIEN K1,PHONGBAN
WHERE PHONGBAN.MAPH = K1.PHG
        AND LUONG >= ALL(SELECT LUONG
                            FROM NHANVIEN K2
                            WHERE K1.PHG = K2.PHG)

--15. Cho biết nhân viên tham gia tất cả các đề án.
SELECT MA_NVIEN, HONV, TENLOT, TEN, COUNT(DISTINCT SODA)
    FROM PHANCONG, NHANVIEN
    WHERE PHANCONG.MA_NVIEN = NHANVIEN.MANV
    GROUP BY MA_NVIEN, HONV, TENLOT, TEN
    HAVING COUNT(DISTINCT SODA) = (SELECT COUNT(MADA)
                                    FROM DEAN)

--16. Cho biết nhân viên làm việc cho tất cả các đề án mà phònng số 5 chủ trì.
SELECT MA_NVIEN, HONV, TENLOT, TEN, COUNT(DISTINCT SODA)
    FROM PHANCONG, NHANVIEN
    WHERE PHANCONG.MA_NVIEN = NHANVIEN.MANV
        AND SODA = ANY (SELECT MADA
                        FROM DEAN
                        WHERE PHONG = '5')
    GROUP BY MA_NVIEN, HONV, TENLOT, TEN
    HAVING COUNT(DISTINCT SODA) = (SELECT COUNT(MADA)
                            FROM DEAN
                            WHERE PHONG = '5')

--17. Cho biết những nhân viên tham gia tất cả đề án mà có nhân viên ‘987654321’ tham gia.
SELECT MA_NVIEN, HONV, TENLOT, TEN, COUNT(SODA)
    FROM PHANCONG, NHANVIEN
    WHERE PHANCONG.MA_NVIEN = NHANVIEN.MANV
    AND SODA = ANY (SELECT SODA
                        FROM PHANCONG
                        WHERE MA_NVIEN = '987654321')
    GROUP BY MA_NVIEN, HONV, TENLOT, TEN
    HAVING COUNT(SODA) = (SELECT COUNT(SODA)
                            FROM PHANCONG
                            WHERE MA_NVIEN = '987654321')
        AND MA_NVIEN NOT LIKE '987654321'

