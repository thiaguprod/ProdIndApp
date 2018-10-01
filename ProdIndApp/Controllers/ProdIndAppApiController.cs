using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ProdIndApp.Models;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ProdIndApp.Controllers
{
    public class ProdIndAppApiController : Controller
    {
        [HttpPost]
        public ContentResult ProdIndAppData()
        {
            Dictionary<string, string> error = new Dictionary<string, string>();
            string RequestJSon = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
            string Response = "";
            try
            {
                Dictionary<string, object> data = JsonConvert.DeserializeObject<Dictionary<string, object>>(RequestJSon);
                if (data.ContainsKey("request"))
                {
                    JArray jsonArray = null;
                    try
                    {
                        jsonArray = JArray.Parse(data.First().Value.ToString());
                    }
                    catch (Exception ex)
                    {
                        error.Add("error", ex.Message);
                        Response = JsonConvert.SerializeObject(error, Formatting.Indented);
                        Response = "{ \"response\" : " + Response + "}";
                        return Content(Response, "application/json");
                    }
                    JArray array = new JArray();
                    string OutPut = "";
                    //Dictionary<string, JToken> output = new Dictionary<string, JToken>();
                    foreach (object json in jsonArray)
                    {
                        var aa = json.ToString();
                        JObject requestJsonObject = null;
                        try
                        {
                            requestJsonObject = JObject.Parse(aa);
                        }
                        catch (Exception ex)
                        {
                            error.Add("error", ex.Message);
                            Response = JsonConvert.SerializeObject(error, Formatting.Indented);
                            Response = "{ \"response\" : " + Response + "}";
                            return Content(Response, "application/json");
                        }
                        var module = requestJsonObject["ModuleId"];
                        string jsonValue = ProdApp.getSpResponse(aa);
                        JObject parsedJson = null;
                        try
                        {
                            parsedJson = JObject.Parse(jsonValue);
                        }
                        catch (Exception ex)
                        {
                            Dictionary<string, string> error2 = new Dictionary<string, string>();
                            error2.Add("error", ex.Message);
                            parsedJson = JObject.Parse(JsonConvert.SerializeObject(error2, Formatting.Indented));
                        }
                        OutPut += ("{\"" + module + "\" :" + jsonValue + "}");
                        if (!jsonArray.Last.Equals(json))
                        {
                            OutPut += ",";
                        }
                    }
                    Response = OutPut;
                    Response = "{ \"response\" : [" + Response + "]}";
                    return Content(Response, "application/json");
                }
                else
                {
                    Response = ProdApp.getSpResponse(RequestJSon);
                    Response = "{ \"response\" : " + Response + "}";
                    return Content(Response, "application/json");
                }
            }
            catch (Exception ex)
            {
                error.Add("error", ex.Message);
                Response = JsonConvert.SerializeObject(error, Formatting.Indented);
                return Content(Response, "application/json");
            }
            //Insert Request & Response
            finally
            {
                try
                {
                    string serverMode = ConfigurationManager.AppSettings["mode"].ToString();
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings[serverMode].ToString()))
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandTimeout = 1200;
                        cmd.CommandText = "Proc_Prod_Api_Log";
                        cmd.Parameters.AddWithValue("@JsonRequest", RequestJSon);
                        cmd.Parameters.AddWithValue("@JsonResponse", Response);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                catch { }
            }
        }

        // GET: ProdIndAppApi
        public ActionResult Index()
        {
            return View();
        }
    }
}