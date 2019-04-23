<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="mantUsuarios.aspx.cs" Inherits="AppEcomonedas.mantUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Este es el primer div que divide el panel de info-->
    <div class="col-lg-5 main-chart">
         <div class="row">
        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
         </div>
       <h3><i class="fa fa-angle-right"></i>Administradores de C.A.</h3>
         <div class="panel panel-success">
         <div class="panel-heading">Información de usuarios</div>
         <div class="panel-body">
              <div class="form-group row" style="margin:5px;">
                 <label for="lblNombre" class="control-label">Nombre</label>
                 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*El nombre del usuario es requerido" 
                    ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
              </div>
             <br />
             <div class="form-group row" style="margin:5px;">
                 <label for="lblApellido1" class="control-label">Primer Apellido</label>
                 <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*El primer apellido del usuario es requerido" 
                    ControlToValidate="txtApellido1" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
              </div>
             <br />
             <div class="form-group row" style="margin:5px;">
                 <label for="lblApellido2" class="control-label">Segundo Apellido</label>
                 <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*El segundo apellido del usuario es requerido" 
                    ControlToValidate="txtApellido2" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
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
                 <label for="lblTelefono" class="control-label">Telefono</label>
                 <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*El telefono del usuario es requerido" 
                    ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
              </div>
             <div class="form-group row" style="margin:5px;">
                 <label for="lblCorreo" class="control-label">Correo Electronico</label>
                 <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*El correo electronico del usuario es requerido" 
                    ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
              </div>
             <br /> 
             <div class="form-group row" style="margin:5px;">

                 <asp:Button ID="btnGuardar" CssClass="btn btn-success" runat="server"
                     Text="Guardar" ValidationGroup="guardar" OnClick="btnGuardar_Click" />
                 <asp:Button ID="btnLimpiar" CssClass="btn btn-success ml-4" runat="server"
                     Text="Limpiar" OnClick="btnLimpiar_Click" CausesValidation="false" />

             </div>    
             <br />
             <div class="form-group row" style="margin:5px;">
                 <label class="control-label">PD: EL correo no se puede modificar una vez registrado el Usuario</label>
             </div>       
         </div>
            </div>
        </div>
     <!--Este es el de la lista-->
    <div class="col-lg-7 main-chart">
        <!--<asp:HiddenField ID="hiddenID" runat="server" />
          <!-- Listado -->
        <h3><i class="fa fa-angle-right"></i>Listado de usuarios adminstradores</h3>
      
                <asp:GridView ID="grvListado" runat="server"
                    AutoGenerateColumns="false"
                    CssClass="table"
                    DataKeyNames="Id_Usuario"
                    AutoGenerateSelectButton="true"
                    OnSelectedIndexChanged="grvListado_SelectedIndexChanged">
                    <Columns>
                         <asp:BoundField DataField="Id_Usuario" HeaderText="Correo electrónico"></asp:BoundField>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre"></asp:BoundField>
                        <asp:BoundField DataField="Apellido1" HeaderText="Apellido"></asp:BoundField>
                        <asp:BoundField DataField="Apellido2" HeaderText="Apellido"></asp:BoundField>
                        <asp:BoundField DataField="telefono" HeaderText="Telefono"></asp:BoundField>
                    </Columns>

                    <Columns>
                    </Columns>

                    <HeaderStyle CssClass="table-success text-center" ForeColor="#3c763d" />
                </asp:GridView>
    



    </div>
</asp:Content>
