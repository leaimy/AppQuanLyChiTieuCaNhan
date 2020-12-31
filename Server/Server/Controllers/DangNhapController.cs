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
	[Route("api/dangnhap")]
	public class DangNhapController : ControllerBase
	{
		[HttpPost]
		public ActionResult<TaoTaiKhoanDTO> SignIn(NguoiDungDTO_Create nguoiDungDN)
		{
			TaoTaiKhoanDTO nguoidung = NguoiDungDAO.Instance.DangNhap(nguoiDungDN);
			if (nguoidung == null)
			{
				return BadRequest("Đăng nhập không thành công");
			}
			return Ok(nguoidung);
		}
	}
}
