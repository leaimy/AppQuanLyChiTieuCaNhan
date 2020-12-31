USE QuanLyChiTieuTietKiem
GO

SELECT *
FROM QuanLyTienHienCo
GO

CREATE PROC usp_QuanLyTien_GetAllQuanLyTien
@IdNguoiDung INT
AS
BEGIN
    SELECT Id, NgayBD, NgayKT, TrangThai FROM QuanLyTienHienCo
    WHERE NguoiDung_Id = @IdNguoiDung
END
GO

EXEC usp_QuanLyTien_GetAllQuanLyTien 2
GO