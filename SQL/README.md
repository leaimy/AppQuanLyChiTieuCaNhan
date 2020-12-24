# ỨNG DỤNG QUẢN LÝ CHI TIÊU VÀ TIẾT KIỆM

## Tác giả:

- Nguyễn Thị Hà

- Nguyễn Trọng Hiếu

## Mô tả Cơ sở dữ liệu

### 1. Quản lý người dùng

```sql
CREATE TABLE NguoiDung
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Email VARCHAR(100) NOT NULL,
    MatKhau VARCHAR(100) NOT NULL,
    TenHienThi NVARCHAR(100) NOT NULL,
    Avatar VARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
```

Lưu trữ thông tin về người sử dụng ứng dụng. Thông tin quản lý gồm có:

- Email: dùng để đăng nhập, gửi email reset mật khẩu trong trường hợp quên mật khẩu

- Mật khẩu dùng để đăng nhập ứng dụng

- Tên hiển thị do người dùng tự chọn để hiển thị bên trong ứng dụng

- Avatar là tên hình ảnh được người dùng sử dụng làm ảnh đại diện

## 2. Kế hoạch tiết kiệm

```sql
CREATE TABLE MucTieuTietKiem
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    NguoiDung_Id INT REFERENCES NguoiDung(Id),
    TenMucTieu NVARCHAR(200) NOT NULL,
    MoTa NVARCHAR(200),
    SoTienCanTietKiem DECIMAL NOT NULL,
    SoTienDaTietKiemDuoc DECIMAL NOT NULL,
    NgayBD DATETIME NOT NULL,
    NgayKT DATETIME NOT NULL,
    TrangThai BIT DEFAULT 0,
    LoaiTietKiem VARCHAR(50) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
)
```

Lưu trữ thông tin về kế hoạch tiết kiệm của người dùng. Người dùng lên kế hoạch tích trữ 1 số tiền để làm 1 công việc gì đó trong 1 khoảng thời gian nhất định. Trong khoảng thời gian lên kế hoạch, chương trình sẽ nhắc nhở người dùng phải bỏ heo, tiết kiệm tiền đều đặn hằng ngày hoặc hằng tuần đến khi kế hoạch kết thúc. Khi kế hoạch kết thúc, người dùng sẽ có đủ số tiền đã lên kế hoạch trước đó.

- Mỗi kế hoạch tiết kiệm sẽ gắn với 1 người dùng

- Tên kế hoạch tiết kiệm và mô tả do người dùng nhập vào

- Số tiền người dùng cần tiết kiệm và khoảng thời gian người dùng chọn để hoàn thành kế hoạch tiết kiệm

- Số tiền người dùng đã tiết kiệm được

- Trạng thái: cho biết kế hoạch tiết kiệm này đã hoàn thành hay chưa. Nếu vẫn đang trong thời gian của kế hoạch tiết kiệm thì trạng thái là 0. Ngược lại, khi kế hoạch đã hoàn thành thì trạng thái đặt là 1

- Người dùng tự chọn việc bỏ ống heo tiết kiệm, bỏ heo theo từng ngày hoặc dồn lại 1 tuần bỏ heo 1 lần

### 3. Chi tiết kế hoạch tiết kiệm

```sql

CREATE TABLE ChiTietTietKiem
(
     Id INT PRIMARY KEY IDENTITY(1,1),
     TietKiem_Id INT REFERENCES TietKiem(Id),
     TrangThai BIT DEFAULT 0,
     SoTien DECIMAL,
     Ngay DATETIME
)
```

Bảng chi tiết kế hoạch tiết kiệm, giúp người dùng theo dõi trạng thái kế hoạch tiết kiệm của bản thân. Lưu trữ thông tin về ngày bỏ ống heo tiết kiệm,  số tiền tiết kiệm của mỗi lần và trạng thái cho biết ngày đó người dùng đã bỏ heo tiết kiệm hay chưa. 

Khi 1 kế hoạch tiết kiệm được tạo ra, chương trình sẽ tự động tạo 1 danh sách các chi tiết tiết tiệm, mặc định đặt trạng thái bằng 0. Đồng thời, căn cứ theo kế hoạch tiết kiệm theo ngày hoặc theo tuần mà chương trình tự động chia đều số tiền để chèn vào và chèn ngày tương ứng để nhắc nhở người dùng bỏ ống heo.


