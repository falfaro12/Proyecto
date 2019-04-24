<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="ListaClientes.aspx.cs" Inherits="AppEcomonedas.ListaClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
         <h3><i class="fa fa-angle-right"></i>Listado de CLientes</h3>
        <label for="lblBuscarCliente">Buscar cliente (Correo)</label>
        <div class="form-inline my-2 my-lg-0">
            <asp:TextBox ID="txtBuscarCliente" CssClass="form-control mr-sm-2 w-75" placeholder="Correo del cliente" runat="server"></asp:TextBox>
            <asp:LinkButton ID="btnBuscarCliente" CssClass="btn btn-success my-2 my-sm-0" OnClick="btnBuscarCliente_Click" ValidationGroup="ValidaCanje" runat="server"><i class="fa fa-search"></i></asp:LinkButton>
        </div>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                   <asp:GridView ID="grvListado" runat="server"
            AutoGenerateColumns="false"
            CssClass="table"
            DataKeyNames="Id_Usuario">
            <Columns>
                <asp:BoundField DataField="Id_Usuario" HeaderText="Correo electrónico"></asp:BoundField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre"></asp:BoundField>
                <asp:BoundField DataField="Apellido1" HeaderText="Apellido"></asp:BoundField>
                <asp:BoundField DataField="Apellido2" HeaderText="Apellido"></asp:BoundField>
                <asp:BoundField DataField="telefono" HeaderText="Teléfono"></asp:BoundField>
            </Columns>

            <Columns>
                     
                 </Columns>

                 <HeaderStyle CssClass="table-success text-center" ForeColor="#3c763d" />
            </asp:GridView>
                               
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnBuscarCliente" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
