<%@ Page Title="" Language="C#" MasterPageFile="~/EcoMonedas.Master" AutoEventWireup="true" CodeBehind="ListaMaterialesCliente.aspx.cs" Inherits="AppEcomonedas.ListaMaterialesCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br />
     <div class="aboutus blog">
      <div class="container">
           <h3>Materiales que Recibimos</h3>
			<hr>
      </div>
         </div>
      
          <div class="container">
              <div class="text-center">
                  <div class="col-md-4">
                       <asp:ListView ID="lvMaterial" runat="server"
        DataKeyNames="Id_Material" GroupItemCount="4"
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
            <div class="col-lg-3 mb-5 ">
                <div class="card border-dark mb-3" style="color: black; background-color: <%#:Item.color%>"  >
                  <div class="row">
                        <asp:Image ID="Image1" CssClass="img-circle col-6" ImageUrl='<%# Eval("imagen", "~/images/materiales/{0}")%>'
                            Height="150px" Width="100%" ImageAlign="Middle" runat="server" />
                    
                        <h3 style=" color: white;margin-top:18%;" class="col-6 "  ><%#:Item.nombre%></h3>  
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
              </div>
          </div>
</asp:Content>
