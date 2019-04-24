<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="PerfilAdmin.aspx.cs" Inherits="AppEcomonedas.PerfilAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 main-chart">
        <div class="row">
            <asp:label id="lblMensaje" runat="server" cssclass="alert alert-dismissible alert-warning" visible="false" text=""></asp:label>
        </div>
        <h3><i class="fa fa-angle-right"></i>Administrador</h3>
        <div class="panel panel-success">
            <div class="panel-heading">Información de usuario</div>
            <div class="panel-body">
                <asp:updatepanel id="UpdatePanel1" runat="server">
                    <ContentTemplate> 
                        <div class="form-group row" style="margin: 5px;">
                            <label for="lblNombre" class="control-label">Nombre</label>
                            <asp:TextBox Enabled="false" ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*El nombre del usuario es requerido"
                                ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group row" style="margin: 5px;">
                            <label for="lblApellido1" class="control-label">Primer Apellido</label>
                            <asp:TextBox Enabled="false" ID="txtApellido1" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*El primer apellido del usuario es requerido"
                                ControlToValidate="txtApellido1" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group row" style="margin: 5px;">
                            <label for="lblApellido2" class="control-label">Segundo Apellido</label>
                            <asp:TextBox Enabled="false" ID="txtApellido2" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*El segundo apellido del usuario es requerido"
                                ControlToValidate="txtApellido2" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />

                        <div class="form-group row" style="margin: 5px;">
                            <label for="lblDireccion" class="control-label">Dirección</label>
                            <asp:TextBox Enabled="false" ID="txtDireccion" Rows="3" Cols="20" CssClass="form-control"
                                runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server" Text="* La Dirección es requirido."
                                ControlToValidate="txtDireccion"
                                SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group row" style="margin: 5px;">
                            <label for="lblTelefono" class="control-label">Teléfono</label>
                            <asp:TextBox Enabled="false" ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*El teléfono del usuario es requerido"
                                ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group row" style="margin: 5px;">
                            <label for="lblCorreo" class="control-label">Correo Electrónico</label>
                            <asp:TextBox Enabled="false" ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*El correo electrónico del usuario es requerido"
                                ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                    </Triggers>
                </asp:updatepanel>

                <br />
              <div class="form-group row" style="margin: 15px;">

                    <asp:Button ID="btnGuardar" CssClass="btn btn-success" runat="server"
                        Text="Guardar" ValidationGroup="guardar" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnEditar" CssClass="btn btn-success ml-4" runat="server"
                        Text="Editar" OnClick="btnEditar_Click" CausesValidation="false" />
                    <asp:Button ID="btnContrasenha" CssClass="btn btn-warning ml-4" runat="server" Text="Cambiar Contraseña" OnClick="btnContrasenha_Click" />


                </div>
                <br />
                <asp:updatepanel id="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="form-group row" style="margin: 15px;">
                            <asp:Label Visible="false" ID="lblContrasenha" runat="server" Text="Contraseña" CssClass="control-label"></asp:Label>
                            <asp:TextBox Enabled="false" Visible="false" ID="txtContrasenha" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnContrasenha" EventName="Click" />
                    </Triggers>
                </asp:updatepanel>
                <br />
                <div class="form-group row" style="margin: 5px;">
                    <label class="control-label">PD: EL correo no se puede modificar una vez registrado el Usuario</label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
