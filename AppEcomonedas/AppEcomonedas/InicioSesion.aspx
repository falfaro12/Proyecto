<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="AppEcomonedas.InicioSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="usrID" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="senha" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="logIN" runat="server" Text="Iniciar Sesión" OnClick="logIN_Click" />
        
        <br />
        <i>Aún no tienes cuenta? <<a href="AutoRegistro.aspx"><b>Create una aqui! </b><a></i>
        <br />
        <ul>
            <li><asp:Label ID="mensaje" runat="server" Text="Inicie sesion"></asp:Label></li>
            <li><asp:Label ID="Nombre" runat="server" Text=""></asp:Label></li>
            <li><asp:Label ID="Apellido" runat="server" Text=""></asp:Label></li>
            <li><asp:Label ID="Telefono" runat="server" Text=""></asp:Label></li>
            <li><asp:Label ID="Direccion" runat="server" Text=""></asp:Label></li>
            <li><asp:Label ID="Rol" runat="server" Text=""></asp:Label></li>
        </ul> 
        <br />
        <asp:Button ID="btnPerfil" runat="server" Text="Button" />              
    </div>
    </form>
</body>
</html>
