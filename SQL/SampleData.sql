USE QuanLyChiTieuTietKiem
GO

-- Người dùng
SET IDENTITY_INSERT NguoiDung ON
INSERT NguoiDung (Id, TenDangNhap, MatKhau, TenHienThi, Avatar)
VALUES 
    (1, 'thiha', 'nth', N'Thị Hà', 'avatar0'),
    (2, 'tronghieu', 'nth', N'Trọng Hiếu', 'avatar1')
GO
SET IDENTITY_INSERT NguoiDung OFF

SELECT * FROM NguoiDung

-- Mục tiêu tiết kiệm và chi tiết mục tiêu tiết kiệm
SET IDENTITY_INSERT MucTieuTietKiem ON
INSERT MucTieuTietKiem (Id, NguoiDung_Id, TenMucTieu, MoTa, SoTienCanTietKiem, SoTienDaTietKiemDuoc, NgayBD, NgayKT, LoaiTietKiem)
VALUES 
(
    1, 1, N'Tiết kiệm mua máy ảnh', N'Mua 1 chiếc máy ảnh thật đẹp để chụp hình cho mọi người',
    4000000, 0, '20201220', '20210120', 'ngày'
),
(
    2, 1, N'Tiet'
)

DECLARE @begin_date DATETIME = '20201220'
DECLARE @end_date DATETIME = '20210120'

DECLARE @date INT
SELECT @date = DATEDIFF(DAY, @begin_date, @end_date)

DECLARE @amount DECIMAL
SELECT @amount = 4000000 / @date

SELECT @amount = (@amount / 1000 + 1)
SELECT @amount = @amount * 1000

WHILE  (@begin_date <= @end_date)
    BEGIN
        INSERT ChiTietTietKiem (MucTieuTietKiem_Id, SoTien, Ngay)
        VALUES (1, @amount, @begin_date)        

        SET @begin_date = DATEADD(DAY, 1, @begin_date)
    END

SET IDENTITY_INSERT MucTieuTietKiem OFF

SELECT * FROM MucTieuTietKiem
SELECT * FROM ChiTietTietKiem

UPDATE MucTieuTietKiem
SET SoTienDaTietKiemDuoc = 390000 WHERE Id = 1

UPDATE ChiTietTietKiem
SET TrangThai = 1 WHERE Id = 1 OR Id = 2 OR Id = 4

-- Quản lý số tiền hiện có
SET IDENTITY_INSERT QuanLyTienHienCo ON

INSERT INTO QuanLyTienHienCo(Id, NguoiDung_Id, SoTienHienCo, SoTienDaSuDung, NgayBD, NgayKT, TrangThai)
    VALUES 
        (1, 1, 1000000, 1000000, '20201001', '20201031', 1),
        (2, 1, 1500000, 1500000, '20201101', '20201130', 1),
        (3, 1, 2000000, 0, '20201201', '20201231', 0),
        (4, 2, 1000000, 1000000, '20201001', '20201031', 1),
        (5, 2, 1000000, 1000000, '20201101', '20201130', 1),
        (6, 2, 1000000, 0, '20201201', '20201231', 0)

SET IDENTITY_INSERT QuanLyTienHienCo OFF

SELECT * FROM QuanLyTienHienCo