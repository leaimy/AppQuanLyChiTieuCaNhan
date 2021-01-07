USE QuanLyChiTieuTietKiem
GO

/*
    LẤY DANH SÁCH TẤT CẢ NGƯỜI DÙNG TRONG CSDL
*/
CREATE PROC USP_NguoiDung_GetAll
AS
    SELECT * FROM NguoiDung
GO

-- EXEC USP_NguoiDung_GetAll

/*
    LẤY THÔNG TIN VỀ NGƯỜI DÙNG THÔNG QUA MÃ ĐỊNH DANH
*/
CREATE PROC USP_NguoiDung_GetById
@Id INT
AS
BEGIN
    SELECT * FROM NguoiDung WHERE Id = @Id
END
GO

-- EXEC USP_NguoiDung_GetById 1

/*
    THÊM MỚI 1 TÀI KHOẢN NGƯỜI DÙNG
*/
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

/*
    ĐĂNG NHẬP NGƯỜI DÙNG
*/
CREATE PROC usp_NguoiDung_Select
@TenDangNhap VARCHAR(100),
@MatKhau VARCHAR(100)
AS
BEGIN
    SELECT * FROM NguoiDung
    WHERE TenDangNhap = @TenDangNhap AND MatKhau = @MatKhau
END
GO

/*
    LẤY THÔNG TIN NGƯỜI DÙNG THÔNG QUA TÊN ĐĂNG NHẬP
*/
CREATE PROC usp_NguoiDung_GetByLoginName
@TenDangNhap VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM NguoiDung
    WHERE TenDangNhap = @TenDangNhap
END
GO