using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class TaoTaiKhoanDTO
	{
		public int Id { get; set; }
		public string TenDangNhap { get; set; }
		public string MatKhau { get; set; }
		public string TenHienThi { get; set; }
		public string Avatar { get; set; }
		public DateTime CreatedAt { get; set; }

		public TaoTaiKhoanDTO()
		{

		}

		public TaoTaiKhoanDTO(int id, string tenDangNhap, string matKhau, string tenHienThi, string avatar, DateTime createdAt)
		{
			Id = id;
			TenDangNhap = tenDangNhap;
			MatKhau = matKhau;
			TenHienThi = tenHienThi;
			Avatar = avatar;
			CreatedAt = createdAt;
		}

		public TaoTaiKhoanDTO(DataRow row)
		{
			Id = Convert.ToInt32(row["Id"]);
			TenDangNhap = row["TenDangNhap"].ToString();
			MatKhau = row["MatKhau"].ToString();
			TenHienThi = row["TenHienThi"].ToString();
			Avatar = row["Avatar"].ToString();
			CreatedAt = DateTime.Parse(row["CreatedAt"].ToString());
		}
	}
}


