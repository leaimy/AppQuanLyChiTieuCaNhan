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

    public bool ThemChiTieu(ThemChiTieuDTO chiTieuDTO)
    {
      string query = "EXEC usp_ChiTieu_ThemChiTietChiTieu @Ten , @Nhom , @SoTien , @NgayChiTieu , @IdNguoiDung";
      object[] param = new object[] { chiTieuDTO.TenChiTieu, chiTieuDTO.Nhom, chiTieuDTO.SoTien, chiTieuDTO.NgayChiTieu, chiTieuDTO.IdNguoiDung };

      int row = DataProvider.Instance.ExecuteNonQuery(query, param);

      if (row > 0)
        return true;
      return false;
    }
  }
}
