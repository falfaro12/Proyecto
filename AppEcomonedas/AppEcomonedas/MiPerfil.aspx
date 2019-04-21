<%@ Page Title="" Language="C#" MasterPageFile="~/EcoMonedas.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="AppEcomonedas.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    <div class="col-lg-5 main-chart" style="margin-left:05em;">
        <div class="row">
            <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
        </div>
        
        <div class="panel panel-success">
            <div class="panel-heading">Información de mi Cuenta</div>
            
            <div class="panel-body">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="form-group row" style="margin: 15px;">
                            <label for="lblNombre" class="control-label">Nombre</label>
                            <asp:TextBox Enabled="false" ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*El nombre del usuario es requerido"
                                ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group row" style="margin: 15px;">
                            <label for="lblApellido1" class="control-label">Primer Apellido</label>
                            <asp:TextBox Enabled="false" ID="txtApellido1" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*El primer apellido del usuario es requerido"
                                ControlToValidate="txtApellido1" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group row" style="margin: 15px;">
                            <label for="lblApellido2" class="control-label">Segundo Apellido</label>
                            <asp:TextBox Enabled="false" ID="txtApellido2" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*El segundo apellido del usuario es requerido"
                                ControlToValidate="txtApellido2" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />

                        <div class="form-group row" style="margin: 15px;">
                            <label for="lblDireccion" class="control-label">Dirección</label>
                            <asp:TextBox Enabled="false" ID="txtDireccion" Rows="3" cols="20" CssClass="form-control"
                                runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server" Text="* La Dirección es requirido."
                                ControlToValidate="txtDireccion"
                                SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="form-group row" style="margin: 15px;">
                            <label for="lblTelefono" class="control-label">Telefono</label>
                            <asp:TextBox Enabled="false" ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*El telefono del usuario es requerido"
                                ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group row" style="margin: 15px;">
                            <label for="lblCorreo" class="control-label">Correo Electronico</label>
                            <asp:TextBox Enabled="false" ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*El correo electronico del usuario es requerido"
                                ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnEditar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                
                <br />
                <div class="form-group row" style="margin: 15px;">

                    <asp:Button ID="btnGuardar" CssClass="btn btn-success" runat="server"
                        Text="Guardar" ValidationGroup="guardar" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnEditar" CssClass="btn btn-success" runat="server"
                        Text="Editar" OnClick="btnEditar_Click" CausesValidation="false" />
                    <asp:Button ID="btnContrasenha" CssClass="btn btn-warning" runat="server" Text="Cambiar Contraseña" OnClick="btnContrasenha_Click" />


                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="form-group row" style="margin: 15px;">
                            <asp:Label Visible="false" ID="lblContrasenha" runat="server" Text="Contraseña" CssClass="control-label"></asp:Label>
                            <asp:TextBox Enabled="false" Visible="false" ID="txtContrasenha" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnContrasenha" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                
                <br />
                <div class="form-group row" style="margin: 5px;">
                    <label class="control-label">PD: EL correo no se puede modificar una vez registrado el Usuario</label>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-2" >

    </div>
    <div class="col-lg-5" style="float:right; margin-right:05em;">
        <div class="panel panel-success">
            <div class="panel-heading">Mi Billetera</div>
            <div class="panel-body">
                <div class="alert alert-dismissible alert-success">
                    <img src="images/coinstack.png" width="30" />
                   <strong>Ecomonedas disponibles: </strong>
                    <asp:Label ID="lblEco" runat="server" Text=""></asp:Label>
                </div>
                <br />

                <div class="alert alert-dismissible alert-danger"> 
                    <img src="images/coinstack.png" width="30" />                
                  <strong>Ecomonedas canjeadas: </strong>
                    <asp:Label ID="lblEcoCan" runat="server" Text=""></asp:Label>
                </div>
                <br />

                <div class="alert alert-dismissible alert-info">
                    <img src="images/coinstack.png" width="30" />
                  <strong>Total de Ecomonedas: </strong>
                    <asp:Label ID="lblEcoTo" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
