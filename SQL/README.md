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
);
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
);
```

Bảng chi tiết kế hoạch tiết kiệm, giúp người dùng theo dõi trạng thái kế hoạch tiết kiệm của bản thân. Lưu trữ thông tin về ngày bỏ ống heo tiết kiệm,  số tiền tiết kiệm của mỗi lần và trạng thái cho biết ngày đó người dùng đã bỏ heo tiết kiệm hay chưa. 

Khi 1 kế hoạch tiết kiệm được tạo ra, chương trình sẽ tự động tạo 1 danh sách các chi tiết tiết tiệm, mặc định đặt trạng thái bằng 0. Đồng thời, căn cứ theo kế hoạch tiết kiệm theo ngày hoặc theo tuần mà chương trình tự động chia đều số tiền để chèn vào và chèn ngày tương ứng để nhắc nhở người dùng bỏ ống heo.

### 4. Quản lý khoản thu

```sql
CREATE TABLE QuanLyKhoanThu 
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    NguoiDung_Id INT REFERENCES NguoiDung,
    SoTienHienCo DECIMAL NOT NULL DEFAULT 0,
    SoTienDaSuDung DECIMAL NOT NULL DEFAULT 0,
    NgayBD DATETIME NOT NULL,
    NgayKT DATETIME NOT NULL,
    TrangThai BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE()
);
```

Quản lý khoản thu của người dùng trong 1 thời gian nhất định. Trong khoảng thời gian này, chương trình sẽ tính ra hạn mức chi tiêu để sử dụng cho mỗi ngày. Người dùng dựa vào hạn mức chi tiêu để quyết định số tiền bỏ ra, nếu chi tiêu của ngày vượt hạn mức của ngày đó thì chương trình sẽ thông báo cho người dùng.

Trong khoảng thời gian quản lý khoản thu, người dùng có thể nhập thêm nguồn thu nhập khác vào, khoản tiền này sẽ được cộng dồn. Đồng thời, hạn mức chi tiêu theo ngày cũng sẽ được tăng lên tùy theo khoản thu nhập được cộng vào.

Với bảng này, người dùng sẽ biết được với khoản tiền trong thời gian nhất định, mình đã sử dụng hết bao nhiêu, còn lại bao nhiêu, có bao nhiêu ngày chi tiêu vượt quá hạn mức,...

### 5. Chi tiết khoản thu

```sql
CREATE TABLE ChiTietKhoanThu
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    ThuNhap_Id INT REFERENCES QuanLyKhoanThu(Id),
    Nhom VARCHAR(100) NOT NULL DEFAULT 'other',
    SoTien DECIMAL NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
```

Bảng theo dõi chi tiết các khoản thu trong 1 khoảng thời gian. Gồm có:

- Thuộc về nhóm nào

- Số tiền thu vào bao nhiêu

### 6. Chi tiêu

```sql
CREATE TABLE ChiTieu
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    ThuNhap_Id INT REFERENCES QuanLyKhoanThu(id),
    HanMucChiTieu DECIMAL NOT NULL,
    TongChi DECIMAL NOT NULL,
    Ngay DATETIME NOT NULL
);
```

Quản lý chi tiêu, giúp người dùng theo dõi các khoản chi theo từng ngày từ ngày bắt đầu đến ngày kết thúc của kế hoạch quản lý khoản thu.

- Khi 1 kế hoạch quản lý khoản thu được tạo ra, chương trình sẽ tự động tạo 1 danh sách chi tiêu từ ngày bắt đầu đến ngày kết thúc và gán ngày tương ứng vào thuộc tính "Ngay". 

- Hạn mức chi tiêu sẽ được tự động tính dựa trên Số tiền hiện có ở bảng quản lý khoản thu.

- Khi Số tiền hiện có ở bảng quản lý khoản thu được cập nhật, hạn mức chi tiêu cũng được cập nhật theo.

- Thuộc tính Tổng chi để theo dõi xem ngày hôm đó người dùng đã chi bao nhiêu tiền.

### 7. Chi tiết chi tiêu

```sql
CREATE TABLE ChiTietChiTieu 
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    ChiTieu_Id INT REFERENCES ChiTieu(Id),
    Ten NVARCHAR(200) NOT NULL,
    Nhom VARCHAR(100) NOT NULL DEFAULT 'other',
    SoTien DECIMAL NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
```

Theo dõi chi tiết chi tiêu của 1 ngày. Người dùng theo dõi và quản lý ngày hôm đó họ đã chi tiêu cho việc gì, số tiền chi tiêu cho việc đó là bao nhiêu và thuộc nhóm nào.

- Ten: mô tả ngắn về mục đích của việc chi tiêu

- Nhom: việc chi tiêu thuộc về nhóm nào

- SoTien: số tiền đã chi


