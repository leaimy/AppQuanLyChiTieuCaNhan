USE QuanLyChiTieuTietKiem
GO

CREATE PROC USP_NguoiDung_GetAll
AS
    SELECT * FROM NguoiDung
GO

-- EXEC USP_NguoiDung_GetAll

CREATE PROC USP_NguoiDung_GetById
@Id INT
AS
BEGIN
    SELECT * FROM NguoiDung WHERE Id = @Id
END
GO

-- EXEC USP_NguoiDung_GetById 1

CREATE PROC USP_NguoiDung_Insert
@TenDangNhap VARCHAR(100),
@MatKhau VARCHAR(100),
@TenHienThi NVARCHAR(100),
@Avatar VARCHAR(100)
AS 
BEGIN
    IF (NOT EXISTS (SELECT * FROM NguoiDung WHERE TenDangNhap = @TenDangNhap))
        INSERT NguoiDung(TenDangNhap, MatKhau, TenHienThi, Avatar)
        VALUES (@TenDangNhap, @MatKhau, @TenHienThi, @Avatar)
END
GO

-- EXEC USP_NguoiDung_Insert 'hieuntctk422@gmail.com', 'nth', N'Trọng Hiếu', 'avatar'
-- DELETE FROM NguoiDung WHERE email = 'hieuntctk422@gmail.com'

CREATE PROC usp_NguoiDung_Select
@TenDangNhap VARCHAR(100),
@MatKhau VARCHAR(100)
AS
BEGIN
    SELECT * FROM NguoiDung
    WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau
END
GO

CREATE PROC usp_NguoiDung_GetByLoginName
@TenDangNhap VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM NguoiDung
    WHERE TenDangNhap = @TenDangNhap
END
GO