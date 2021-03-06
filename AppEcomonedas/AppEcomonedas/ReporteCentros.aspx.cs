﻿
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppEcomonedas
{
    public partial class prueba2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
            }
        }
         
        public bool validarfechas() {
         DateTime FechaHoy = Convert.ToDateTime(DateTime.Now.ToShortDateString());
         DateTime Fecha1 = Convert.ToDateTime(txtFechaInicio.Text);
         DateTime Fecha2 = Convert.ToDateTime(txtFechaFinal.Text);
        
            if (Fecha2 <= FechaHoy)
            {
                if (Fecha1 <= Fecha2) {
                    return true;

                } else {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "La fecha Inicio tiene que ser menor o igual a la fecha Final";
                    return false;
                }
            }else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "La fecha final tiene que ser menor o igual a la fecha de hoy";
                return false;
            }

           
        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtFechaFinal.Text = "";
            txtFechaInicio.Text = "";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (validarfechas())
            {
                DateTime fecha = Convert.ToDateTime(txtFechaInicio.Text);
                DateTime fecha2 = Convert.ToDateTime(txtFechaFinal.Text);


                //Data sourse
                DataTable dt = getData(fecha, fecha2);
                ReportDataSource rds = new ReportDataSource("DataSet2", dt);



                //llamamos al reporte 
                LocalReport report = new LocalReport();
                report.DataSources.Add(rds);


                ReportParameter[] p = new ReportParameter[2];

                p[0] = new ReportParameter("Fecha1", fecha.ToShortDateString());
                p[1] = new ReportParameter("Fecha2", fecha2.ToShortDateString());




                report.ReportPath = Server.MapPath("~/Reportes/ReporteEcomonedasporCentro.rdlc");
                report.EnableExternalImages = true;

                report.SetParameters(p);
                report.Refresh();



                string FileName = "Reporte.pdf";
                string extension;
                string encoding;
                string mimeType;
                string[] streams;
                Warning[] warnings;



                Byte[] mybytes = report.Render("PDF", null,
                                out extension, out encoding,
                                out mimeType, out streams, out warnings); //for exporting to PDF  
                using (FileStream fs = File.Create(Server.MapPath("~/images/DescargasCupones/") + FileName))
                {
                    fs.Write(mybytes, 0, mybytes.Length);
                }

                Response.Buffer = true;

                Response.ContentType = "application/pdf";

                Response.AddHeader("content-disposition", "inline;filename=" + FileName + ".pdf");


                Response.WriteFile(Server.MapPath(Path.Combine("~/images/DescargasCupones/" + FileName)));
                Response.End();


            }
        }
        public DataTable getData(DateTime fecha, DateTime fecha2)
        {
            DataTable dt = new DataTable();
            string conexion = System.Configuration.ConfigurationManager.ConnectionStrings["EcomonedasContexto"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("ProcedimientoCentro", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Fecha1", SqlDbType.DateTime).Value = fecha;
                cmd.Parameters.Add("@Fecha2", SqlDbType.DateTime).Value = fecha2;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
            }
            return dt;
        }
    }
}