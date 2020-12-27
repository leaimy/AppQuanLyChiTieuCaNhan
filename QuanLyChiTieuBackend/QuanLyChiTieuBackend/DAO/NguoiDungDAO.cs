using QuanLyChiTieuBackend.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QuanLyChiTieuBackend.DAO
{
	public class NguoiDungDAO
	{
		private static NguoiDungDAO _instance;

		public static NguoiDungDAO Instance
		{
			get
			{
				if (_instance == null)
				{
					_instance = new NguoiDungDAO();
				}
				return _instance;
			}
		}

		private NguoiDungDAO() { }

		public bool ThemNguoiDung(NguoiDungDTO nguoiDungMoi)
		{
			string query = "EXEC USP_NguoiDung_Insert @Email , @MatKhau , @TenHienThi , @Avatar";
			object[] param = new object[]
			{
				nguoiDungMoi.Email,
				nguoiDungMoi.MatKhau,
				nguoiDungMoi.TenHienThi,
				nguoiDungMoi.Avatar
			};

			int result = DataProvider.Instance.ExecuteNonQuery(query, param);
			return result > 0;
		}
	}
}
