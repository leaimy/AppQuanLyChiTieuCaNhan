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
			IdNguoiDung = Convert.ToInt32(row["Id"].ToString());
			TongTienTietKiem = Convert.ToDecimal(row["SoTienCanTietKiem"].ToString());
			TongTienDaTietKiem = Convert.ToDecimal(row["SoTienDaTietKiemDuoc"].ToString());
			SoMTHoanThanh = Convert.ToInt32(row["SoMucTieuHoanThanh"].ToString());
			SoMTChuaHoanThanh = Convert.ToInt32(row["SoMucTieuChuaHoanThanh"].ToString());
		}
	}
}
