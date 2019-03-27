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
            <div class="col-lg-4 mb-5 ">
                <div class="card border-dark mb-3">
                    <center><div style="color: black; background-color: <%#:Item.color%>" class="card-header border-dark" ><%#:Item.nombre%></div>    </center>
                    <div class="card-body">
                        <asp:Image ID="Image1" ImageUrl='<%# Eval("imagen", "~/images/materiales/{0}")%>'
                            Height="150px" Width="100%" ImageAlign="Middle" runat="server" />
                        <center> <p class="card-text" style="color:black"><b>Precio </b><%#:String.Format("₡{0:N2}", Item.Precio_Material)%></p></center>
                    </div>
                    <div class="card-footer text-muted border-dark" style="color: black; background-color: <%#:Item.color%>">
                        <center> <asp:LinkButton ID="linkAgregar" CssClass="btn btn-light w-50" Onclick="linkAgregar_Click"  runat="server" >Agregar</asp:LinkButton></center>
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
    <%-- Modal de cantidad --%>
    <div runat="server" class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Cantidad de Material que se recibe</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button1" class="btn btn-default" OnClick="Button1_Click"  runat="server" Text="Agregar" />            
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
    
</asp:Content>
