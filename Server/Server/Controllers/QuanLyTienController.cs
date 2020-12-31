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

      //Console.WriteLine(user_id);

      int userID = Convert.ToInt32(user_id);

      List<QuanLyTienDTO> dsTietKiem = QuanLyTienDAO.Instance.GetAllQuanLyTien(userID);

      return Ok(dsTietKiem);
    }

    [HttpGet("thongketongquan")]
    public ActionResult<List<QuanLyTienDTO>> ThongKeTongQuan()
    {
      string user_id = HttpContext.Request.Query["user_id"].ToString();
      if (String.IsNullOrWhiteSpace(user_id))
        return BadRequest();

      //Console.WriteLine(user_id);

      int userID = Convert.ToInt32(user_id);

      QuanLyTienThongKeTongQuanDTO thongKe = QuanLyTienDAO.Instance.ThongKeTongQuanDTO(userID);

      return Ok(thongKe);
    }
  }
}
