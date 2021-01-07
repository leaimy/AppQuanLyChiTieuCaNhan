USE QuanLyChiTieuTietKiem
GO

-- SELECT *
-- FROM QuanLyTienHienCo
-- GO

/*
    LẤY DANH SÁCH TẤT CẢ CÁC KẾ HOẠCH QUẢN LÝ TIỀN HIỆN CÓ
*/
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

/*
    THỐNG KÊ TỔNG QUAN TẤT CẢ KẾ HOẠCH QUẢN LÝ TIỀN CỦA 1 NGƯỜI DÙNG
    CÁC TRƯỜNG THỐNG KÊ:
        - Tổng số tiền đã quản lý
        - Tổng số tiền đã chi tiêu
        - Tổng số kế hoạch đã hoàn thành
*/
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

/*
    THỐNG KÊ CHI TIẾT 1 KẾ HOẠCH QUẢN LÝ TIỀN
    CÁC TRƯỜNG THỐNG KÊ GỒM CÓ:
        - Số tiền hiện có
        - Số tiền đã sử dụng
        - Ngày bắt đầu
        - Ngày kết thúc
        - Số ngày vượt hạn mức chi tiêu
*/
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


/*
    - THỐNG KÊ TỔNG SỐ TIỀN THU THEO TỪNG NHÓM CỦA NGUỒN THU
    - VÍ DỤ:
        - Nguồn thu gia đình: Tổng số tiền 1.000.000
        - Nguồn thu công việc: Tổng số tiền 500.000
*/
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

/*
    THỐNG KÊ TỔNG SỐ TIỀN ĐÃ CHI THEO TỪNG NHÓM CỦA KHOẢN CHI
    - VÍ DỤ:
        - Nhóm chi tiêu thức ăn: Tổng số tiền đã chi 500.000
        - Nhóm chi tiêu bạn bè: Tổng số tiền đã chi: 300.000
*/
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

/*
    LẤY DANH SÁCH TẤT CẢ CÁC NGÀY CHI TIÊU CỦA 1 KẾ HOẠCH QUẢN LÝ TIỀN
*/
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

/*
    LẤY TẤT CẢ CÁC CHI TIẾT CHI TIÊU CỦA 1 NGÀY CHI TIÊU
*/
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


