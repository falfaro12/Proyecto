<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoRegistro.aspx.cs" Inherits="AppEcomonedas.AutoRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Creative Colorlib SignUp Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="css/registro.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet"/>
    <!-- //web font -->
</head>
<body>
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Autoregistro</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form runat="server" >
                    <p>Cédula</p>
                    <asp:TextBox CssClass="text" ID="id" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="La identificación es requerida" ControlToValidate="id"
                    ForeColor="red"
                    SetFocusOnError="true"
                    Display="Dynamic"></asp:RequiredFieldValidator>

                    <br />
                    <p>Nombre</p>
                    <asp:TextBox CssClass="text" placeholder="Nombre"  ID="nombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El nombre es requerido" ControlToValidate="nombre"
                    ForeColor="red"
                    SetFocusOnError="true"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <p>Primer Apellido</p>
                    <asp:TextBox CssClass="text" ID="apellido1" placeholder="Primer Apellido" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="apellido1"
                    ForeColor="red"
                    SetFocusOnError="true"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <p>Segundo Apellido</p>
                    <asp:TextBox CssClass="text" ID="apellido2" placeholder="Segundo Apellido" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="apellido2"
                    ForeColor="red"
                    SetFocusOnError="true"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <p>Direccion</p>
                    <asp:TextBox CssClass="text" ID="direccion" placeholder="Dirección" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="direccion"
                    ForeColor="red"
                    SetFocusOnError="true"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <p>Telefono</p>
                    <asp:TextBox CssClass="text" ID="telefono" placeholder="Telefono" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="telefono"
                    ForeColor="red"
                    SetFocusOnError="true"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <p>Contraseña</p>
                    <asp:TextBox CssClass="text" ID="password" placeholder="Contraseña" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="password"
                    ForeColor="red"
                    SetFocusOnError="true"
                    Display="Dynamic"></asp:RequiredFieldValidator>

					<div class="wthree-text">

						<div class="clear"> </div>
					</div>
                    <asp:Button CssClass="buttonReg" ID="ButtonReg" runat="server" Text="Registrarse" OnClick="ButtonReg_Click" />
				</form>
				<p>Ya tienes una cuenta?<a href="#"> Inicia Sesión!</a></p>
			</div>
		</div>
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<!-- //main -->
</body>
</html>
