USE QuanLyChiTieuTietKiem
GO

-- Chèn dữ liệu vào bảng người dùng
DELETE NguoiDung
GO

-- Người dùng
SET IDENTITY_INSERT NguoiDung ON
INSERT NguoiDung (Id, TenDangNhap, MatKhau, TenHienThi, Avatar)
VALUES 
    (1, 'thiha', 'nth', N'Thị Hà', 'avatar0'),
    (2, 'tronghieu', 'nth', N'Trọng Hiếu', 'avatar1')
GO
SET IDENTITY_INSERT NguoiDung OFF

PRINT(N'Chèn xong dữ liệu mẫu bảng người dùng');
-- SELECT * FROM NguoiDung




-- Create a new stored procedure called 'usp_TaoDanhSachChiTietMucTieuTietKiem' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_TaoDanhSachChiTietMucTieuTietKiem'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem
    @TietKiemID INT
AS
BEGIN
    DECLARE @begin_date DATETIME
    DECLARE @end_date DATETIME
    DECLARE @saving_amount DECIMAL

    SELECT 
        @begin_date = NgayBD,
        @end_date = NgayKT,
        @saving_amount = SoTienCanTietKiem
    FROM MucTieuTietKiem 
    WHERE Id = @TietKiemID

    DECLARE @date INT
    SELECT @date = DATEDIFF(DAY, @begin_date, @end_date)

    DECLARE @amount DECIMAL
    SELECT @amount = @saving_amount / @date

    SELECT @amount = (@amount / 1000 + 1)
    SELECT @amount = @amount * 1000
    
    WHILE  (@begin_date <= @end_date)
        BEGIN
            INSERT ChiTietTietKiem (MucTieuTietKiem_Id, SoTien, Ngay, TrangThai)
            VALUES (@TietKiemID, @amount, @begin_date, 0)        

            SET @begin_date = DATEADD(DAY, 1, @begin_date)
        END

    PRINT(CONCAT(N'Thành công: Tạo danh sách chi tiết tiết kiệm của kế hoạch tiết kiệm có ID = ', @TietKiemID));
END
GO

-- Chèn dữ liệu vào bảng tiết kiệm và chi tiết mục tiêu tiết kiệm
SET IDENTITY_INSERT MucTieuTietKiem ON
INSERT MucTieuTietKiem (Id, NguoiDung_Id, TenMucTieu, MoTa, SoTienCanTietKiem, SoTienDaTietKiemDuoc, NgayBD, NgayKT, LoaiTietKiem)
VALUES 
(
    1, 1, N'Tiết kiệm mua máy ảnh', N'Mua 1 chiếc máy ảnh thật đẹp để chụp hình cho mọi người',
    4000000, 0, '20201220', '20210120', 'ngày'
)

PRINT(N'Chèn xong dữ liệu mẫu bảng mục tiêu tiết kiệm');

EXECUTE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem 1
GO

SET IDENTITY_INSERT MucTieuTietKiem OFF

UPDATE MucTieuTietKiem
SET SoTienDaTietKiemDuoc = 390000 WHERE Id = 1

UPDATE ChiTietTietKiem
SET TrangThai = 1 WHERE Id = 1 OR Id = 2 OR Id = 4







-- Chèn dữ liệu mẫu bảng quản lý số tiền hiện có
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
PRINT(N'Chèn xong dữ liệu mẫu bảng chi tiết mục tiêu tiết kiệm');
-- SELECT * FROM QuanLyTienHienCo;

INSERT INTO ChiTietNguonThu(QuanLyTienHienCo_Id, Nhom, SoTien)
    VALUES 
        (1, N'ba mẹ', 800000),
        (1, N'khác', 200000),
        (2, N'ba mẹ', 1000000),
        (2, N'bạn bè', 400000),
        (2, N'khác', 100000),
        (3, N'ba mẹ', 200000),
        (4, N'ba mẹ', 1000000),
        (5, N'ba mẹ', 100000),
        (6, N'ba mẹ', 100000);
GO
