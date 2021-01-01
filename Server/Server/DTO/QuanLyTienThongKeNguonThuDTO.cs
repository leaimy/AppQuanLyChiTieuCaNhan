using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class QuanLyTienThongKeNguonThuDTO
  {
    public int QuanLyTienID { get; set; }
    public string Nhom { get; set; }
    public decimal SoTien { get; set; }

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
