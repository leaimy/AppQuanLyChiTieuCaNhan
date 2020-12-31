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
	}
}
