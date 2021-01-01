using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class QuanLyTienThongKeNguonThuDTO
  {
    private string nhom;

    public int QuanLyTienID { get; set; }
    public decimal SoTien { get; set; }
    public string Nhom
    {
      get { return nhom.First().ToString().ToUpper() + nhom.Substring(1); }
      set { nhom = value.ToLower(); }
    }

    public QuanLyTienThongKeNguonThuDTO()
    {

    }

    public QuanLyTienThongKeNguonThuDTO(int quanLyTienID, string nhom, decimal soTien)
    {
      QuanLyTienID = quanLyTienID;
      Nhom = nhom;
      SoTien = soTien;
    }

    public QuanLyTienThongKeNguonThuDTO(DataRow row)
    {
      QuanLyTienID = Convert.ToInt32(row["Id"].ToString());
      Nhom = row["Nhom"].ToString();
      SoTien = Convert.ToDecimal(row["SoTien"].ToString());
    }
  }
}
