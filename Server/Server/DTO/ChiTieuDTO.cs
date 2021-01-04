using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class ChiTieuDTO
  {
    public int Id { get; set; }
    public int QuanLyTienHienCoId { get; set; }
    public decimal TongChi { get; set; }
    public DateTime Ngay { get; set; }

    public ChiTieuDTO()
    {

    }

    public ChiTieuDTO(int id, int quanLyTienHienCo_Id, decimal tongChi, DateTime ngay)
    {
      Id = id;
      QuanLyTienHienCoId = quanLyTienHienCo_Id;
      TongChi = tongChi;
      Ngay = ngay;
    }

    public ChiTieuDTO(DataRow row)
    {
      Id = Convert.ToInt32(row["Id"].ToString());
      QuanLyTienHienCoId = Convert.ToInt32(row["QuanLyTienHienCo_Id"].ToString());
      TongChi = Convert.ToDecimal(row["TongChi"].ToString());
      Ngay = DateTime.Parse(row["Ngay"].ToString());
    }
  }
}
