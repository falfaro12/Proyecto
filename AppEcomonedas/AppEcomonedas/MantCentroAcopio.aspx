<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="MantCentroAcopio.aspx.cs" Inherits="AppEcomonedas.Centro_de_acopio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Este es el primer div que divide el panel de info-->
    <div class="col-lg-5 main-chart">
       <h3><i class="fa fa-angle-right"></i>Centros de Acopio</h3>
         <div class="panel panel-success">
         <div class="panel-heading">Información del Centro de Acopio</div>
         <div class="panel-body">
             <div class="form-group row">
                 <label for="lblNombre" class="control-label">Nombre</label>
                 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*El nombre del centro es requerido" 
                    ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
             </div>
             <br />
               <div class="form-group row">
                 <label for="lblNombre" class="control-label">Provincia</label>
                  <asp:DropDownList ID="ddlProvincia" 
                    runat="server" 
                    CssClass="form-control"
                    AutoPostBack="true"
                    ItemType="Contexto.Provincia" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" DataTextField="nombre" 
                    DataValueField="Id_Centro"
                    >
                </asp:DropDownList>
             </div>
             

         </div>
            </div>
        </div>
     <!--Este es el de la lista-->
    <div class="col-lg-8 main-chart">


    </div>

</asp:Content>
