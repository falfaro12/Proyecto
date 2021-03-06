﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdmCentro.Master" AutoEventWireup="true" CodeBehind="ListaCanjesRealizados.aspx.cs" Inherits="AppEcomonedas.ListaCanjesRealizados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="col-lg-12 main-chart">
        <asp:HiddenField ID="hiddenID" runat="server" />
        <!-- Listado -->
        <h3><i class="fa fa-angle-right"></i>Lista de todos los canjes realizados en el Centros de Acopio</h3>

        <label for="lblBuscar">Buscar por Cliente (nombre)</label>
        <div class="form-inline my-2 my-lg-0">
            <asp:TextBox ID="txtBuscar" CssClass="form-control mr-sm-2 w-75" placeholder="Nombre del cliente" runat="server"></asp:TextBox>
            <asp:LinkButton ID="btnBuscar" CssClass="btn btn-success my-2 my-sm-0" OnClick="btnBuscar_Click" ValidationGroup="ValidaCanje" runat="server"><i class="fa fa-search"></i></asp:LinkButton>
        </div>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                             <asp:GridView ID="grvListado" runat="server"
            AutoGenerateColumns="false"
            CssClass="table"
            DataKeyNames="Id_Enca"
            AutoGenerateDetailsButton="true"
            OnSelectedIndexChanged="grvListado_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="Canje" DataField="Id_Enca" DataFormatString=" No.{0:N0} "></asp:BoundField>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd-M-yyyy}"></asp:BoundField>
                <asp:BoundField DataField="Usuario.NombreCompleto" HeaderText="Cliente"></asp:BoundField>
                <asp:BoundField DataField="Total" HeaderText="Total Ecomonedas" DataFormatString="₡{0:N2}"></asp:BoundField>
            </Columns>

            <Columns>
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
