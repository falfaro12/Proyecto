<%@ Page Title="" Language="C#" MasterPageFile="~/EcoMonedas.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="AppEcomonedas.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row"> <br /><br /><br /><br /><br /> </div>
    <div class="col-lg-5 main-chart">
         <div class="row">
        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
         </div>
         <div class="panel panel-success">
             <div class="panel-heading">Información de mi Cuenta</div>
             <div class="panel-body">
                 <div class="form-group row" style="margin: 15px;">
                     <label for="lblNombre" class="control-label">Nombre</label>
                     <asp:textbox id="txtNombre" runat="server" cssclass="form-control"></asp:textbox>
                     <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" errormessage="*El nombre del usuario es requerido"
                         controltovalidate="txtNombre" forecolor="Red" setfocusonerror="true" display="Dynamic" validationgroup="guardar"></asp:requiredfieldvalidator>
                 </div>
                 <br />
                 <div class="form-group row" style="margin: 15px;">
                     <label for="lblApellido1" class="control-label">Primer Apellido</label>
                     <asp:textbox id="txtApellido1" runat="server" cssclass="form-control"></asp:textbox>
                     <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" errormessage="*El primer apellido del usuario es requerido"
                         controltovalidate="txtApellido1" forecolor="Red" setfocusonerror="true" display="Dynamic" validationgroup="guardar"></asp:requiredfieldvalidator>
                 </div>
                 <br />
                 <div class="form-group row" style="margin: 15px;">
                     <label for="lblApellido2" class="control-label">Segundo Apellido</label>
                     <asp:textbox id="txtApellido2" runat="server" cssclass="form-control"></asp:textbox>
                     <asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" errormessage="*El segundo apellido del usuario es requerido"
                         controltovalidate="txtApellido2" forecolor="Red" setfocusonerror="true" display="Dynamic" validationgroup="guardar"></asp:requiredfieldvalidator>
                 </div>
                 <br />

                 <div class="form-group row" style="margin: 15px;">
                     <label for="lblDireccion" class="control-label">Dirección</label>
                     <asp:textbox id="txtDireccion" rows="3" cols="20" cssclass="form-control"
                         runat="server" textmode="MultiLine"></asp:textbox>
                     <asp:requiredfieldvalidator id="RequiredFieldValidator2"
                         runat="server" text="* La Dirección es requirido."
                         controltovalidate="txtDireccion"
                         setfocusonerror="true" forecolor="Red" display="Dynamic" validationgroup="guardar"></asp:requiredfieldvalidator>
                 </div>
                 <br />
                 <div class="form-group row" style="margin: 15px;">
                     <label for="lblTelefono" class="control-label">Telefono</label>
                     <asp:textbox id="txtTelefono" runat="server" cssclass="form-control"></asp:textbox>
                     <asp:requiredfieldvalidator id="RequiredFieldValidator5" runat="server" errormessage="*El telefono del usuario es requerido"
                         controltovalidate="txtNombre" forecolor="Red" setfocusonerror="true" display="Dynamic" validationgroup="guardar"></asp:requiredfieldvalidator>
                 </div>
                 <div class="form-group row" style="margin: 15px;">
                     <label for="lblCorreo" class="control-label">Correo Electronico</label>
                     <asp:textbox Enabled="false" id="txtCorreo"  runat="server" cssclass="form-control"></asp:textbox>
                     <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" errormessage="*El correo electronico del usuario es requerido"
                         controltovalidate="txtNombre" forecolor="Red" setfocusonerror="true" display="Dynamic" validationgroup="guardar"></asp:requiredfieldvalidator>
                 </div>
                 <br />
                 <div class="form-group row" style="margin: 15px;">

                     <asp:button id="btnGuardar" cssclass="btn btn-success" runat="server"
                         text="Guardar" validationgroup="guardar" onclick="btnGuardar_Click" />
                     <asp:button id="btnEditar" cssclass="btn btn-success" runat="server"
                         text="Editar" onclick="btnEditar_Click" causesvalidation="false" />
                     <asp:Button ID="btnContrasenha" CssClass="btn btn-warning" runat="server" text="Cambiar Contraseña" OnClick="btnContrasenha_Click"/>


                 </div >
                 <div class="form-group row" style="margin: 15px;">
                     <asp:Label Visible="false" ID="lblContrasenha" runat="server" Text="Contraseña" CssClass="control-label"></asp:Label>>
                     <asp:textbox Enabled="false" Visible="false" ID="txtContrasenha"  runat="server" cssclass="form-control"></asp:textbox>
                 </div>
                 <br />
                 <div class="form-group row" style="margin: 5px;">
                     <label class="control-label">PD: EL correo no se puede modificar una vez registrado el Usuario</label>
                 </div>
             </div>
           </div>
        </div>
    <div class="col-lg-5">
        <div class="panel panel-success">
             <div class="panel-heading">Mi Billetera</div>
             <div class="panel-body">

             </div>
        </div>
    </div>
    <div class="col-lg-2"></div>
</asp:Content>
