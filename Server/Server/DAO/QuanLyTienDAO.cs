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

    public QuanLyTienThongKeTongQuanDTO ThongKeTongQuan(int idNguoiDung)
    {
      string query = "EXEC usp_QuanLyTien_ThongKeTongQuan @IdNguoiDung";
      object[] param = new object[] { idNguoiDung };
      DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
      QuanLyTienThongKeTongQuanDTO thongKe = new QuanLyTienThongKeTongQuanDTO(0, 0, 0);

      if (data.Rows.Count > 0)
        thongKe = new QuanLyTienThongKeTongQuanDTO(data.Rows[0]);

      return thongKe;
    }

    public QuanLyTienThongKeChiTietDTO ThongKeChiTiet(int quanLyTienID)
    {
      string query = "EXECUTE dbo.usp_QuanLyTien_ThongKeChiTiet @QuanLyTienID";
      object[] param = new object[] { quanLyTienID };
      DataTable data = DataProvider.Instance.ExecuteQuery(query, param);
      QuanLyTienThongKeChiTietDTO thongKe = new QuanLyTienThongKeChiTietDTO();

      if (data.Rows.Count > 0)
        thongKe = new QuanLyTienThongKeChiTietDTO(data.Rows[0]);

      return thongKe;
    }

    public List<QuanLyTienThongKeNguonThuDTO> ThongKeNguonThuTongQuan(int quanLyTienID)
    {
      string query = "EXECUTE dbo.usp_ThongKeNguonThuTongQuan @QuanLyTienID";
      object[] param = new object[] { quanLyTienID };

      List<QuanLyTienThongKeNguonThuDTO> dsNguonThu = new List<QuanLyTienThongKeNguonThuDTO>();

      DataTable table = DataProvider.Instance.ExecuteQuery(query, param);
      foreach (DataRow row in table.Rows)
      {
        dsNguonThu.Add(new QuanLyTienThongKeNguonThuDTO(row));
      }

      return dsNguonThu;
    }

    public List<QuanLyTienThongKeKhoanChiDTO> ThongKeCacKhoanChiTongQuan(int quanLyTienID)
    {
      string query = "EXECUTE dbo.usp_ThongKeCacKhoanChiTongQuan @QuanLyTienID";
      object[] param = new object[] { quanLyTienID };

      List<QuanLyTienThongKeKhoanChiDTO> dsKhoanChi = new List<QuanLyTienThongKeKhoanChiDTO>();

      DataTable table = DataProvider.Instance.ExecuteQuery(query, param);
      foreach (DataRow row in table.Rows)
      {
        dsKhoanChi.Add(new QuanLyTienThongKeKhoanChiDTO(row));
      }

      return dsKhoanChi;
    }
  }
}
