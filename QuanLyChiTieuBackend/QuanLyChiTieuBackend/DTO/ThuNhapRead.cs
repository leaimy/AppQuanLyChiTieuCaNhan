using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QuanLyChiTieuBackend.DTOs
{
	public class ThuNhapRead
	{
		public int Id { get; set; }
		public int NguoiDung_Id { get; set; }
		public Decimal TongThu { get; set; }
		public DateTime NgayBD { get; set; }
		public DateTime NgayKT { get; set; }
		public bool TrangThai { get; set; }
		public decimal SoDu { get; set; }
		public DateTime DateCreated { get; set; }
		public Decimal TongChi { get; set; }

	}
}
