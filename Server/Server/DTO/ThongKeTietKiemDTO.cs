using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class ThongKeTietKiemDTO
  {
    public int IdNguoiDung { get; set; }
    public decimal TongTienTietKiem { get; set; }
    public decimal TongTienDaTietKiem { get; set; }
    public int SoMTHoanThanh { get; set; }
    public int SoMTChuaHoanThanh { get; set; }

    public ThongKeTietKiemDTO()
    {

    }

    public ThongKeTietKiemDTO(int idNguoiDung, int tongTienTietKiem, int tongTienDaTietKiem, int soMTHoanThanh, int soMTChuaHoanThanh)
    {
      IdNguoiDung = idNguoiDung;
      TongTienTietKiem = tongTienTietKiem;
      TongTienDaTietKiem = tongTienDaTietKiem;
      SoMTHoanThanh = soMTHoanThanh;
      SoMTChuaHoanThanh = soMTChuaHoanThanh;
    }

    public ThongKeTietKiemDTO(DataRow row)
    {
      IdNguoiDung = Convert.ToInt32(row["Id"].ToString());
      if (!string.IsNullOrWhiteSpace(row["SoTienCanTietKiem"].ToString()))
        TongTienTietKiem = Convert.ToDecimal(row["SoTienCanTietKiem"].ToString());

      if (!string.IsNullOrWhiteSpace(row["SoTienDaTietKiemDuoc"].ToString()))
        TongTienDaTietKiem = Convert.ToDecimal(row["SoTienDaTietKiemDuoc"].ToString());

      if (!string.IsNullOrWhiteSpace(row["SoMucTieuHoanThanh"].ToString()))
        SoMTHoanThanh = Convert.ToInt32(row["SoMucTieuHoanThanh"].ToString());

      if (!string.IsNullOrWhiteSpace(row["SoMucTieuChuaHoanThanh"].ToString()))
        SoMTChuaHoanThanh = Convert.ToInt32(row["SoMucTieuChuaHoanThanh"].ToString());
    }
  }
}
