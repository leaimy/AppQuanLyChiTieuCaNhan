using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class ThemMucTieuDTO
  {
    public int IdNguoiDung { get; set; }
    public string TenMucTieu { get; set; }
    public string MoTa { get; set; }
    public decimal SoTienTietKiem { get; set; }
    public DateTime NgayBD { get; set; }
    public DateTime NgayKT { get; set; }
    public String LoaiTietKiem { get; set; }

    public ThemMucTieuDTO()
    {

    }

    public ThemMucTieuDTO(int idNguoiDung, string tenMucTieu, string moTa, decimal soTienTietKiem, DateTime ngayBD, DateTime ngayKT, string loaiTietKiem)
    {
      IdNguoiDung = idNguoiDung;
      TenMucTieu = tenMucTieu;
      MoTa = moTa;
      SoTienTietKiem = soTienTietKiem;
      NgayBD = ngayBD;
      NgayKT = ngayKT;
      LoaiTietKiem = loaiTietKiem;
    }

    public ThemMucTieuDTO(DataRow row)
    {
      IdNguoiDung = Convert.ToInt32(row["NguoiDung_Id"].ToString());
      TenMucTieu = row["TenMucTieu"].ToString();
      MoTa = row["MoTa"].ToString();
      SoTienTietKiem = Convert.ToDecimal(row["SoTienCanTietKiem"].ToString());
      NgayBD = DateTime.Parse(row["NgayBD"].ToString());
      NgayKT = DateTime.Parse(row["NgayKT"].ToString());
      LoaiTietKiem = row["LoaiTietKiem"].ToString();
    }
  }
}
