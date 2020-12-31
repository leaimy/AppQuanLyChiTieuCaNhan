﻿using Server.DTO;
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
	}
}
