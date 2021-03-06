﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EcoMonedas.Master" AutoEventWireup="true" CodeBehind="CanjeCupones.aspx.cs" Inherits="AppEcomonedas.CanjeCupones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      

      <div class="row">
          <br /> <br /> <br />  <br /> <br /> <br />
         <div class="panel panel-success col-lg-4 mb-5 col-lg-offset-7 " style="margin-right: 50px">
              <div class="panel-heading ">
                  <label class="modal-title ">Total de ecomonedas disponibles:</label>   <asp:Label runat="server" ID="lblTotalEcomonedas" Text="500"> </asp:Label>
              </div>
           
          </div>
        <asp:Label ID="lblMensaje" runat="server"  CssClass="alert alert-dismissible alert-success col-lg-12 text-center "  Visible="false" Text=""></asp:Label>
         </div>
     

            <h2 class="text-center w-100" style="color:#1BBD36"> Cupones Canjeables</h2>
       <h3 class="text-center w-100">¡Canjeá tus ecocolones por cupones que puedes canjear en puntos de venta y comercios afiliados!</h3>
    
      <div class="row ">       
         <asp:HiddenField ID="hdId_Cupon" runat="server" />
        
     <asp:ListView ID="lvCupon" runat="server"
        DataKeyNames="Id_Cupon" GroupItemCount="2"
        ItemType="Contexto.Cupon" SelectMethod="listadoCupon">
        <EmptyDataTemplate>
            <div class="row">
               <label class="alert alert-dismissible alert-success col-lg-12 text-center"> No hay Cupones disponibles en este momento</label>
                   <div class="row">
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <div class="col-lg10">
            </div>
        </EmptyItemTemplate>
        <GroupTemplate>
            <div class="row">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
        </GroupTemplate>

        <ItemTemplate>
             <asp:HiddenField ID="hiddenID" runat="server" Value="<%#:Item.Id_Cupon%>" />
            <div class="panel panel-success col-lg-4 mb-5 col-lg-offset-1 ">
                <div class="panel-heading ">
                    <center><div style="color: black; margin-bottom:10px;" class="panel-title"  ><%#:Item.nombre%> <%#:Item.Id_Cupon%></div>    </center>
                    <div class="class="panel-body">
                        <asp:Image ID="Image1" ImageUrl='<%# Eval("imagen", "~/images/cupones/{0}")%>'
                            Height="280px" Width="100%" ImageAlign="Middle" runat="server" /><br />
                        <center> <p class="card-text" style="color:black; margin-top:10px"><b>Precio </b><%#:String.Format("₡{0:N2}", Item.Precio_Canje)%></p></center>
                    </div>
                    <div class="panel-success" style="color: black;">
                        <center>                                          
                         
                            <asp:LinkButton id="btnAgregar" target=”_blank” CssClass="btn btn-success w-10" onclick="linkAgregar_Click" ValidationGroup="guardar" runat="server">Obtener cupón</asp:LinkButton>  
             
                 
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
