USE QuanLyChiTieuTietKiem
GO

-- Chèn dữ liệu vào bảng người dùng
DELETE NguoiDung
GO

-- Người dùng
SET IDENTITY_INSERT NguoiDung ON
INSERT NguoiDung
    (Id, TenDangNhap, MatKhau, TenHienThi, Avatar)
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
    DECLARE @loaiTietKiem NVARCHAR(100)

    SELECT
        @begin_date = NgayBD,
        @end_date = NgayKT,
        @saving_amount = SoTienCanTietKiem,
        @loaiTietKiem = LoaiTietKiem
    FROM MucTieuTietKiem
    WHERE Id = @TietKiemID

    DECLARE @counter INT;
    IF(@loaiTietKiem=N'Ngày')
    SET @counter = DATEDIFF(DAY,@begin_date,@end_date);
ELSE
    SET @counter = DATEDIFF(WEEK,@begin_date,@end_date);

    DECLARE @amount DECIMAL
    SELECT @amount = @saving_amount / @counter

    SELECT @amount = (@amount / 1000 + 1)
    SELECT @amount = @amount * 1000

    DECLARE @i INT = 0;
    DECLARE @soTienDaTietKiem INT = 0;

    WHILE  (@begin_date <= @end_date)
        BEGIN
        IF (@i < 10)
            BEGIN
                INSERT ChiTietTietKiem
                    (MucTieuTietKiem_Id, SoTien, Ngay, TrangThai)
                VALUES
                    (@TietKiemID, @amount, @begin_date, 1)

                SELECT @soTienDaTietKiem = SoTienDaTietKiemDuoc FROM MucTieuTietKiem WHERE Id = @TietKiemID
                SET @soTienDaTietKiem = @soTienDaTietKiem + @amount

                UPDATE MucTieuTietKiem
                    SET SoTienDaTietKiemDuoc = @soTienDaTietKiem
                    WHERE Id = @TietKiemID
            END
        ELSE
            INSERT ChiTietTietKiem
                (MucTieuTietKiem_Id, SoTien, Ngay, TrangThai)
            VALUES
                (@TietKiemID, @amount, @begin_date, 0)

        SET @i = @i + 1

        IF(@loaiTietKiem=N'Ngày')
            SET @begin_date = DATEADD(DAY, 1, @begin_date)
            ELSE
            SET @begin_date = DATEADD(WEEK, 1, @begin_date)
    END

    PRINT(CONCAT(N'Thành công: Tạo danh sách chi tiết tiết kiệm của kế hoạch tiết kiệm có ID = ', @TietKiemID));
END
GO

-- Chèn dữ liệu vào bảng tiết kiệm và chi tiết mục tiêu tiết kiệm
SET IDENTITY_INSERT MucTieuTietKiem ON
INSERT MucTieuTietKiem
    (Id, NguoiDung_Id, TenMucTieu, MoTa, SoTienCanTietKiem, SoTienDaTietKiemDuoc, NgayBD, NgayKT, LoaiTietKiem, TrangThai)
VALUES
    (
        1, 1, N'Tiết kiệm mua máy ảnh', N'Mua 1 chiếc máy ảnh thật đẹp để chụp hình cho mọi người',
        4000000, 0, '20201220', '20210120', 'ngày', 0
),
    (
        2, 1, N'Tiết kiệm mua sách', N'Cố lên!!! Mỗi quyển sách là một người bạn',
        500000, 500000, '20201020', '20201220', 'ngày', 1
),
    (
        3, 1, N'Tiết kiệm mua quần áo', N'Cố lên!!! Cố lên!!! Sắp có quần áo mới để mặc rồi',
        1000000, 1000000, '20200820', '20210120', 'tuần', 1
),
    (
        4, 2, N'Tiết kiệm mua gas', N'Cố lên!!! Sắp có gas sài rồi',
        400000, 400000 , '20201020', '20210101', 'tuần', 1
),
    (
        5, 2, N'Tiết kiệm mua đồ trang điểm', N'Cố lên!!! Sắp có đồ để trang điểm cho mình rồi hihi',
        2000000, 200000, '20201120', '20210320', 'ngày', 0
)


PRINT(N'Chèn xong dữ liệu mẫu bảng mục tiêu tiết kiệm');

EXECUTE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem 1
GO

EXECUTE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem 2
GO

EXECUTE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem 3
GO

EXECUTE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem 4
GO

EXECUTE dbo.usp_TaoDanhSachChiTietMucTieuTietKiem 5
GO

SET IDENTITY_INSERT MucTieuTietKiem OFF

UPDATE ChiTietTietKiem SET TrangThai = 1 WHERE MucTieuTietKiem_Id = 2 OR MucTieuTietKiem_Id = 3 OR MucTieuTietKiem_Id = 4


select *
from ChiTietTietKiem WHERE MucTieuTietKiem_Id = 2




-- Chèn dữ liệu mẫu bảng quản lý số tiền hiện có
SET IDENTITY_INSERT QuanLyTienHienCo ON

INSERT INTO QuanLyTienHienCo
    (Id, NguoiDung_Id, SoTienHienCo, SoTienDaSuDung, NgayBD, NgayKT, TrangThai)
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

INSERT INTO ChiTietNguonThu
    (QuanLyTienHienCo_Id, Nhom, SoTien)
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

-- Chèn dữ liệu mẫu bảng chi tiêu và chi tiết chi tiêu
SET IDENTITY_INSERT ChiTieu ON

INSERT INTO ChiTieu
    (Id, QuanLyTienHienCo_Id, Ngay, TongChi)
VALUES
    (1, 1, '20201002', 500000),
    (2, 1, '20201005', 500000),
    (3, 2, '20201102', 1500000),
    (4, 4, '20201001', 500000),
    (5, 4, '20201010', 300000),
    (6, 4, '20201015', 200000),
    (7, 5, '20201120', 1000000)

SET IDENTITY_INSERT ChiTieu OFF
GO

INSERT INTO ChiTietChiTieu
    (ChiTieu_Id, Ten, Nhom, SoTien)
VALUES
    (1, N'Ăn đám cưới bạn', N'bạn bè', 300000),
    (1, N'Mua thực phẩm', N'đi chợ', 50000),
    (1, N'Mua áo', N'áo quần', 150000),
    (2, N'Ăn ngoài quán với bạn bè', N'ăn uống', 500000),
    (3, N'Mua áo', N'áo quần', 1300000),
    (3, N'Mua đồ ăn hằng ngày', N'đi chợ', 200000),
    (4, N'Mua áo', N'áo quần', 200000),
    (4, N'Ăn ngoài quán', N'ăn uống', 200000),
    (4, N'Bạn ở xa lên thăm', N'bạn bè', 100000),
    (5, N'Mua đồ', N'áo quần', 300000),
    (6, N'Mua đồ', N'áo quần', 100000),
    (6, N'Mua đồ ăn hằng ngày', N'đi chợ', 100000),
    (7, N'Mua đồ sang nhà thầy 20/11', N'xã hội', 100000)

