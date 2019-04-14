<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="MantCentroAcopio.aspx.cs" Inherits="AppEcomonedas.Centro_de_acopio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Este es el primer div que divide el panel de info-->
    <div class="col-lg-5 main-chart">
         <div class="row">
        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
         </div>
       <h3><i class="fa fa-angle-right"></i>Centros de Acopio</h3>
         <div class="panel panel-success">
         <div class="panel-heading">Información del Centro de Acopio</div>
         <div class="panel-body">
              <div class="form-group row" style="margin:5px;">
                 <label for="lblNombre" class="control-label">Nombre</label>
                 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*El nombre del centro es requerido" 
                    ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
              </div>
             <br />
               <div class="form-group row" style="margin:5px;">
                 <label for="lblNombre" class="control-label">Provincia</label>
                  <asp:DropDownList ID="ddlProvincia" 
                    runat="server" 
                    CssClass="form-control"
                    AutoPostBack="true"
                    ItemType="Contexto.Provincia" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" DataTextField="descripcion" 
                    DataValueField="Id_Provincia"
                    >
                </asp:DropDownList>
             </div>
              <br />
             <div class="form-group row" style="margin: 5px;">
                  <label for="lblDireccion" class="control-label">Dirección</label>
                 <asp:TextBox ID="txtDireccion" Rows="3" Cols="20" CssClass="form-control"
                     runat="server" TextMode="MultiLine"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                     runat="server" Text="* La Dirección es requirido."
                     ControlToValidate="txtDireccion"
                     SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
             </div>
              <br />
               <div class="form-group row" style="margin:5px;">
                 <label for="lblNombre" class="control-label">Administrador</label>
                  <asp:DropDownList ID="ddlAdministrador" 
                    runat="server" 
                    CssClass="form-control"
                    AutoPostBack="true"
                    ItemType="Contexto.Usuario" OnSelectedIndexChanged="ddlAdministrador_SelectedIndexChanged" DataTextField="Nombre" 
                    DataValueField="Id_Usuario"
                    >
                </asp:DropDownList>
             </div>
             <br />
             <div class="form-group row" style="margin:5px;">

                 <asp:Button ID="btnGuardar" CssClass="btn btn-success" runat="server"
                     Text="Guardar" ValidationGroup="guardar" OnClick="btnGuardar_Click" />
                 <asp:Button ID="btnLimpiar" CssClass="btn btn-success" runat="server"
                     Text="Limpiar" OnClick="btnLimpiar_Click" CausesValidation="false" />

             </div>            
         </div>
            </div>
        </div>
     <!--Este es el de la lista-->
    <div class="col-lg-7 main-chart">
         <asp:HiddenField ID="hiddenID" runat="server" />
          <!-- Listado -->
            <h3><i class="fa fa-angle-right"></i>Listado Centros de Acopio</h3>
             <asp:GridView ID="grvListado" runat="server"
                AutoGenerateColumns="false"
                 CssClass="table" 
                 GridLines="Both"
                DataKeyNames="Id_Centro"                
                AutoGenerateSelectButton="true"
                OnSelectedIndexChanged="grvListado_SelectedIndexChanged">
                 <Columns>
                     <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                     <asp:BoundField DataField="Provincia.descripcion" HeaderText="Provincia"></asp:BoundField>
                     <asp:BoundField DataField="direccionExacta" HeaderText="Direcci&#243;n"></asp:BoundField>
                     <asp:BoundField HeaderText="Administrador" DataField="Usuario.nombre"></asp:BoundField>
                 </Columns>

                 <HeaderStyle CssClass="table text-white" ForeColor="#3c763d"  BorderColor="Black"  />
            </asp:GridView>


    </div>

</asp:Content>
