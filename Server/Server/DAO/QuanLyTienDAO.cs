using Server.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DAO
{
  public class QuanLyTienDAO
  {
    private static QuanLyTienDAO _instance;

    public static QuanLyTienDAO Instance
    {
      get
      {
        if (_instance == null)
        {
          _instance = new QuanLyTienDAO();
        }

        return _instance;
      }
    }

    private QuanLyTienDAO() { }

    public List<QuanLyTienDTO> GetAllQuanLyTien(int idNguoiDung)
    {
      string query = "EXEC usp_QuanLyTien_GetAllQuanLyTien @IdNguoiDung";
      object[] param = new object[] { idNguoiDung };
      DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
      List<QuanLyTienDTO> dsQuanLyTien = new List<QuanLyTienDTO>();
      foreach (DataRow row in data.Rows)
      {
        QuanLyTienDTO qlTien = new QuanLyTienDTO(row);
        dsQuanLyTien.Add(qlTien);
      }

      return dsQuanLyTien;
    }
  }
}
