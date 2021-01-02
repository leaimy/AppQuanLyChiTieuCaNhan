using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class ChiTietMucTieuDTO
	{
		public int Id { get; set; }
		public int IdNguoiDung { get; set; }
		public string TenMucTieu { get; set; }
		public string MoTa { get; set; }
		public decimal SoTienTietKiem { get; set; }
		public decimal SoTienDaTietKiem { get; set; }
		public DateTime NgayBD { get; set; }
		public DateTime NgayKT { get; set; }
		public bool TrangThai { get; set; }
		public string LoaiTietKiem { get; set; }
		public int SoNgayHoanThanh { get; set; }
		public int SoNgayChuaHoanThanh { get; set; }

		public ChiTietMucTieuDTO()
		{

		}

		public ChiTietMucTieuDTO(int id, int idNguoiDung, string tenMucTieu, string moTa, decimal soTienTietKiem, decimal soTienDaTietKiem, DateTime ngayBD, DateTime ngayKT, bool trangThai, string loaiTietKiem, int soNgayHoanThanh, int soNgayChuaHoanThanh)
		{
			Id = id;
			IdNguoiDung = idNguoiDung;
			TenMucTieu = tenMucTieu;
			MoTa = moTa;
			SoTienTietKiem = soTienTietKiem;
			SoTienDaTietKiem = soTienDaTietKiem;
			NgayBD = ngayBD;
			NgayKT = ngayKT;
			TrangThai = trangThai;
			LoaiTietKiem = loaiTietKiem;
			SoNgayHoanThanh = soNgayHoanThanh;
			SoNgayChuaHoanThanh = soNgayChuaHoanThanh;
		}

		public ChiTietMucTieuDTO(DataRow row)
		{
			Id = (int)row["Id"];
			IdNguoiDung = (int)row["NguoiDung_Id"];
			TenMucTieu = row["TenMucTieu"].ToString();
			MoTa = row["MoTa"].ToString();
			SoTienTietKiem = (decimal)row["SoTienCanTietKiem"];
			SoTienDaTietKiem = (decimal)row["SoTienDaTietKiemDuoc"];
			NgayBD = (DateTime)row["NgayBD"];
			NgayKT = (DateTime)row["NgayKT"];
			TrangThai = (bool)row["TrangThai"];
			LoaiTietKiem = row["LoaiTietKiem"].ToString();
			SoNgayHoanThanh = (int)row["SoNgayHoanThanh"];
			SoNgayChuaHoanThanh = (int)row["SoNgayChuaHoanThanh"];
		}
	}
}
