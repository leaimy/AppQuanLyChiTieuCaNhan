using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
  public class QuanLyTienDTO
  {
    public int Id { get; set; }
    public DateTime NgayBD { get; set; }
    public DateTime NgayKT { get; set; }
    public bool TrangThai { get; set; }

    public QuanLyTienDTO()
    {

    }

    public QuanLyTienDTO(int id, DateTime ngayBD, DateTime ngayKT, bool trangThai)
    {
      Id = id;
      NgayBD = ngayBD;
      NgayKT = ngayKT;
      TrangThai = trangThai;
    }

    public QuanLyTienDTO(DataRow row)
    {
      Id = Convert.ToInt32(row["Id"]);
      NgayBD = DateTime.Parse(row["NgayBD"].ToString());
      NgayKT = DateTime.Parse(row["NgayKT"].ToString());
      TrangThai = Boolean.Parse(row["TrangThai"].ToString());
    }
  }
}
