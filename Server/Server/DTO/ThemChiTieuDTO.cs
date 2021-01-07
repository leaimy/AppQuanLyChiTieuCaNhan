using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class ThemChiTieuDTO
  {
    public string TenChiTieu { get; set; }
    public decimal SoTien { get; set; }
    public DateTime NgayChiTieu { get; set; }
    public string Nhom { get; set; }

    public ThemChiTieuDTO()
    {

    }

    public ThemChiTieuDTO(string tenChiTieu, decimal soTien, DateTime ngayChiTieu, string nhom)
    {
      TenChiTieu = tenChiTieu;
      SoTien = soTien;
      NgayChiTieu = ngayChiTieu;
      Nhom = nhom;
    }
  }
}
