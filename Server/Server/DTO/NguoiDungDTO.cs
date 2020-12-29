using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class NguoiDungDTO
	{
		public int Id { get; set; }
		public string Email { get; set; }
		public string MatKhau { get; set; }
		public string TenHienThi { get; set; }
		public string Avatar { get; set; }
		public DateTime CreatedAt { get; set; }

		public NguoiDungDTO()
		{

		}

		public NguoiDungDTO(int id, string email, string matKhau, string tenHienThi, string avatar, DateTime createdAt)
		{
			Id = id;
			Email = email;
			MatKhau = matKhau;
			TenHienThi = tenHienThi;
			Avatar = avatar;
			CreatedAt = createdAt;
		}

		public NguoiDungDTO(DataRow row)
		{
			Id = Convert.ToInt32(row["Id"]);
			Email = row["Email"].ToString();
			MatKhau = row["MatKhau"].ToString();
			TenHienThi = row["TenHienThi"].ToString();
			Avatar = row["Avatar"].ToString();
			CreatedAt = DateTime.Parse(row["CreatedAt"].ToString());
		}
	}
}


