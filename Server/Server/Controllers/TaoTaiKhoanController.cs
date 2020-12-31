using Microsoft.AspNetCore.Mvc;
using QuanLyChiTieuBackend.DAO;
using Server.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Server.Controllers
{
  [ApiController]
  [Route("api/taotaikhoan")]
  public class TaoTaiKhoanController : ControllerBase
  {
    [HttpPost]
    public ActionResult<TaoTaiKhoanDTO> SignIn(TaoTaiKhoanDTO nguoiDungMoi)
    {
      bool success = NguoiDungDAO.Instance.ThemNguoiDung(nguoiDungMoi);

      if (!success)
        return BadRequest();

      return Ok(NguoiDungDAO.Instance.LayNguoiDungBangTenDangNhap(nguoiDungMoi.TenDangNhap));
    }
  }
}
