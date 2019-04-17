<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaTipoMateriales.aspx.cs" Inherits="AppEcomonedas.ListaTipoMateriales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Company-HTML Bootstrap theme</title>

    <!-- Bootstrap -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" />	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<header class="blog-content container-fluid">		
		<nav class="navbar navbar-fixed-top w-100" role="navigation">
			<div class="navigation w-100">
				<div class="container ">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href="Inicio.aspx"><h1><span>Eco</span>monedas</h1></a>
						</div>
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="Inicio.aspx" class="active">Inicio</a></li>
								<li role="presentation"><a href="feature">Centros de Acopio</a></li>
								<li role="presentation"><a href="services.html">Tipos de Materiales</a></li>								
								<li role="presentation"><a href="InicioSesion.aspx">Mi cuenta</a></li>													
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		</nav>	
       
	</header>
       
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
     
   
</body>
</html>
