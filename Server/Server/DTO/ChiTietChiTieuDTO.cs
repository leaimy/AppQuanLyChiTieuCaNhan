using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class ChiTietChiTieuDTO
  {
    public int Id { get; set; }
    public int ChiTieuId { get; set; }
    public string Ten { get; set; }
    public string Nhom { get; set; }
    public decimal SoTien { get; set; }
    public DateTime CreatedAt { get; set; }

    public ChiTietChiTieuDTO()
    {

    }

    public ChiTietChiTieuDTO(int id, int chiTieuId, string ten, string nhom, decimal soTien, DateTime createdAt)
    {
      Id = id;
      ChiTieuId = chiTieuId;
      Ten = ten;
      Nhom = nhom;
      SoTien = soTien;
      CreatedAt = createdAt;
    }

    public ChiTietChiTieuDTO(DataRow row)
    {
      Id = Convert.ToInt32(row["Id"].ToString());
      ChiTieuId = Convert.ToInt32(row["ChiTieu_Id"].ToString());
      Ten = row["Ten"].ToString();
      Nhom = row["Nhom"].ToString();
      SoTien = Convert.ToDecimal(row["SoTien"].ToString());
      CreatedAt = DateTime.Parse(row["CreatedAt"].ToString());
    }
  }
}
