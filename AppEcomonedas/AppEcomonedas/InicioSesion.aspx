<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="AppEcomonedas.InicioSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ecomonedas - Inicio Sesión</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="estiloInicioSesion/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/css/util.css">
	<link rel="stylesheet" type="text/css" href="estiloInicioSesion/css/main.css">
<!--===============================================================================================-->
</head>
<body>
    <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form id="form1" runat="server" class="login100-form validate-form p-l-55 p-r-55 p-t-178">
					<span class="login100-form-title">
						Inicia Sesión
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate="Por favor ingrese un correo electrónico">
                        <asp:TextBox ID="usrID" CssClass="input100" type="text" placeholder="Correo electrónico" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                     runat="server" Text="*El correo electrónico es requirido."
                     ControlToValidate="usrID"
                     SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Por favor ingrese una contraseña">
                        <asp:TextBox TextMode="Password" ID="senha" CssClass="input100" runat="server" placeholder="Contraseña"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                     runat="server" Text="* La contreseña es requirida."
                     ControlToValidate="senha"
                     SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationGroup="guardar"></asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
					</div>
                    <br />
					<div class="container-login100-form-btn">
                        <asp:Button ID="logIN" runat="server" CssClass="login100-form-btn" Text="Iniciar Sesión" OnClick="logIN_Click" ValidationGroup="guardar" />
					</div>
                    <div class="flex-col-c p-t-130 p-b-40">
                        <asp:Label ID="mensaje" runat="server" CssClass="alert alert-dismissible alert-danger" Text="" Visible="false"></asp:Label>
                    </div>

					<div class="flex-col-c p-b-40">
						<span class="txt1 p-b-9">
							No tienes cuenta?
						</span>

						<a href="Autoregistro.aspx" class="txt3">
							Registrate aquí
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
 
</body>
</html>
