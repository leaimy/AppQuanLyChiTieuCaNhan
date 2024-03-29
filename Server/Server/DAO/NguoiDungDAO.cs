﻿using Server.DAO;
using Server.DTO;
using System.Data;

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

		/// <summary>
		/// Tạo tài khoản mới
		/// </summary>
		/// <param name="nguoiDungMoi">truyền người dùng cần tạo vào</param>
		/// <returns>Thêm thành công trả về true còn không thành công trả về false</returns>
		public bool ThemNguoiDung(TaoTaiKhoanDTO nguoiDungMoi)
		{
			string query = "EXEC USP_NguoiDung_Insert @TenDangNhap , @MatKhau , @TenHienThi , @Avatar";
			object[] param = new object[]
			{
				nguoiDungMoi.TenDangNhap,
				nguoiDungMoi.MatKhau,
				nguoiDungMoi.TenHienThi,
				nguoiDungMoi.Avatar
			};

			int result = DataProvider.Instance.ExecuteNonQuery(query, param);
			return result > 0;
		}


		/// <summary>
		/// Đăng nhập tài khoản
		/// </summary>
		/// <param name="nguoiDung">truyền người dùng cần đăng nhập vào</param>
		/// <returns>Nếu đăng nhập không thành công thì trả về null còn đăng nhập thành công thì trả về một tài khoản</returns>
		public TaoTaiKhoanDTO DangNhap(DangNhapDTO nguoiDung)
		{
			string query = "EXEC usp_NguoiDung_Select @TenDangNhap , @MatKhau";
			object[] param = new object[] { nguoiDung.TenDangNhap, nguoiDung.MatKhau };
			DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
			if (data.Rows.Count == 0)
			{
				return null;
			}
			TaoTaiKhoanDTO nguoidung = new TaoTaiKhoanDTO(data.Rows[0]);
			return nguoidung;
		}

		/// <summary>
		/// Lấy 1 người dùng thông qua tên đăng nhập
		/// </summary>
		/// <param name="tenDangNhap">Tên đăng nhập</param>
		/// <returns>Người dùng tương ứng với tên đăng nhập</returns>
		public TaoTaiKhoanDTO LayNguoiDungBangTenDangNhap(string tenDangNhap)
		{
			string query = "EXEC usp_NguoiDung_GetByLoginName @TenDangNhap";
			object[] param = new object[] { tenDangNhap };

			DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
			if (data.Rows.Count == 0)
			{
				return null;
			}
			TaoTaiKhoanDTO nguoidung = new TaoTaiKhoanDTO(data.Rows[0]);
			return nguoidung;
		}
	}
}
