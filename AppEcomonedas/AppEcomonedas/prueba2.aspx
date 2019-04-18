<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="prueba2.aspx.cs" Inherits="AppEcomonedas.prueba2" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 main-chart">
        
       <h3><i class="fa fa-angle-right"></i>Reporte de eco-monedas producidas por Centro de Acopio</h3>
         <div class="panel panel-success">
         <div class="panel-heading">Rango de fechas</div>
         <div class="panel-body">
              <div class="form-group row text-center" style="margin:5px;">
                 <label for="lblFechaInicio" class="control-label">Fecha Inicio:</label>
                 <asp:TextBox ID="txtFechaInicio" type="date" runat="server" CssClass="form-control ml-2" Width="200px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*La fecha inicio es requerida" 
                    ControlToValidate="txtFechaInicio" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
           
                <label for="lblFechaFinal" class="control-label ml-3">Fecha Final:</label>
                 <asp:TextBox ID="txtFechaFinal" type="date" runat="server" CssClass="form-control ml-2" Width="200px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*La fecha final es requerida" 
                    ControlToValidate="txtFechaFinal" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
              

                 <asp:Button ID="btnGuardar" CssClass="btn btn-success ml-5" runat="server"
                     Text="Crear Reporte" ValidationGroup="guardar" OnClick="btnGuardar_Click" />
                 <asp:Button ID="btnLimpiar" CssClass="btn btn-success ml-4" runat="server"
                     Text="Limpiar" OnClick="btnLimpiar_Click" CausesValidation="false" />

             </div>            
         </div>
            </div>
        </div>
 <div>
   
           <rsweb:ReportViewer ID="ReportViewer1" runat="server">
           </rsweb:ReportViewer>
     
   
 </div>
  
</asp:Content>
