﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdmCentro.Master" AutoEventWireup="true" CodeBehind="CarritoCanje.aspx.cs" Inherits="AppEcomonedas.CarritoCanje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-lg-12">
            <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
        </div>
    </div>
       <div class="row mt-5">
        <div class="col-lg-12">
            <ul class="list-group">
                <li class="list-group-item list-group-item-success">Información del Canje</li>
                <li class="list-group-item">
                    <asp:Label ID="Label1" runat="server" Text="Cliente"></asp:Label>
                    <asp:DropDownList ID="ddlClientes" 
                    runat="server" 
                    CssClass="form-control"
                    AutoPostBack="true"
                    ItemType="Contexto.Usuario" DataTextField="Nombre" 
                    DataValueField="Id_Usuario"
                    >
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="ddlClientes"
                        ErrorMessage="El cliente es requerido para el canje"
                        ValidationGroup="ordenar"></asp:RequiredFieldValidator>
                </li>
                <li class="list-group-item">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                        OnClick="btnGuardar_Click"
                         CssClass="btn btn-success" />
                </li>
                <li class="list-group-item">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="grvCarrito" runat="server"
                                AutoGenerateColumns="False" DataKeyNames="Id_Material"
                                GridLines="Vertical" CellPadding="4"
                                CssClass="table table-hover"
                                AutoGenerateDeleteButton="true"
                                OnRowDeleting="grvCarrito_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="Material.nombre" HeaderText="Material"></asp:BoundField>
                                    <asp:BoundField DataField="precioMaterial" DataFormatString="₡{0:N2}" HeaderText="Precio equivalente"></asp:BoundField>                                   
                                    <asp:TemplateField HeaderText="Cantidad">
                                        <ItemTemplate>
                                            <asp:TextBox
                                                ID="CantidadComprar"
                                                Width="40"
                                                runat="server"
                                                OnTextChanged="CantidadComprar_TextChanged"
                                                Text='<%# Eval("cantidad")%>' AutoPostBack="true"></asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  <asp:BoundField  DataField="subtotal" DataFormatString="₡{0:N2}" HeaderText="Subtotal"></asp:BoundField>
                                  
                                </Columns>
                                <HeaderStyle CssClass="table-primary" />
                                <AlternatingRowStyle CssClass="table-secondary" />
                            </asp:GridView>
                            <div class="float-right">
                                <strong>                                   
                                    <asp:Label ID="LabelTotalText" runat="server" Text="Total Orden: "></asp:Label>
                                    <asp:Label ID="lblTotal" runat="server" Text="" Width="150px"></asp:Label>

                                </strong>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </li>
                <li class="list-group-item">
                    <asp:Button ID="btnOrdenar" runat="server" ValidationGroup="ordenar"
                        Text="Guardar Canje" OnClick="btnOrdenar_Click" CssClass="btn btn-success" />
                </li>
            </ul>
        </div>
    </div>
   
</asp:Content>