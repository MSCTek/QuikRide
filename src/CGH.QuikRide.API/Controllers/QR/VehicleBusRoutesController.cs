// <auto-generated> - Template:WebApiController, Version:1.1, Id:4b60314b-c212-46e3-8945-3d5daecee905
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Routing;
using Marvin.JsonPatch;
using cghEnums = CodeGenHero.Repository.Enums;
using CodeGenHero.DataService;
using CodeGenHero.Logging;
using CodeGenHero.Repository;
using CodeGenHero.Repository.AutoMapper;
using CodeGenHero.WebApi;
using CGH.QuikRide.Repository.Interface;
using dtoQR = CGH.QuikRide.DTO.QR;
using entQR = CGH.QuikRide.Repository.Entities.QR;

namespace CGH.QuikRide.API.Controllers.QR
{
	public partial class VehicleBusRoutesQRController : QRBaseApiController
	{
			private const string GET_LIST_ROUTE_NAME = "VehicleBusRoutesQRList";
			private const int maxPageSize = 100;

			private GenericFactory<entQR.VehicleBusRoute, dtoQR.VehicleBusRoute> _factory 
				= new GenericFactory<entQR.VehicleBusRoute, dtoQR.VehicleBusRoute>();

		public VehicleBusRoutesQRController() : base()
		{
		}

		public VehicleBusRoutesQRController(ILoggingService log, IQRRepository repository)
		: base(log, repository)
		{
		}

		[HttpDelete]
		[VersionedRoute(template: "VehicleBusRoutes/{vehicleId}/{busRouteId}", allowedVersion: 1)]
		public async Task<IHttpActionResult> Delete(int vehicleId, int busRouteId)
		{
			try
			{
				if (!base.OnActionExecuting(out HttpStatusCode httpStatusCode, out string message)) { return Content(httpStatusCode, message); }

				var result = await Repo.Delete_VehicleBusRouteAsync(vehicleId, busRouteId);

				if (result.Status == cghEnums.RepositoryActionStatus.Deleted)
				{
					return StatusCode(HttpStatusCode.NoContent);
				}
				else if (result.Status == cghEnums.RepositoryActionStatus.NotFound)
				{
					return NotFound();
				}

				Warn("Unable to delete object via Web API", LogMessageType.Instance.Warn_WebApi, result.Exception, httpResponseStatusCode: 400, url: Request.RequestUri.ToString());
				return BadRequest();
			}
			catch (Exception ex)
			{
				Error(message: ex.Message, logMessageType: LogMessageType.Instance.Exception_WebApi, ex: ex);

				if (System.Diagnostics.Debugger.IsAttached)
					System.Diagnostics.Debugger.Break();

				return InternalServerError();
			}
		}

		[HttpGet]
		[VersionedRoute(template: "VehicleBusRoutes", allowedVersion: 1, Name = GET_LIST_ROUTE_NAME)]
		public async Task<IHttpActionResult> Get(string sort = null,
		string fields = null, string filter = null, int page = 1, int pageSize = maxPageSize)
		{
			try
			{
				if (!base.OnActionExecuting(out HttpStatusCode httpStatusCode, out string message)) { return Content(httpStatusCode, message); }

				var fieldList = GetListByDelimiter(fields);
				bool childrenRequested = false; // TODO: set this based upon actual fields requested.

				var filterList = GetListByDelimiter(filter);
				var dbItems = Repo.GetQueryable_VehicleBusRoute().AsNoTracking();
				RunCustomLogicAfterGetQueryableList(ref dbItems, ref filterList);
				dbItems = dbItems.ApplyFilter(filterList);
				dbItems = dbItems.ApplySort(sort ?? (typeof(entQR.VehicleBusRoute).GetProperties(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance)).First().Name);

				if (pageSize > maxPageSize)
				{ // ensure the page size isn't larger than the maximum.
					pageSize = maxPageSize;
				}

				var urlHelper = new UrlHelper(Request);
				PageData paginationHeader = BuildPaginationHeader(urlHelper, GET_LIST_ROUTE_NAME, page: page, totalCount: dbItems.Count(), pageSize: pageSize, sort: sort);
				HttpContext.Current.Response.Headers.Add("X-Pagination", Newtonsoft.Json.JsonConvert.SerializeObject(paginationHeader));

				// return result
				return Ok(dbItems
				.Skip(pageSize * (page - 1))
				.Take(pageSize)
				.ToList()
				.Select(x => _factory.CreateDataShapedObject(x, fieldList, childrenRequested)));
			}
			catch (Exception ex)
			{
				Error(message: ex.Message, logMessageType: LogMessageType.Instance.Exception_WebApi, ex: ex);

				if (System.Diagnostics.Debugger.IsAttached)
					System.Diagnostics.Debugger.Break();

				return InternalServerError();
			}
		}

		[HttpGet]
		[VersionedRoute(template: "VehicleBusRoutes/{vehicleId}/{busRouteId}/{numChildLevels:int=0}", allowedVersion: 1)]
		public async Task<IHttpActionResult> Get(int vehicleId, int busRouteId, int numChildLevels)
		{
			try
			{
				if (!base.OnActionExecuting(out HttpStatusCode httpStatusCode, out string message)) { return Content(httpStatusCode, message); }
				var dbItem = await Repo.Get_VehicleBusRouteAsync(vehicleId, busRouteId, numChildLevels);

				if (dbItem == null)
				{
					Warn("Unable to get object via Web API", LogMessageType.Instance.Warn_WebApi, httpResponseStatusCode: 404, url: Request.RequestUri.ToString());
					return NotFound();
				}

				RunCustomLogicOnGetEntityByPK(ref dbItem, vehicleId, busRouteId, numChildLevels);
				return Ok(_factory.Create(dbItem));
			}
			catch (Exception ex)
			{
				Error(message: ex.Message, logMessageType: LogMessageType.Instance.Exception_WebApi, ex: ex);

				if (System.Diagnostics.Debugger.IsAttached)
					System.Diagnostics.Debugger.Break();

				return InternalServerError();
			}
		}

		[HttpPatch]
		[VersionedRoute(template: "VehicleBusRoutes/{vehicleId}/{busRouteId}", allowedVersion: 1)]
		public async Task<IHttpActionResult> Patch(int vehicleId, int busRouteId, [FromBody] JsonPatchDocument<dtoQR.VehicleBusRoute> patchDocument)
		{
			try
			{
				if (!base.OnActionExecuting(out HttpStatusCode httpStatusCode, out string message)) { return Content(httpStatusCode, message); }

				if (patchDocument == null)
				{
					return BadRequest();
				}

				var dbItem = await Repo.Get_VehicleBusRouteAsync(vehicleId, busRouteId, numChildLevels: 0);
				if (dbItem == null)
				{
					return NotFound();
				}

				var dtoItem = _factory.Create(dbItem); // map

				// apply changes to the DTO
				patchDocument.ApplyTo(dtoItem);
				dtoItem.VehicleId = vehicleId;
				dtoItem.BusRouteId = busRouteId;

				// map the DTO with applied changes to the entity, & update
				var updatedDBItem = _factory.Create(dtoItem); // map
				var result = await Repo.UpdateAsync(updatedDBItem);
				RunCustomLogicAfterUpdatePatch(ref updatedDBItem, ref result);

				if (result.Status == cghEnums.RepositoryActionStatus.Updated)
				{
					// map to dto
					var patchedDTOItem = _factory.Create(result.Entity);
					return Ok(patchedDTOItem);
				}

				Warn("Unable to patch object via Web API", LogMessageType.Instance.Warn_WebApi, result.Exception, httpResponseStatusCode: 400, url: Request.RequestUri.ToString());
				return BadRequest();
			}
			catch (Exception ex)
			{
				Error(message: ex.Message, logMessageType: LogMessageType.Instance.Exception_WebApi, ex: ex);

				if (System.Diagnostics.Debugger.IsAttached)
					System.Diagnostics.Debugger.Break();

				return InternalServerError();
			}
		}

		[HttpPost]
		[VersionedRoute(template: "VehicleBusRoutes", allowedVersion: 1)]
		public async Task<IHttpActionResult> Post([FromBody] dtoQR.VehicleBusRoute dtoItem)
		{
			try
			{
				if (!base.OnActionExecuting(out HttpStatusCode httpStatusCode, out string message)) { return Content(httpStatusCode, message); }

				if (dtoItem == null)
				{
					return BadRequest();
				}

				// try mapping & saving
				var newDBItem = _factory.Create(dtoItem);

				var result = await Repo.InsertAsync(newDBItem);
				RunCustomLogicAfterInsert(ref newDBItem, ref result);

				if (result.Status == cghEnums.RepositoryActionStatus.Created)
				{   // map to dto
					var newDTOItem = _factory.Create(result.Entity);
					var uriFormatted = Request.RequestUri.ToString().EndsWith("/") == true ? Request.RequestUri.ToString().Substring(0, Request.RequestUri.ToString().Length - 1) : Request.RequestUri.ToString();
					return Created($"{uriFormatted}/{newDTOItem.VehicleId}/{newDTOItem.BusRouteId}", newDTOItem);
				}

				Warn("Unable to create object via Web API", LogMessageType.Instance.Warn_WebApi, result.Exception, httpResponseStatusCode: 400, url: Request.RequestUri.ToString());
				return BadRequest();
			}
			catch (Exception ex)
			{
				Error(message: ex.Message, logMessageType: LogMessageType.Instance.Exception_WebApi, ex: ex);

				if (System.Diagnostics.Debugger.IsAttached)
					System.Diagnostics.Debugger.Break();

				return InternalServerError();
			}
		}

		[HttpPut]
		[VersionedRoute(template: "VehicleBusRoutes/{vehicleId}/{busRouteId}", allowedVersion: 1)]
		public async Task<IHttpActionResult> Put(int vehicleId, int busRouteId, [FromBody] dtoQR.VehicleBusRoute dtoItem)
		{
			try
			{
				if (!base.OnActionExecuting(out HttpStatusCode httpStatusCode, out string message)) { return Content(httpStatusCode, message); }

				if (dtoItem == null)
				{
					return BadRequest();
				}

				dtoItem.VehicleId = vehicleId;
				dtoItem.BusRouteId = busRouteId;

				var updatedDBItem = _factory.Create(dtoItem); // map
				var result = await Repo.UpdateAsync(updatedDBItem);
				RunCustomLogicAfterUpdatePut(ref updatedDBItem, ref result);

				if (result.Status == cghEnums.RepositoryActionStatus.Updated)
				{
					// map to dto
					var updatedDTOItem = _factory.Create(result.Entity);
					return Ok(updatedDTOItem);
				}
				else if (result.Status == cghEnums.RepositoryActionStatus.NotFound)
				{
					return NotFound();
				}

				Warn("Unable to update object via Web API", LogMessageType.Instance.Warn_WebApi, result.Exception, httpResponseStatusCode: 400, url: Request.RequestUri.ToString());
				return BadRequest();
			}
			catch (Exception ex)
			{
				Error(message: ex.Message, logMessageType: LogMessageType.Instance.Exception_WebApi, ex: ex);

				if (System.Diagnostics.Debugger.IsAttached)
					System.Diagnostics.Debugger.Break();

				return InternalServerError();
			}
		}

		partial void RunCustomLogicAfterInsert(ref CGH.QuikRide.Repository.Entities.QR.VehicleBusRoute newDBItem, ref IRepositoryActionResult<entQR.VehicleBusRoute> result);

		partial void RunCustomLogicAfterUpdatePatch(ref CGH.QuikRide.Repository.Entities.QR.VehicleBusRoute updatedDBItem, ref IRepositoryActionResult<entQR.VehicleBusRoute> result);

		partial void RunCustomLogicAfterUpdatePut(ref CGH.QuikRide.Repository.Entities.QR.VehicleBusRoute updatedDBItem, ref IRepositoryActionResult<entQR.VehicleBusRoute> result);

		partial void RunCustomLogicOnGetEntityByPK(ref entQR.VehicleBusRoute dbItem, int vehicleId, int busRouteId, int numChildLevels);

		partial void RunCustomLogicAfterGetQueryableList(ref IQueryable<entQR.VehicleBusRoute> dbItems, ref List<string> filterList);
	}
}