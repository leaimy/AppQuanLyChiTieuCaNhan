using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Server.DTO
{
	public class CapNhatTrangThaiMucTieuDTO
	{
		public DateTime Date { get; set; }

		public CapNhatTrangThaiMucTieuDTO()
		{

		}

		public CapNhatTrangThaiMucTieuDTO(DateTime date)
		{
			Date = date;
		}
	}
}
