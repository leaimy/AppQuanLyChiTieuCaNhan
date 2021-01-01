using Microsoft.AspNetCore.Mvc;
using Server.DAO;
using Server.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Server.Controllers
{
  [ApiController]
  [Route("api/quanlytien")]
  public class QuanLyTienController : ControllerBase
  {
    [HttpGet]
    public ActionResult<List<QuanLyTienDTO>> GetAllMucTieu()
    {
      string user_id = HttpContext.Request.Query["user_id"].ToString();
      if (String.IsNullOrWhiteSpace(user_id))
        return BadRequest();

      int userID = Convert.ToInt32(user_id);

      List<QuanLyTienDTO> dsTietKiem = QuanLyTienDAO.Instance.GetAllQuanLyTien(userID);

      return Ok(dsTietKiem);
    }

    [HttpGet("thongketongquan")]
    public ActionResult<QuanLyTienThongKeTongQuanDTO> ThongKeTongQuan()
    {
      string user_id = HttpContext.Request.Query["user_id"].ToString();
      if (String.IsNullOrWhiteSpace(user_id))
        return BadRequest();

      int userID = Convert.ToInt32(user_id);

      QuanLyTienThongKeTongQuanDTO thongKe = QuanLyTienDAO.Instance.ThongKeTongQuan(userID);

      return Ok(thongKe);
    }

    [HttpGet("thongkechitiet")]
    public ActionResult<QuanLyTienThongKeChiTietDTO> ThongKeChiTiet()
    {
      string quanLyTien_id = HttpContext.Request.Query["quanlytien_id"].ToString();
      if (String.IsNullOrWhiteSpace(quanLyTien_id))
        return BadRequest();

      int quanLyTienID = Convert.ToInt32(quanLyTien_id);

      QuanLyTienThongKeChiTietDTO thongKe = QuanLyTienDAO.Instance.ThongKeChiTiet(quanLyTienID);

      return Ok(thongKe);
    }

    [HttpGet("thongkenguonthu")]
    public ActionResult<List<QuanLyTienThongKeNguonThuDTO>> ThongKeNguonThuTongQuan()
    {
      string quanLyTien_id = HttpContext.Request.Query["quanlytien_id"].ToString();
      if (String.IsNullOrWhiteSpace(quanLyTien_id))
        return BadRequest();

      int quanLyTienID = Convert.ToInt32(quanLyTien_id);

      List<QuanLyTienThongKeNguonThuDTO> dsNguonThu = QuanLyTienDAO.Instance.ThongKeNguonThuTongQuan(quanLyTienID);

      return Ok(dsNguonThu);
    }

    [HttpGet("thongkekhoanchi")]
    public ActionResult<List<QuanLyTienThongKeKhoanChiDTO>> ThongKeKhoanChiTongQuan()
    {
      string quanLyTien_id = HttpContext.Request.Query["quanlytien_id"].ToString();
      if (String.IsNullOrWhiteSpace(quanLyTien_id))
        return BadRequest();

      int quanLyTienID = Convert.ToInt32(quanLyTien_id);

      List<QuanLyTienThongKeKhoanChiDTO> dsKhoanChi = QuanLyTienDAO.Instance.ThongKeCacKhoanChiTongQuan(quanLyTienID);

      return Ok(dsKhoanChi);
    }
  }
}
