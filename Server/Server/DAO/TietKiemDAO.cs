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

	}
}
