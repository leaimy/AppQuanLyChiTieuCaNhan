USE QuanLyChiTieuTietKiem
GO

/*
    HÀM ĐẾM SỐ NGÀY TIẾT KIỆM ĐÃ HOÀN THÀNH CỦA 1 MỤC TIÊU TIẾT KIỆM
*/
IF OBJECT_ID (N'dbo.ufnDemSoNgayTietKiemDaHoanThanh', N'FN') IS NOT NULL  
    DROP FUNCTION ufnDemSoNgayTietKiemDaHoanThanh;  
GO  
CREATE FUNCTION dbo.ufnDemSoNgayTietKiemDaHoanThanh(@tietKiemID int)  
RETURNS int   
AS   
BEGIN  
    DECLARE @soNgay int;  
    
    SELECT @soNgay = COUNT(*)
    FROM MucTieuTietKiem
    JOIN ChiTietTietKiem ON MucTieuTietKiem.Id = ChiTietTietKiem.MucTieuTietKiem_Id
    WHERE ChiTietTietKiem.TrangThai = 1 AND MucTieuTietKiem_Id = @tietKiemID

    IF (@soNgay IS NULL)   
        SET @soNgay = 0;  
    RETURN @soNgay;  
END; 
GO

/*
    HÀM ĐẾM SỐ NGÀY TIẾT KIỆM CHƯA HOÀN THÀNH CỦA 1 MỤC TIÊU TIẾT KIỆM
*/
IF OBJECT_ID (N'dbo.ufnDemSoNgayTietKiemChuaHoanThanh', N'FN') IS NOT NULL  
    DROP FUNCTION ufnDemSoNgayTietKiemChuaHoanThanh;  
GO  
CREATE FUNCTION dbo.ufnDemSoNgayTietKiemChuaHoanThanh(@tietKiemID int)  
RETURNS int   
AS   
BEGIN  
    DECLARE @soNgay int;  
    
    SELECT @soNgay = COUNT(*)
    FROM MucTieuTietKiem
    JOIN ChiTietTietKiem ON MucTieuTietKiem.Id = ChiTietTietKiem.MucTieuTietKiem_Id
    WHERE ChiTietTietKiem.TrangThai = 0 AND MucTieuTietKiem_Id = @tietKiemID

    IF (@soNgay IS NULL)   
        SET @soNgay = 0;  
    RETURN @soNgay;  
END; 
GO

/*
    LẤY DANH SÁCH TẤT CẢ MỤC TIÊU TIẾT KIỆM THUỘC VỀ 1 NGƯỜI DÙNG
*/
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_TietKiem_GetAllMucTieu'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_TietKiem_GetAllMucTieu
GO

CREATE PROC usp_TietKiem_GetAllMucTieu
@IdNguoiDung INT
AS
BEGIN
    SELECT Id, TenMucTieu, TrangThai FROM MucTieuTietKiem
    WHERE NguoiDung_Id = @IdNguoiDung
    ORDER BY NgayBD DESC
END
GO

EXEC usp_TietKiem_GetAllMucTieu 1
GO

/*
    LẤY THÔNG TIN CHI TIẾT VỀ 1 MỤC TIÊU TIẾT KIỆM
*/
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_TietKiem_GetChiTietMucTieu'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_TietKiem_GetChiTietMucTieu
GO
CREATE PROC usp_TietKiem_GetChiTietMucTieu
@Id INT
AS
BEGIN
    DECLARE @SoNgayDaTietKiem INT 
    DECLARE @SoNgayChuaTietKiem INT 

    SET @SoNgayDaTietKiem = dbo.ufnDemSoNgayTietKiemDaHoanThanh(@Id)
    SET @SoNgayChuaTietKiem = dbo.ufnDemSoNgayTietKiemChuaHoanThanh(@Id)

    DECLARE @TrangThai BIT = 0
    IF (@SoNgayChuaTietKiem = 0)
        SET @TrangThai = 1

    SELECT 
    Id,
    NguoiDung_Id,
    TenMucTieu,
    MoTa,
    SoTienCanTietKiem,
    SoTienDaTietKiemDuoc,
    NgayBD,
    NgayKT,
    @TrangThai AS TrangThai,
    LoaiTietKiem,
    CreatedAt,
    @SoNgayDaTietKiem AS SoNgayHoanThanh,
    @SoNgayChuaTietKiem AS SoNgayChuaHoanThanh
    FROM MucTieuTietKiem
    WHERE Id = @Id
END
GO

EXECUTE dbo.usp_TietKiem_GetChiTietMucTieu 1 
GO

/*
    THỐNG KÊ TỔNG QUAN CÁC MỤC TIÊU TIẾT KIỆM CỦA 1 NGƯỜI DÙNG
    CÁC TRƯỜNG THỐNG KÊ GỒM CÓ:
        - Tổng số tiền tiết kiệm
        - Tổng số tiền đã tiết kiệm được
        - Tổng số mục tiêu tiết kiệm đã hoàn thành
        - Tổng số mục tiêu tiết kiệm chưa hoàn thành
*/
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_TietKiem_ThongKeTietKiem'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_TietKiem_ThongKeTietKiem
GO

CREATE PROC usp_TietKiem_ThongKeTietKiem
@IdNguoiDung INT
AS
BEGIN
    SELECT
    @IdNguoiDung AS Id,
    SUM(SoTienCanTietKiem)AS SoTienCanTietKiem, 
    SUM(SoTienDaTietKiemDuoc)AS SoTienDaTietKiemDuoc, 
    SUM(CASE WHEN TrangThai = 1 THEN 1 ELSE 0 END) AS SoMucTieuHoanThanh,
    SUM(CASE WHEN TrangThai = 0 THEN 1 ELSE 0 END) AS SoMucTieuChuaHoanThanh
     FROM MucTieuTietKiem
    WHERE NguoiDung_Id = @IdNguoiDung
END
GO

EXEC usp_TietKiem_ThongKeTietKiem 1
GO

/*
    LẤY DANH SÁCH TẤT CẢ CÁC THEO DÕI CHI TIẾT TIẾT KIỆM THUỘC VỀ 1 MỤC TIÊU TIẾT KIỆM
*/
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_TietKiem_GetTime'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_TietKiem_GetTime
GO

CREATE PROC usp_TietKiem_GetTime
@IdMucTieu INT
AS
BEGIN
    SELECT * FROM ChiTietTietKiem
    WHERE MucTieuTietKiem_Id = @IdMucTieu
    ORDER BY Ngay ASC 
END
GO

-- EXEC usp_TietKiem_GetTime 2
-- GO

/*
    THÊM 1 MỤC TIÊU TIẾT KIỆM MỚI
*/
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_TietKiem_ThemMucTieuTietKiem'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_TietKiem_ThemMucTieuTietKiem
GO
CREATE PROC usp_TietKiem_ThemMucTieuTietKiem
    @TenMucTieu NVARCHAR(200), 
    @MoTa NVARCHAR(200), 
    @SoTienTietKiem DECIMAL, 
    @NgayBD DATETIME, 
    @NgayKT DATETIME, @LoaiTietKiem NVARCHAR(50),
    @idNguoiDung INT
AS 
BEGIN  
    INSERT INTO MucTieuTietKiem (NguoiDung_Id, TenMucTieu, MoTa, SoTienCanTietKiem, NgayBD, NgayKT, LoaiTietKiem)
    VALUES (@idNguoiDung, @TenMucTieu, @MoTa, @SoTienTietKiem, @NgayBD, @NgayKT,@LoaiTietKiem)

    DECLARE @IdMucTieu INT
    SELECT @IdMucTieu = MAX(Id) FROM MucTieuTietKiem

    DECLARE @counter INT;
    
    IF(@loaiTietKiem=N'Ngày')
        SET @counter = DATEDIFF(DAY, @NgayBD, @NgayKT);
    ELSE
        SET @counter = DATEDIFF(WEEK, @NgayBD, @NgayKT);

    DECLARE @amount DECIMAL
    SELECT @amount = @SoTienTietKiem / @counter

    SELECT @amount = (@amount / 1000 + 1)
    SELECT @amount = @amount * 1000

    WHILE  (@NgayBD <= @NgayKT)
        BEGIN
            INSERT ChiTietTietKiem (MucTieuTietKiem_Id, SoTien, Ngay, TrangThai)
            VALUES (@IdMucTieu, @amount, @NgayBD, 0)

        IF(@loaiTietKiem=N'Ngày')
            SET @NgayBD = DATEADD(DAY, 1, @NgayBD)
        ELSE
            SET @NgayBD = DATEADD(WEEK, 1, @NgayBD)
    END
END
GO

-- EXEC usp_TietKiem_ThemMucTieuTietKiem 
-- GO

/*
    CẬP NHẬT TRẠNG THÁI MỤC TIÊU TIẾT IỆM THEO NGÀY
*/
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_TietKiem_CapNhatTrangThaiMucTieu'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_TietKiem_CapNhatTrangThaiMucTieu
GO

CREATE PROC usp_TietKiem_CapNhatTrangThaiMucTieu
@idMucTieu INT, @Date DATETIME
AS 
BEGIN
    UPDATE ChiTietTietKiem
    SET TrangThai = 1
    WHERE MucTieuTietKiem_Id = @idMucTieu AND DATEDIFF(DAY, Ngay, @Date) = 0

    DECLARE @SoTien DECIMAL = 0
    SELECT @SoTien = @SoTien FROM ChiTietTietKiem
    WHERE MucTieuTietKiem_Id = @idMucTieu AND DATEDIFF(DAY, Ngay, @Date) = 0

    DECLARE @SoTienTietKiemHienTai DECIMAL
    SELECT @SoTienTietKiemHienTai = SoTienDaTietKiemDuoc FROM MucTieuTietKiem
    WHERE Id = @idMucTieu

    DECLARE @SoTienDaTietKiemMoi DECIMAL
    SET @SoTienDaTietKiemMoi = @SoTienTietKiemHienTai + @SoTien

    UPDATE MucTieuTietKiem
    SET SoTienDaTietKiemDuoc = @SoTienDaTietKiemMoi
    WHERE Id = @idMucTieu
END
GO


