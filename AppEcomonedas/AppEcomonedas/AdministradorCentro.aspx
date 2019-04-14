<%@ Page Title="" Language="C#" MasterPageFile="~/AdmCentro.Master" AutoEventWireup="true" CodeBehind="AdministradorCentro.aspx.cs" Inherits="AppEcomonedas.AdministradorCentro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <asp:Label ID="lblMensaje" runat="server"  CssClass="alert alert-dismissible alert-warning w-100" Visible="false" Text=""></asp:Label>
         </div>
       <h3><i class="fa fa-angle-right"></i>Materiales reciclables</h3>
    <br />
    <div class="row">
         <asp:HiddenField ID="hdId_Material" runat="server" />
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
            <div class="col-lg-4 mb-5 ">
                <div class="card border-dark mb-3">
                    <center><div style="color: black; background-color: <%#:Item.color%>" class="card-header border-dark" ><%#:Item.nombre%></div>    </center>
                    <div class="card-body">
                        <asp:Image ID="Image1" ImageUrl='<%# Eval("imagen", "~/images/materiales/{0}")%>'
                            Height="150px" Width="100%" ImageAlign="Middle" runat="server" />
                        <center> <p class="card-text" style="color:black"><b>Precio </b><%#:String.Format("₡{0:N2}", Item.Precio_Material)%></p></center>
                    </div>
                    <div class="card-footer text-muted border-dark" style="color: black; background-color: <%#:Item.color%>">
   
                         <center >Cantidad:<asp:TextBox runat="server" id="txtCantidad" TextMode="Number" text="1"  min="1" max="100" step="1"/>
                         <asp:LinkButton id="btnAgregar"  CssClass="btn btn-light w-50" onclick="linkAgregar_Click" ValidationGroup="guardar" runat="server">Agregar</asp:LinkButton>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*La cantidad es requerida" 
                    ControlToValidate="txtCantidad" ForeColor="black" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
                        </center>
                             
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
        <asp:Button ID="btnInvisible" style="display: none;" data-toggle="modal" data-target="#myModal"  runat="server"  Text="Button" />
        </div>
   
   
  
   
</asp:Content>
