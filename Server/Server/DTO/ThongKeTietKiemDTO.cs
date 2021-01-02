using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class ThongKeTietKiemDTO
	{
		public int IdNguoiDung { get; set; }
		public decimal TongTienTietKiem { get; set; }
		public decimal TongTienDaTietKiem { get; set; }
		public int SoMTHoanThanh { get; set; }
		public int SoMTChuaHoanThanh { get; set; }

		public ThongKeTietKiemDTO()
		{

		}

		public ThongKeTietKiemDTO(int idNguoiDung, int tongTienTietKiem, int tongTienDaTietKiem, int soMTHoanThanh, int soMTChuaHoanThanh)
		{
			IdNguoiDung = idNguoiDung;
			TongTienTietKiem = tongTienTietKiem;
			TongTienDaTietKiem = tongTienDaTietKiem;
			SoMTHoanThanh = soMTHoanThanh;
			SoMTChuaHoanThanh = soMTChuaHoanThanh;
		}

		public ThongKeTietKiemDTO(DataRow row)
		{
			IdNguoiDung = (int)row["Id"];
			TongTienTietKiem = (decimal)row["SoTienCanTietKiem"];
			TongTienDaTietKiem = (decimal)row["SoTienDaTietKiemDuoc"];
			SoMTHoanThanh = (int)row["SoMucTieuHoanThanh"];
			SoMTChuaHoanThanh = (int)row["SoMucTieuChuaHoanThanh"];
		}
	}
}
