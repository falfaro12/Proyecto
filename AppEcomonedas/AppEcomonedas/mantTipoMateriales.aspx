<%@ Page Title="" Language="C#" MasterPageFile="~/Mantenimiento.Master" AutoEventWireup="true" CodeBehind="mantTipoMateriales.aspx.cs" Inherits="AppEcomonedas.mantTipoMateriales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--Este es el primer div que divide el panel de info-->
    <div class="col-lg-5 main-chart">
         <div class="row">
        <asp:Label ID="lblMensaje" runat="server" CssClass="alert alert-dismissible alert-warning" Visible="false" Text=""></asp:Label>
         </div>
       <h3><i class="fa fa-angle-right"></i>Materiales reciclables</h3>
         <div class="panel panel-success">
         <div class="panel-heading">Información de Materiales reciclables</div>
         <div class="panel-body">
              <div class="form-group row" style="margin:5px;">
                 <label for="lblNombre" class="control-label">Nombre</label>
                 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*El nombre del centro es requerido" 
                    ControlToValidate="txtNombre" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>                 
              </div>
             <br/>
              <div class="form-group row" style="margin: 5px;">
                  <label for="lblDireccion" class="control-label">Descripción</label>
                 <asp:TextBox ID="txtDescripcion" Rows="3" Cols="20" CssClass="form-control"
                     runat="server" TextMode="MultiLine"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                     runat="server" Text="* La Descripción es requirido."
                     ControlToValidate="txtDescripcion"
                     SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
             </div>
             <br />
               <div class="form-group row" style="margin:5px;">
                 <label for="lblNombre" class="control-label">Imagen</label>
                   <asp:Image ID="imgLibro"  CssClass="img-thumbnail" AlternateText="Imagen libro" runat="server" />
                <asp:FileUpload ID="archivoImagen" CssClass="form-control-file" runat="server" />
                <asp:RequiredFieldValidator ID="rfImagen"
                    runat="server" Text="* Imagen requerida."
                    Enabled="true"
                    ControlToValidate="archivoImagen"
                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
           
             </div>
              <br />
             <div class="form-group row" style="margin: 5px;">
                  <label for="lblDireccion" class="control-label">Precio</label>
                 <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">&cent;</span>
                    </div>
                    <asp:TextBox ID="txtPrecio" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3"
                    runat="server" Text="* Precio Requerido."
                    ControlToValidate="txtPrecio"
                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1"
                    runat="server"
                    Text="* El precio solo debe contener números"
                    ControlToValidate="txtPrecio"
                    SetFocusOnError="true" ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^[0-9]*(\,)?[0-9]?[0-9]?$"></asp:RegularExpressionValidator>
            </div>
              <br />
             <div class="form-group row" style="margin: 5px;">
                 <label for="lblcolor" class="control-label">Color</label>
                 <input runat="server" id="txtColor" type="color" name="favcolor" value="#0080c0" />
             </div>
             <br />
             <div class="form-group row" style="margin:5px;">

                 <asp:Button ID="btnGuardar" CssClass="btn btn-success" runat="server"
                     Text="Guardar" ValidationGroup="guardar" OnClick="btnGuardar_Click" />
                 <asp:Button ID="btnLimpiar" CssClass="btn btn-success" runat="server"
                     Text="Limpiar" OnClick="btnLimpiar_Click" CausesValidation="false"/>

             </div>            
         </div>
            </div>
        </div>
     <!--Este es el de la lista-->
    <div class="col-lg-7 main-chart">
         <asp:HiddenField ID="hiddenID" runat="server" />
          <!-- Listado -->
            <h3><i class="fa fa-angle-right"></i>Listado Tipo de Materiales</h3>
        <asp:GridView ID="grvListado" runat="server"
            AutoGenerateColumns="false"
            CssClass="table"
            DataKeyNames="Id_Material"
            AutoGenerateSelectButton="true"
            OnSelectedIndexChanged="grvListado_SelectedIndexChanged"
            OnRowDataBound="grvListado_RowDataBound">
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>
                 <asp:BoundField DataField="descripcion" HeaderText="Descripción"></asp:BoundField>
                <asp:BoundField DataField="Precio_Material" HeaderText="Precio"></asp:BoundField>
                <asp:BoundField  DataField="color" HeaderText="Color"></asp:BoundField>                     
                 </Columns>

                 <HeaderStyle CssClass="table-success" ForeColor="#dff0d8"  />
            </asp:GridView>


    </div>



</asp:Content>
