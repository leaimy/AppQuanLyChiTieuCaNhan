using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class QuanLyTienThongKeChiTietDTO
  {
    public decimal SoTienHienCo { get; set; }
    public decimal SoTienDaSuDung { get; set; }
    public decimal SoDu { get; set; }
    public DateTime NgayBD { get; set; }
    public DateTime NgayKT { get; set; }
    public int SoNgayConLai { get; set; }
    public decimal HanMucChiTieu { get; set; }
    public int SoNgayVuotMuc { get; set; }

    public QuanLyTienThongKeChiTietDTO()
    {

    }

    public QuanLyTienThongKeChiTietDTO(decimal soTienHienCo, decimal soTienDaSuDung, decimal soDu, DateTime ngayBD, DateTime ngayKT, int soNgayConLai, decimal hanMucChiTieu, int soNgayVuotMuc)
    {
      SoTienHienCo = soTienHienCo;
      SoTienDaSuDung = soTienDaSuDung;
      SoDu = soDu;
      NgayBD = ngayBD;
      NgayKT = ngayKT;
      SoNgayConLai = soNgayConLai;
      HanMucChiTieu = hanMucChiTieu;
      SoNgayVuotMuc = soNgayVuotMuc;
    }

    public QuanLyTienThongKeChiTietDTO(DataRow row)
    {
      SoTienHienCo = Convert.ToDecimal(row["SoTienHienCo"].ToString());
      SoTienDaSuDung = Convert.ToDecimal(row["SoTienDaSuDung"].ToString());
      SoDu = Convert.ToDecimal(row["SoDu"].ToString());
      NgayBD = DateTime.Parse(row["NgayBD"].ToString());
      NgayKT = DateTime.Parse(row["NgayKT"].ToString());
      SoNgayConLai = int.Parse(row["SoNgayConLai"].ToString());
      HanMucChiTieu = Convert.ToDecimal(row["HanMucChiTieu"].ToString());
      SoNgayVuotMuc = int.Parse(row["SoNgayVuotMuc"].ToString());
    }
  }
}
