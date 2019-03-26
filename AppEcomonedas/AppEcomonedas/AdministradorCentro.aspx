<%@ Page Title="" Language="C#" MasterPageFile="~/AdmCentro.Master" AutoEventWireup="true" CodeBehind="AdministradorCentro.aspx.cs" Inherits="AppEcomonedas.AdministradorCentro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
         </div>
       <h3><i class="fa fa-angle-right"></i>Materiales reciclables</h3>
    <br />
    <div class="row">
     <asp:ListView ID="lvMaterial" runat="server"
        DataKeyNames="Id_Material" GroupItemCount="3"
        ItemType="Contexto.Material" SelectMethod="listadoMateriales">
        <EmptyDataTemplate>
            <div class="row">
                No hay datos
                   <div class="row">
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <div class="col-lg-3">
            </div>
        </EmptyItemTemplate>
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="col-lg-4">
                <div class="card border-info mb-3">
                    <div class="card-header" style="background-color:<%#:Item.color%>"><%#:Item.nombre%></div>                   
                       <asp:Image ID="Image1" ImageUrl='<%# Eval("imagen", "~/images/materiales/{0}")%>'
                        Height="150px" ImageAlign="Middle" runat="server" />
                    <div class="card-body">
                     
                        <p class="card-text"><b>Precio </b><%#:String.Format("${0:N2}", Item.Precio_Material)%></p>
                    </div>
                    <div class="card-footer text-muted" style="background-color:<%#:Item.color%>">
                        <asp:LinkButton ID="linkAgregar" CssClass="btn btn-success "  runat="server" OnClick="linkAgregar_Click">Agregar</asp:LinkButton>
                    </div>
                    </div>
                     </div>
                </ItemTemplate>
                <LayoutTemplate>
                     <div class="container">
                         <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </div>
</asp:Content>
