using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class ThemQuanLyTienDTO
	{
		public int IdNguoiDung { get; set; }
		public DateTime NgayBD { get; set; }
		public DateTime NgayKT { get; set; }

		public ThemQuanLyTienDTO()
		{

		}

		public ThemQuanLyTienDTO(int idNguoiDung, DateTime ngayBD, DateTime ngayKT)
		{
			IdNguoiDung = idNguoiDung;
			NgayBD = ngayBD;
			NgayKT = ngayKT;
		}

	}
}
