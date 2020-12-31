using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class QuanLyTienThongKeTongQuanDTO
  {
    public decimal TongSoTienDaQuanLy { get; set; }
    public decimal TongSoTienDaChiTieu { get; set; }
    public int TongSoKeHoachQuanLyDaHoanThanh { get; set; }

    public QuanLyTienThongKeTongQuanDTO(decimal tongSoTienDaQuanLy, decimal tongSoTienDaChiTieu, int tongSoKeHoachQuanLyDaHoanThanh)
    {
      TongSoTienDaQuanLy = tongSoTienDaQuanLy;
      TongSoTienDaChiTieu = tongSoTienDaChiTieu;
      TongSoKeHoachQuanLyDaHoanThanh = tongSoKeHoachQuanLyDaHoanThanh;
    }

    public QuanLyTienThongKeTongQuanDTO(DataRow row)
    {
      TongSoTienDaQuanLy = Convert.ToDecimal(row["TongSoTienDaQuanLy"].ToString());
      TongSoTienDaChiTieu = Convert.ToDecimal(row["TongSoTienDaChiTieu"].ToString());
      TongSoKeHoachQuanLyDaHoanThanh = Convert.ToInt32(row["TongSoKeHoachQuanLyDaHoanThanh"].ToString());
    }
  }
}
