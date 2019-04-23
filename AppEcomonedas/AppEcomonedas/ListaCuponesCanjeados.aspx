<%@ Page Title="" Language="C#" MasterPageFile="~/EcoMonedas.Master" AutoEventWireup="true" CodeBehind="ListaCuponesCanjeados.aspx.cs" Inherits="AppEcomonedas.ListaCuponesCanjeados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <br /> <br /> <br />  <br /> <br /> <br />
       <h3 class="text-center w-100">¡Lista de todos tus cupones Canjeados!</h3>

    <div class="col-lg-10 col-lg-offset-1 main-chart">
        <asp:HiddenField ID="hiddenID" runat="server" />
        <!-- Listado -->
        <label for="lblBuscar">Buscar Cupón (nombre)</label>
        <div class="form-inline my-2 my-lg-0">
            <asp:TextBox ID="txtBuscarCliente" CssClass="form-control mr-sm-2 w-75" placeholder="Nombre del cupón" runat="server"></asp:TextBox>
            <asp:LinkButton ID="btnBuscar" CssClass="btn btn-success my-2 my-sm-0" OnClick="btnBuscar_Click" ValidationGroup="ValidaCanje" runat="server"><i class="fa fa-search"></i></asp:LinkButton>
        </div>
        <br />

        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-success" Visible="false" Text=""></asp:Label>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="grvListado" runat="server"
                    AutoGenerateColumns="false"
                    CssClass="table  table-bordered table-hover text-center "
                    DataKeyNames="Id_Cupon">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="text-center" HeaderText="Acción">
                            <ItemTemplate>

                                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#1BBD36"
                                    NavigateUrl='<%# Eval("Cupon.nombre", @"images/DescargasCupones/Cupon-{0}.pdf") %>'
                                    Text='Descargar'>
                                </asp:HyperLink>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderStyle-CssClass="text-center" HeaderText="Codigo" DataField="Id_Cupon" DataFormatString=" #{0:N0} "></asp:BoundField>
                        <asp:BoundField HeaderStyle-CssClass="text-center" HeaderText="Cupón" DataField="Cupon.nombre"></asp:BoundField>
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-M-yyyy}"></asp:BoundField>
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="Usuario.NombreCompleto" HeaderText="Cliente"></asp:BoundField>
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="Cupon.Precio_Canje" HeaderText="Precio" DataFormatString="₡{0:N2}"></asp:BoundField>



                        <asp:TemplateField HeaderStyle-CssClass="text-center" HeaderText="Foto">
                            <ItemTemplate>
                                <center>     
                       <asp:Image style="width:200px; height:150px" ID="Image1" runat="server" ImageUrl='<%# Eval("Cupon.imagen", "~/images/cupones/{0}")%>' />
                     </center>
                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>
   <HeaderStyle CssClass="table-success text-center" ForeColor="#3c763d" />


                </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>



    </div>




</asp:Content>
