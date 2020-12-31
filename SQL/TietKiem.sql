USE QuanLyChiTieuTietKiem
GO


IF OBJECT_ID (N'dbo.ufnDemSoNgayTietKiemDaHoanThanh', N'FN') IS NOT NULL  
    DROP FUNCTION ufnDemSoNgayTietKiemDaHoanThanh;  
GO  
CREATE FUNCTION dbo.ufnDemSoNgayTietKiemDaHoanThanh(@tietKiemID int)  
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @soNgay int;  
    
    SELECT @soNgay = COUNT(*)
    FROM MucTieuTietKiem
    JOIN ChiTietTietKiem ON MucTieuTietKiem.Id = ChiTietTietKiem.MucTieuTietKiem_Id
    WHERE ChiTietTietKiem.TrangThai = 1

    IF (@soNgay IS NULL)   
        SET @soNgay = 0;  
    RETURN @soNgay;  
END; 
GO

IF OBJECT_ID (N'dbo.ufnDemSoNgayTietKiemChuaHoanThanh', N'FN') IS NOT NULL  
    DROP FUNCTION ufnDemSoNgayTietKiemChuaHoanThanh;  
GO  
CREATE FUNCTION dbo.ufnDemSoNgayTietKiemChuaHoanThanh(@tietKiemID int)  
RETURNS int   
AS   
-- Returns the stock level for the product.  
BEGIN  
    DECLARE @soNgay int;  
    
    SELECT @soNgay = COUNT(*)
    FROM MucTieuTietKiem
    JOIN ChiTietTietKiem ON MucTieuTietKiem.Id = ChiTietTietKiem.MucTieuTietKiem_Id
    WHERE ChiTietTietKiem.TrangThai = 0

    IF (@soNgay IS NULL)   
        SET @soNgay = 0;  
    RETURN @soNgay;  
END; 
GO

CREATE PROC usp_TietKiem_GetAllMucTieu
@IdNguoiDung INT
AS
BEGIN
    SELECT Id, TenMucTieu, TrangThai FROM MucTieuTietKiem
    WHERE NguoiDung_Id = @IdNguoiDung
END
GO

EXEC usp_TietKiem_GetAllMucTieu 1
GO

CREATE PROC usp_TietKiem_GetChiTietMucTieu
@Id INT
AS
BEGIN
    SELECT 
    Id,
    NguoiDung_Id,
    TenMucTieu,
    MoTa,
    SoTienCanTietKiem,
    SoTienDaTietKiemDuoc,
    NgayBD,
    NgayKT,
    TrangThai,
    LoaiTietKiem,
    CreatedAt,
    dbo.ufnDemSoNgayTietKiemDaHoanThanh(@Id) AS SoNgayDaTietKiem,
    dbo.ufnDemSoNgayTietKiemChuaHoanThanh(@Id) AS SoNgayTietKiemChuaHoanThanh
    FROM MucTieuTietKiem
    WHERE Id = @Id
END
GO

EXEC usp_TietKiem_GetChiTietMucTieu 1
GO
