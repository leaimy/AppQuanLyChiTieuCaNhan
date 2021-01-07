﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class ChiTietThoiGianTietKiemDTO
	{
		public int Id { get; set; }
		public int IdMucTieu { get; set; }
		public bool TrangThai { get; set; }
		public decimal SoTien { get; set; }
		public DateTime NgayTietKiem { get; set; }

		public ChiTietThoiGianTietKiemDTO()
		{

		}

		public ChiTietThoiGianTietKiemDTO(int id, int idMucTieu, bool trangThai, decimal soTien, DateTime ngayTietKiem)
		{
			Id = id;
			IdMucTieu = idMucTieu;
			TrangThai = trangThai;
			SoTien = soTien;
			NgayTietKiem = ngayTietKiem;
		}

		public ChiTietThoiGianTietKiemDTO(DataRow row)
		{
			Id = (int)row["Id"];
			IdMucTieu = (int)row["MucTieuTietKiem_Id"];
			TrangThai = (bool)row["TrangThai"];
			SoTien = Convert.ToDecimal(row["SoTien"]);
			NgayTietKiem = DateTime.Parse(row["Ngay"].ToString());
		}
	}
}
