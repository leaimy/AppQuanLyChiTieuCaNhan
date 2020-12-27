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

CREATE PROC USP_NguoiDung_GetByEmail
@Email VARCHAR(100)
AS
BEGIN
    SELECT * FROM NguoiDung WHERE Email = @Email
END
GO

-- EXEC USP_NguoiDung_GetByEmail 'hantctk42@gmail.com'

/*
1),
    Email VARCHAR(100) NOT NULL UNIQUE,
    MatKhau VARCHAR(100) NOT NULL,
    TenHienThi NVARCHAR(100) NOT NULL,
    Avatar VARCHAR(100) NOT NULL,
*/

CREATE PROC USP_NguoiDung_Insert
@Email VARCHAR(100),
@MatKhau VARCHAR(100),
@TenHienThi NVARCHAR(100),
@Avatar VARCHAR(100)
AS 
BEGIN
    IF (NOT EXISTS (SELECT * FROM NguoiDung WHERE Email = @Email))
        INSERT NguoiDung(Email, MatKhau, TenHienThi, Avatar)
        VALUES (@Email, @MatKhau, @TenHienThi, @Avatar)
END
GO

-- EXEC USP_NguoiDung_Insert 'hieuntctk422@gmail.com', 'nth', N'Trọng Hiếu', 'avatar'
-- DELETE FROM NguoiDung WHERE email = 'hieuntctk422@gmail.com'
