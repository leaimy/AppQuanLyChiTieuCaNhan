USE QuanLyChiTieuTietKiem
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
    SELECT * FROM MucTieuTietKiem
    WHERE Id = @Id
END
GO

EXEC usp_TietKiem_GetChiTietMucTieu 1
GO