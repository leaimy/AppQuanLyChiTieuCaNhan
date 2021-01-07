using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class ThemMucTieuDTO
	{
		private string loaiTietKiem;

		public int IdNguoiDung { get; set; }
		public string TenMucTieu { get; set; }
		public string MoTa { get; set; }
		public decimal SoTienTietKiem { get; set; }
		public DateTime NgayBD { get; set; }
		public DateTime NgayKT { get; set; }

		public string LoaiTietKiem
		{
			get { return loaiTietKiem.First().ToString().ToUpper() + loaiTietKiem.Substring(1); }
			set { loaiTietKiem = value.ToLower(); }
		}

		public ThemMucTieuDTO()
		{

		}

		public ThemMucTieuDTO(int idNguoiDung, string tenMucTieu, string moTa, decimal soTienTietKiem, DateTime ngayBD, DateTime ngayKT, string loaiTietKiem)
		{
			IdNguoiDung = idNguoiDung;
			TenMucTieu = tenMucTieu;
			MoTa = moTa;
			SoTienTietKiem = soTienTietKiem;
			NgayBD = ngayBD;
			NgayKT = ngayKT;
			LoaiTietKiem = loaiTietKiem;
		}

		public ThemMucTieuDTO(DataRow row)
		{
			IdNguoiDung = (int)row["NguoiDung_Id"];
			TenMucTieu = row["TenMucTieu"].ToString();
			MoTa = row["MoTa"].ToString();
			SoTienTietKiem = (decimal)row["SoTienCanTietKiem"];
			NgayBD = (DateTime)row["NgayBD"];
			NgayKT = (DateTime)row["NgayKT"];
			LoaiTietKiem = row["LoaiTietKiem"].ToString();
		}


	}
}
