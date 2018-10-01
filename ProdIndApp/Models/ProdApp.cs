using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ProdIndApp.Models
{
    public class ProdApp
    {
        public static string getSpResponse(string jsonValue)
        {
            string TempJSonId;
            string ModErrMessage;
            string ServerMode = ConfigurationManager.AppSettings["mode"].ToString();
            string ResponseJSon = "";
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings[ServerMode].ToString()))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 1200;
                    cmd.CommandText = "Proc_Prod_Json_Parsing";
                    cmd.Parameters.AddWithValue("@JSONRequestValue", jsonValue);
                    cmd.Parameters.Add("@TempJSONId", SqlDbType.NVarChar, -1);
                    cmd.Parameters["@TempJSONId"].Direction = ParameterDirection.Output;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    TempJSonId = cmd.Parameters["@TempJSONId"].Value.ToString();
                    if (!string.IsNullOrEmpty(TempJSonId))
                    {
                        SqlCommand getres = new SqlCommand();
                        getres.Connection = con;
                        getres.CommandType = CommandType.StoredProcedure;
                        getres.CommandTimeout = 1200;
                        getres.CommandText = "Proc_Prod_Get_Temp_JSon_Details";
                        getres.Parameters.AddWithValue("@JSonId", TempJSonId);
                        getres.Parameters.Add("@JSonResponse", SqlDbType.NVarChar, -1);
                        getres.Parameters["@JSonResponse"].Direction = ParameterDirection.Output;
                        getres.ExecuteNonQuery();
                        ResponseJSon = getres.Parameters["@JSonResponse"].Value.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                ModErrMessage = "getSpResponse fun-> " + ex.Message;
                try
                {
                    LogException(ModErrMessage);
                }
                catch { }

            }
            return ResponseJSon;
        }

        public static void LogException(string msg)
        {
            string ServerMode = ConfigurationManager.AppSettings["mode"].ToString();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings[ServerMode].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = "INSERT INTO Prod_Error_Log (ErrorCode,Description,SourceFile) VALUES (0,'" + msg.Replace("'", "").Replace("/", "").Replace("\"", "") + "',null)";
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }
}