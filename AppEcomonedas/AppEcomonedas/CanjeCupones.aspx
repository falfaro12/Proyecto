<%@ Page Title="" Language="C#" MasterPageFile="~/EcoMonedas.Master" AutoEventWireup="true" CodeBehind="CanjeCupones.aspx.cs" Inherits="AppEcomonedas.CanjeCupones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      

      <div class="row">
        <asp:Label ID="lblMensaje" runat="server"  CssClass="alert alert-dismissible alert-warning w-100" Visible="false" Text=""></asp:Label>
         </div>
     <br /> <br /> <br />  <br />
       <h2 class="text-center w-100">CUPONES</h2>
   
      <div class="row ">       
         <asp:HiddenField ID="hdId_Cupon" runat="server" />
          <center>
     <asp:ListView ID="lvCupon" runat="server"
        DataKeyNames="Id_Cupon" GroupItemCount="1"
        ItemType="Contexto.Cupon" SelectMethod="listadoCupon">
        <EmptyDataTemplate>
            <div class="row">
                No hay datos
                   <div class="row">
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <div class="col-lg12">
            </div>
        </EmptyItemTemplate>
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
        </GroupTemplate>

        <ItemTemplate>
             
            <div class="col-lg-10 col-lg-offset-1 mb-5 ">
                <div class="card border-dark mb-3">
                    <center><div style="color: black; background-color:lightgrey;" class="card-header border-dark" ><%#:Item.nombre%></div>    </center>
                    <div class="card-body">
                        <asp:Image ID="Image1" ImageUrl='<%# Eval("imagen", "~/images/cupones/{0}")%>'
                            Height="300px" Width="100%" ImageAlign="Middle" runat="server" />
                        <center> <p class="card-text" style="color:black"><b>Precio </b><%#:String.Format("₡{0:N2}", Item.Precio_Canje)%></p></center>
                    </div>
                    <div class="card-footer text-muted border-dark background-color:lightgrey;" style="color: black;"> 
                       <center>
                         <asp:LinkButton id="btnAgregar"  CssClass="btn btn-light w-50" onclick="linkAgregar_Click" ValidationGroup="guardar" runat="server">Obtener Cupon</asp:LinkButton>                                           
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
    
        </div>

</asp:Content>
