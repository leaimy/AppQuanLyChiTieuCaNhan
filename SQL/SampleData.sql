USE QuanLyChiTieuTietKiem
GO

-- Người dùng
SET IDENTITY_INSERT NguoiDung ON
INSERT NguoiDung (Id, Email, MatKhau, TenHienThi, Avatar)
VALUES 
    (1, 'hantctk42@gmail.com', 'nth', N'Thị Hà', 'avatar0'),
    (2, 'hieuntctk42@gmail.com', 'nth', N'Trọng Hiếu', 'avatar1')
GO
SET IDENTITY_INSERT NguoiDung OFF

SELECT * FROM NguoiDung

-- Mục tiêu tiết kiệm và chi tiết mục tiêu tiết kiệm
SET IDENTITY_INSERT MucTieuTietKiem ON
INSERT MucTieuTietKiem (Id, NguoiDung_Id, TenMucTieu, MoTa, SoTienCanTietKiem, SoTienDaTietKiemDuoc, NgayBD, NgayKT, LoaiTietKiem)
VALUES (
    1, 1, N'Tiết kiệm mua máy ảnh', N'Mua 1 chiếc máy ảnh thật đẹp để chụp hình cho mọi người',
    4000000, 0, '20201220', '20210120', 'ngày'
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

