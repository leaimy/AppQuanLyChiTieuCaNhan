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