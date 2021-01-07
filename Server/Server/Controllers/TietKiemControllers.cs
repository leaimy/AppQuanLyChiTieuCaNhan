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
	[Route("api/tietkiem")]
	public class TietKiemControllers : ControllerBase
	{
		[HttpGet]
		public ActionResult<List<MucTieuTietKiemDTO>> GetAllMucTieu()
		{
			string user_id = HttpContext.Request.Query["user_id"].ToString();
			if (String.IsNullOrWhiteSpace(user_id))
				return BadRequest();

			//Console.WriteLine(user_id);

			int userID = Convert.ToInt32(user_id);

			List<MucTieuTietKiemDTO> dsTietKiem = TietKiemDAO.Instance.GetAllMucTieu(userID);

			return Ok(dsTietKiem);
		}

		[HttpGet("thongketietkiem")]
		public ActionResult<ThongKeTietKiemDTO> ThongKeTongQuan()
		{
			string user_id = HttpContext.Request.Query["user_id"].ToString();
			if (String.IsNullOrWhiteSpace(user_id))
				return BadRequest();

			int userID = Convert.ToInt32(user_id);

			ThongKeTietKiemDTO thongKe = TietKiemDAO.Instance.ThongKeTietKiem(userID);

			return Ok(thongKe);
		}


		[HttpGet("chitietmuctieu")]
		public ActionResult<ChiTietMucTieuDTO> ChiTietMucTieu()
		{
			string id_muctieu = HttpContext.Request.Query["id_muctieu"].ToString();
			if (String.IsNullOrWhiteSpace(id_muctieu))
				return BadRequest();

			int idMucTieu = Convert.ToInt32(id_muctieu);

			ChiTietMucTieuDTO chiTietMucTieu = TietKiemDAO.Instance.GetChiTietMucTieu(idMucTieu);

			return Ok(chiTietMucTieu);
		}


		[HttpGet("chitietngay")]
		public ActionResult<List<ChiTietThoiGianTietKiemDTO>> ChiTietNgay()
		{
			string id_muctieu = HttpContext.Request.Query["id_muctieu"].ToString();
			if (String.IsNullOrWhiteSpace(id_muctieu))
				return BadRequest();

			int idMucTieu = Convert.ToInt32(id_muctieu);

			List<ChiTietThoiGianTietKiemDTO> dsNgay = TietKiemDAO.Instance.GetThoiGianTietKiem(idMucTieu);

			return Ok(dsNgay);
		}

		[HttpPost()]
		public ActionResult<string> ThemMucTieu(ThemMucTieuDTO mucTieuMoi)
		{
			bool ketQua = TietKiemDAO.Instance.ThemMucTieuTietKiem(mucTieuMoi);
			if (ketQua == false)
				return BadRequest("Thêm thất bại");
			return Ok("Thêm thành công");
		}

		[HttpPut("{id}")]
		public ActionResult<string> CapNhatTrangThai(int id, CapNhatTrangThaiMucTieuDTO capNhatTrangThaiMucTieu)
		{
			Console.WriteLine(id);

			bool ketQua = TietKiemDAO.Instance.CapNhatTrangThaiMucTieu(id, capNhatTrangThaiMucTieu.Date);

			if (ketQua == false)
				return BadRequest("Cập nhật không thành công");

			return Ok("Cập nhật thành công");
		}


	}
}






