using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class ChiTietMucTieuDTO
  {
    public int Id { get; set; }
    public int IdNguoiDung { get; set; }
    public string TenMucTieu { get; set; }
    public string MoTa { get; set; }
    public decimal SoTienTietKiem { get; set; }
    public decimal SoTienDaTietKiem { get; set; }
    public DateTime NgayBD { get; set; }
    public DateTime NgayKT { get; set; }
    public bool TrangThai { get; set; }
    public int SoNgayHoanThanh { get; set; }
    public int SoNgayChuaHoanThanh { get; set; }
    public string LoaiTietKiem { get; set; }

    public ChiTietMucTieuDTO()
    {

    }

    public ChiTietMucTieuDTO(int id, int idNguoiDung, string tenMucTieu, string moTa, decimal soTienTietKiem, decimal soTienDaTietKiem, DateTime ngayBD, DateTime ngayKT, bool trangThai, string loaiTietKiem, int soNgayHoanThanh, int soNgayChuaHoanThanh)
    {
      Id = id;
      IdNguoiDung = idNguoiDung;
      TenMucTieu = tenMucTieu;
      MoTa = moTa;
      SoTienTietKiem = soTienTietKiem;
      SoTienDaTietKiem = soTienDaTietKiem;
      NgayBD = ngayBD;
      NgayKT = ngayKT;
      TrangThai = trangThai;
      LoaiTietKiem = loaiTietKiem;
      SoNgayHoanThanh = soNgayHoanThanh;
      SoNgayChuaHoanThanh = soNgayChuaHoanThanh;
    }

    public ChiTietMucTieuDTO(DataRow row)
    {
      Id = Convert.ToInt32(row["Id"].ToString());
      IdNguoiDung = Convert.ToInt32(row["NguoiDung_Id"].ToString());
      TenMucTieu = row["TenMucTieu"].ToString();
      MoTa = row["MoTa"].ToString();
      SoTienTietKiem = Convert.ToDecimal(row["SoTienCanTietKiem"].ToString());
      SoTienDaTietKiem = Convert.ToDecimal(row["SoTienDaTietKiemDuoc"].ToString());
      NgayBD = DateTime.Parse(row["NgayBD"].ToString());
      NgayKT = DateTime.Parse(row["NgayKT"].ToString());
      TrangThai = bool.Parse(row["TrangThai"].ToString());
      LoaiTietKiem = row["LoaiTietKiem"].ToString();
      SoNgayHoanThanh = Convert.ToInt32(row["SoNgayHoanThanh"].ToString());
      SoNgayChuaHoanThanh = Convert.ToInt32(row["SoNgayChuaHoanThanh"].ToString());
    }
  }
}
