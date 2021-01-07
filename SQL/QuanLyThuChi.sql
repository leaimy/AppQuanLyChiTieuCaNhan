USE QuanLyChiTieuTietKiem
GO

-- SELECT *
-- FROM QuanLyTienHienCo
-- GO

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_QuanLyTien_GetAllQuanLyTien'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_QuanLyTien_GetAllQuanLyTien
GO
CREATE PROC usp_QuanLyTien_GetAllQuanLyTien
@IdNguoiDung INT
AS
BEGIN
    DECLARE @QuanLytienChuaHoanThanhID INT
    SELECT @QuanLytienChuaHoanThanhID = Id FROM QuanLyTienHienCo
    WHERE NguoiDung_Id = @IdNguoiDung AND TrangThai = 0 AND NgayKT < GETDATE()

    IF (@QuanLytienChuaHoanThanhID IS NOT NULL)
        UPDATE QuanLyTienHienCo
        SET 
            TrangThai = 1
        WHERE Id = @QuanLytienChuaHoanThanhID

    SELECT Id, NgayBD, NgayKT, TrangThai FROM QuanLyTienHienCo
    WHERE NguoiDung_Id = @IdNguoiDung
    ORDER BY NgayBD DESC
END
GO
EXECUTE dbo.usp_QuanLyTien_GetAllQuanLyTien 1
GO

-- select * from QuanLyTienHienCo
-- GO

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_QuanLyTien_ThongKeTongQuan'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_QuanLyTien_ThongKeTongQuan
GO
CREATE PROC usp_QuanLyTien_ThongKeTongQuan
@IdNguoiDung INT
AS
BEGIN
    SELECT 
        @IdNguoiDung AS [NguoiDung_Id],
        SUM(SoTienHienCo) AS TongSoTienDaQuanLy,
        SUM(SoTienDaSuDung) AS TongSoTienDaChiTieu,
        SUM(CASE WHEN TrangThai = 1 THEN 1 ELSE 0 END) AS TongSoKeHoachQuanLyDaHoanThanh
    FROM QuanLyTienHienCo
    WHERE NguoiDung_Id = @IdNguoiDung
END
GO

EXEC usp_QuanLyTien_ThongKeTongQuan 1
GO

-- select * from QuanLyTienHienCo

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_QuanLyTien_ThongKeChiTiet'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_QuanLyTien_ThongKeChiTiet
GO
CREATE PROCEDURE dbo.usp_QuanLyTien_ThongKeChiTiet
@QuanLyTienID INT    
AS
    DECLARE @soTienHienCo DECIMAL;
    DECLARE @soTienDaSuDung DECIMAL;
    DECLARE @ngayBD DATETIME;
    DECLARE @ngayKT DATETIME;
    DECLARE @soNgayVuotMuc INT = 0;

    SELECT 
        @soTienHienCo = SoTienHienCo,
        @soTienDaSuDung = SoTienDaSuDung,
        @ngayBD = NgayBD,
        @ngayKT = NgayKT
    FROM QuanLyTienHienCo
    WHERE QuanLyTienHienCo.Id = @QuanLyTienID;

    DECLARE @tongSoNgay INT;
    SET @tongSoNgay = DATEDIFF(DAY, @ngayBD, @ngayKT);

    DECLARE @soNgayConLai INT;
    SET @soNgayConLai = DATEDIFF(DAY, GETDATE(), @ngayKT);

    IF (@soNgayConLai < 0)   
        SET @soNgayConLai = 0; 
    
    DECLARE @hanMucChiTieu INT;
    SET @hanMucChiTieu = @soTienHienCo / @tongSoNgay / 1000;
    SET @hanMucChiTieu = FLOOR(@hanMucChiTieu)
    SET @hanMucChiTieu = @hanMucChiTieu * 1000

    DECLARE @soDu DECIMAL;
    SET @soDu = @soTienHienCo - @soTienDaSuDung;

    SELECT @soNgayVuotMuc = COUNT(*) FROM ChiTieu
    WHERE QuanLyTienHienCo_Id = @QuanLyTienID AND TongChi > @hanMucChiTieu

    IF (@soTienHienCo IS NULL) SET @soTienHienCo = 0
    IF (@soTienDaSuDung IS NULL) SET @soTienDaSuDung = 0
    IF (@soDu IS NULL) SET @soDu = 0
    IF (@ngayBD IS NULL) SET @ngayBD = GETDATE()
    IF (@ngayKT IS NULL) SET @ngayKT = GETDATE()
    IF (@soNgayConLai IS NULL) SET @soNgayConLai = 0
    IF (@hanMucChiTieu IS NULL) SET @hanMucChiTieu = 0
    IF (@soNgayVuotMuc IS NULL) SET @soNgayVuotMuc = 0

    SELECT 
        @QuanLyTienID AS [Id],
        @soTienHienCo AS [SoTienHienCo],
        @soTienDaSuDung AS [SoTienDaSuDung],
        @soDu AS [SoDu],
        @ngayBD AS [NgayBD],
        @ngayKT AS [NgayKT],
        @soNgayConLai AS [SoNgayConLai],
        @hanMucChiTieu AS [HanMucChiTieu],
        @soNgayVuotMuc AS [SoNgayVuotMuc]
GO

EXECUTE dbo.usp_QuanLyTien_ThongKeChiTiet 1
GO

-- Create a new stored procedure called 'usp_ThongKeNguonThuTongQuan' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ThongKeNguonThuTongQuan'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ThongKeNguonThuTongQuan
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_ThongKeNguonThuTongQuan
    @QuanLyTienID INT
AS    
    SELECT QuanLyTienHienCo.Id AS [Id], Nhom, SUM(SoTien) AS [SoTien]
    FROM QuanLyTienHienCo
    JOIN ChiTietNguonThu ON QuanLyTienHienCo.Id = ChiTietNguonThu.QuanLyTienHienCo_Id
    WHERE QuanLyTienHienCo.Id = @QuanLyTienID
    GROUP BY QuanLyTienHienCo.Id, Nhom
    ORDER BY [SoTien] DESC
GO

EXECUTE dbo.usp_ThongKeNguonThuTongQuan 1
GO

-- Create a new stored procedure called 'usp_ThongKeCacKhoanChiTongQuan' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ThongKeCacKhoanChiTongQuan'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ThongKeCacKhoanChiTongQuan
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_ThongKeCacKhoanChiTongQuan
    @QuanLyTienID INT
AS
    SELECT 
        @QuanLyTienID AS [Id], 
        ChiTietChiTieu.Nhom AS [Nhom], 
        SUM(ChiTietChiTieu.SoTien) AS [SoTien]
    FROM ChiTieu
    JOIN QuanLyTienHienCo ON QuanLyTienHienCo.Id = ChiTieu.QuanLyTienHienCo_Id
    JOIN ChiTietChiTieu ON ChiTieu.Id = ChiTietChiTieu.ChiTieu_Id
    WHERE QuanLyTienHienCo.Id = @QuanLyTienID
    GROUP BY ChiTietChiTieu.Nhom
    ORDER BY [SoTien] DESC
GO

EXECUTE dbo.usp_ThongKeCacKhoanChiTongQuan 4
GO

-- Create a new stored procedure called 'usp_QuanLyTien_LayTatCaChiTieu' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_QuanLyTien_LayTatCaChiTieu'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_QuanLyTien_LayTatCaChiTieu
GO

CREATE PROCEDURE dbo.usp_QuanLyTien_LayTatCaChiTieu
    @QuanLyTienID INT
AS
    SELECT * 
    FROM ChiTieu
    WHERE QuanLyTienHienCo_Id = @QuanLyTienID
    ORDER BY Ngay ASC
GO

EXECUTE dbo.usp_QuanLyTien_LayTatCaChiTieu 1 
GO

-- Create a new stored procedure called 'usp_ChiTieu_LayTatCaChiTietChiTieu' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ChiTieu_LayTatCaChiTietChiTieu'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ChiTieu_LayTatCaChiTietChiTieu
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_ChiTieu_LayTatCaChiTietChiTieu
    @ChiTieuID INT
AS
    SELECT *
    FROM ChiTietChiTieu
    WHERE ChiTieu_Id = @ChiTieuID
    ORDER BY CreatedAt ASC
GO

EXECUTE dbo.usp_ChiTieu_LayTatCaChiTietChiTieu 1 
GO

--Them quan ly tien
CREATE PROC usp_QuanLyTien_ThemQuanLyTien
@IdNguoiDung INT, @ngayBD DATETIME, @ngayKT DATETIME
AS
BEGIN
    INSERT INTO QuanLyTienHienCo (NguoiDung_Id, NgayBD, NgayKT)
    VALUES (@IdNguoiDung, @ngayBD, @ngayKT)
END
GO

-- EXEC usp_QuanLyTien_ThemQuanLyTien
-- GO

--Them nguon thu
CREATE PROC usp_ThemNguonThu
@IdQuanLyTien INT, @SoTien DECIMAL, @Nhom NVARCHAR(100)
AS
BEGIN
    INSERT INTO ChiTietNguonThu (QuanLyTienHienCo_Id, SoTien, Nhom)
    VALUES (@IdQuanLyTien, @SoTien, @Nhom)
    
    DECLARE @SoTienHienCo DECIMAL = 0
    SELECT @SoTienHienCo = SoTienHienCo FROM QuanLyTienHienCo 
    WHERE Id = @IdQuanLyTien

    DECLARE @SoTienHienCoMoi DECIMAL = 0
    SET @SoTienHienCoMoi = @SoTienHienCo + @SoTien

    UPDATE QuanLyTienHienCo
    SET SoTienHienCo = @SoTienHienCoMoi
    WHERE Id = @IdQuanLyTien
END
GO

-- EXEC usp_ThemNguonThu
-- GO

--Them chi tiet chi tieu
CREATE PROC usp_ChiTieu_ThemChiTietChiTieu
@Ten NVARCHAR(200), @Nhom NVARCHAR(200), @SoTien DECIMAL, @NgayChiTieu DATETIME
AS
BEGIN
    DECLARE @IdQuanLyTien INT
    SELECT @IdQuanLyTien = Id FROM QuanLyTienHienCo
    WHERE TrangThai = 0

    IF(@IdQuanLyTien IS NULL)
        RETURN


    DECLARE @IdChiTieu INT
    SELECT @IdChiTieu = Id FROM ChiTieu
    WHERE DATEDIFF(DAY, Ngay, @NgayChiTieu) = 0

    IF(@IdChiTieu IS NULL)
    BEGIN
        INSERT INTO ChiTieu(QuanLyTienHienCo_Id, Ngay, TongChi)
        VALUES (@IdQuanLyTien, @NgayChiTieu, 0)

        SELECT @IdChiTieu = Id FROM ChiTieu
        WHERE DATEDIFF(DAY, Ngay, @NgayChiTieu) = 0
    END


    INSERT INTO ChiTietChiTieu(ChiTieu_Id, Ten, Nhom, SoTien)
    VALUES (@IdChiTieu, @Ten, @Nhom, @SoTien)

    DECLARE @TongChiHienTai DECIMAL
    SELECT @TongChiHienTai = TongChi FROM ChiTieu
    WHERE Id = @IdChiTieu

    DECLARE @TongChiMoi DECIMAL
    SET @TongChiMoi = @TongChiHienTai + @SoTien

    UPDATE ChiTieu
    SET TongChi = @TongChiMoi
    WHERE Id=@IdChiTieu

    DECLARE @SoTienDaSuDung DECIMAL
    SELECT @SoTienDaSuDung = SoTienDaSuDung FROM QuanLyTienHienCo
    WHERE Id = @IdQuanLyTien

    DECLARE @SoTienSuDungMoi DECIMAL
    SET @SoTienSuDungMoi = @SoTienDaSuDung + @SoTien

    UPDATE QuanLyTienHienCo
    SET SoTienDaSuDung = @SoTienSuDungMoi
    WHERE Id = @IdQuanLyTien
END
GO

-- EXEC usp_ChiTieu_ThemChiTietChiTieu

-- SELECT * FROM ChiTietChiTieu