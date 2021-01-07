using Server.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DAO
{
	public class TietKiemDAO
	{
		private static TietKiemDAO _instance;

		public static TietKiemDAO Instance
		{
			get
			{
				if (_instance == null)
				{
					_instance = new TietKiemDAO();
				}

				return _instance;
			}
		}

		private TietKiemDAO() { }

		public ThongKeTietKiemDTO ThongKeTietKiem(int idNguoiDung)
		{
			string query = "EXEC usp_TietKiem_ThongKeTietKiem @IdNguoiDung";
			object[] param = new object[] { idNguoiDung };
			DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
			if (data.Rows.Count>0)
			{
				return new ThongKeTietKiemDTO(data.Rows[0]);
			}
			return new ThongKeTietKiemDTO();
		}

		public List<MucTieuTietKiemDTO> GetAllMucTieu(int idNguoiDung)
		{
			string query = "EXEC usp_TietKiem_GetAllMucTieu @IdNguoiDung";
			object[] param = new object[] { idNguoiDung };
			DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
			List<MucTieuTietKiemDTO> dsMucTieu = new List<MucTieuTietKiemDTO>();
			foreach (DataRow row in data.Rows)
			{
				MucTieuTietKiemDTO muctieu = new MucTieuTietKiemDTO(row);
				dsMucTieu.Add(muctieu);
			}

			return dsMucTieu;
		}

		public ChiTietMucTieuDTO GetChiTietMucTieu(int idMucTieu)
		{
			string query = "EXECUTE dbo.usp_TietKiem_GetChiTietMucTieu @Id";
			object[] param = new object[] { idMucTieu };
			DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
			if (data.Rows.Count>0)
			{
				return new ChiTietMucTieuDTO(data.Rows[0]);
			}
			return new ChiTietMucTieuDTO();
		}

		public List<ChiTietThoiGianTietKiemDTO> GetThoiGianTietKiem(int idMucTieu)
		{
			string query = "EXEC usp_TietKiem_GetTime @IdMucTieu";
			object[] param = new object[]{ idMucTieu};

			DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
			List<ChiTietThoiGianTietKiemDTO> dates = new List<ChiTietThoiGianTietKiemDTO>();

			foreach (DataRow row in data.Rows)
			{
				ChiTietThoiGianTietKiemDTO date = new ChiTietThoiGianTietKiemDTO(row);

				dates.Add(date);
			}

			return dates;
		}

		public bool ThemMucTieuTietKiem(ThemMucTieuDTO themMucTieuDTO)
		{
			string query = string.Format("EXEC usp_TietKiem_ThemMucTieuTietKiem @TenMucTieu , @MoTa , @SoTienTietKiem , @NgayBD , @NgayKT , @LoaiTietKiem , @idNguoiDung");
			object[] param = new object[] {themMucTieuDTO.TenMucTieu,themMucTieuDTO.MoTa,themMucTieuDTO.SoTienTietKiem,themMucTieuDTO.NgayBD, themMucTieuDTO.NgayKT,themMucTieuDTO.LoaiTietKiem,themMucTieuDTO.IdNguoiDung};
			int row = DataProvider.Instance.ExecuteNonQuery(query, param);

			if (row > 0)
				return true;
			return false;
		}

		public bool CapNhatTrangThaiMucTieu(int idMucTieu, DateTime ngay)
		{
			string query = string.Format("EXEC usp_TietKiem_CapNhatTrangThaiMucTieu @idMucTieu , @Date");
			object[] param = new object[] { idMucTieu, ngay };
			int row = DataProvider.Instance.ExecuteNonQuery(query, param);

			if (row > 0)
				return true;
			return false;
		}

	}
}
