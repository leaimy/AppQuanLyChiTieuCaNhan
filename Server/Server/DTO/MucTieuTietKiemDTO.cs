using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class MucTieuTietKiemDTO
	{
		public int Id { get; set; }
		public string TenMucTieu { get; set; }
		public bool TrangThai { get; set; }

		public MucTieuTietKiemDTO()
		{

		}

		public MucTieuTietKiemDTO(int id, string tenMucTieu, bool trangThai)
		{
			Id = id;
			TenMucTieu = tenMucTieu;
			TrangThai = trangThai;
		}

		public MucTieuTietKiemDTO(DataRow row)
		{
			Id = (int)row["Id"];
			TenMucTieu = row["TenMucTieu"].ToString();
			TrangThai = (bool)row["TrangThai"];
		}
	}
}
