using Microsoft.AspNetCore.Mvc;
using QuanLyChiTieuBackend.DAO;
using Server.DAO;
using Server.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Server.Controllers
{
	[ApiController]
	[Route("api/chitieu")]
	public class ChiTieuController : ControllerBase
	{
		[HttpGet]
		public ActionResult<List<ChiTieuDTO>> GetAllChiTieu()
		{
			string quanlytien_id = HttpContext.Request.Query["quanlytien_id"].ToString();
			if (String.IsNullOrWhiteSpace(quanlytien_id))
				return BadRequest();

			int quanLyTienId = Convert.ToInt32(quanlytien_id);

			List<ChiTieuDTO> dsChiTieu = ChiTieuDAO.Instance.LayDanhSachChiTieu(quanLyTienId);

			return Ok(dsChiTieu);
		}

		[HttpGet("chitiet")]
		public ActionResult<List<ChiTietChiTieuDTO>> GetAllChiTietChiTieu()
		{
			string chitieu_id = HttpContext.Request.Query["chitieu_id"].ToString();
			if (String.IsNullOrWhiteSpace(chitieu_id))
				return BadRequest();

			int chiTieuID = Convert.ToInt32(chitieu_id);

			List<ChiTietChiTieuDTO> dsChiTietChiTieu = ChiTieuDAO.Instance.LayDanhSachChiTietChiTieu(chiTieuID);

			return Ok(dsChiTietChiTieu);
		}

		[HttpPost()]
		public ActionResult<string> ThemChiTieu(ThemChiTieuDTO chiTieuMoi)
		{
			bool ketQua = ChiTieuDAO.Instance.ThemChiTieu(chiTieuMoi);
			if (ketQua == false)
				return BadRequest("Thêm thất bại");
			return Ok("Thêm thành công");
		}
	}
}
