using Server.DAO;
using Server.DTO;
using System.Collections.Generic;
using System.Data;

namespace QuanLyChiTieuBackend.DAO
{
  public class ChiTieuDAO
  {
    private static ChiTieuDAO _instance;

    public static ChiTieuDAO Instance
    {
      get
      {
        if (_instance == null)
        {
          _instance = new ChiTieuDAO();
        }
        return _instance;
      }
    }

    private ChiTieuDAO() { }

    public List<ChiTieuDTO> LayDanhSachChiTieu(int quanLyTienID)
    {
      List<ChiTieuDTO> dsChiTieu = new List<ChiTieuDTO>();

      string query = "EXECUTE dbo.usp_QuanLyTien_LayTatCaChiTieu @QuanLyTienID";
      object[] param = new object[] { quanLyTienID };

      DataTable table = DataProvider.Instance.ExecuteQuery(query, param);

      foreach (DataRow row in table.Rows)
      {
        dsChiTieu.Add(new ChiTieuDTO(row));
      }

      return dsChiTieu;
    }

    public List<ChiTietChiTieuDTO> LayDanhSachChiTietChiTieu(int chiTieuID)
    {
      List<ChiTietChiTieuDTO> dsChiTietChiTieu = new List<ChiTietChiTieuDTO>();

      string query = "EXECUTE dbo.usp_ChiTieu_LayTatCaChiTietChiTieu @ChiTieuID";
      object[] param = new object[] { chiTieuID };

      DataTable table = DataProvider.Instance.ExecuteQuery(query, param);

      foreach (DataRow row in table.Rows)
      {
        dsChiTietChiTieu.Add(new ChiTietChiTieuDTO(row));
      }

      return dsChiTietChiTieu;
    }
  }
}
