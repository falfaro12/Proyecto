<%@ Page Title="" Language="C#" MasterPageFile="~/EcoMonedas.Master" AutoEventWireup="true" CodeBehind="ListaCuponesCanjeados.aspx.cs" Inherits="AppEcomonedas.ListaCuponesCanjeados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <br /> <br /> <br />  <br /> <br /> <br />
       <h3 class="text-center w-100">¡Lista de todos tus cupones Canjeados!</h3>
      <div class="col-lg-10 col-lg-offset-1 main-chart">
         <asp:HiddenField ID="hiddenID" runat="server" />
          <!-- Listado -->
      
         <asp:GridView ID="grvListado" runat="server"
             AutoGenerateColumns="false"
             CssClass="table"
             DataKeyNames="Id_Cupon"
          
           >
             <Columns>
                 <asp:BoundField HeaderText="Codigo" DataField="Id_Cupon" DataFormatString=" #{0:N0} "></asp:BoundField>
                 <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-M-yyyy}"></asp:BoundField>
                 <asp:BoundField DataField="Usuario.NombreCompleto" HeaderText="Cliente"></asp:BoundField>
                 <asp:BoundField DataField="Cupon.Precio_Canje" HeaderText="Precio" DataFormatString="₡{0:N2}"></asp:BoundField>
              


                 <asp:TemplateField HeaderText="Foto">
                     <ItemTemplate>
                         <asp:Image ImageUrl="~/images/cupones/<%# Eval("Cupon.imagen")%>" />
                     </ItemTemplate>

                 </asp:TemplateField>
             </Columns>

             <HeaderStyle CssClass="table text-white" ForeColor="#3c763d" BorderColor="Black" />

         </asp:GridView>


    </div>




</asp:Content>
