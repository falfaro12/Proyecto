<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaCentroAcopio.aspx.cs" Inherits="AppEcomonedas.ListaCentroAcopio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Company-HTML Bootstrap theme</title>

      <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
	<header class="blog-content container-fluid"  >		
		<nav class="navbar navbar-fixed-top w-100" " >
			<div class="col-12 ">
				<div class="container col-12 w-90 fixed-top " style="background-color:white">					
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
					
					<div class="navbar-collapse collapse col-12">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
									<li role="presentation"><a href="Inicio.aspx" class="active">Inicio</a></li>
								<li role="presentation"><a href="ListaCentroAcopio.aspx">Centros de Acopio</a></li>
								<li role="presentation"><a href="ListaTipoMateriales.aspx">Tipos de Materiales</a></li>								
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
           <h3>Nuestros Centros de Acopio</h3>
			<hr>
      </div>
         </div>

      <div class="container col-12">
           <asp:ListView ID="lvCentros" runat="server"
        DataKeyNames="Id_Centro" GroupItemCount="1" 
        ItemType="Contexto.CentroAcopio" SelectMethod="listadoCentro">
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
                  
                   <div class="panel-group col-lg-12 m-0" id="accordion " >
                       <div class="panel panel-success  ">
                           <div class="panel-heading">
                               <h4 class="panel-title">
                                   <a data-toggle="collapse" data-parent="#accordion" href="#collapse<%#:Item.Id_Centro%>"><%#:Item.nombre%></a>
                               </h4>
                           </div>
                           <div id="collapse<%#:Item.Id_Centro%>" class="panel-collapse collapse">
                               <div class="panel-body">
                                   <div class="row">
                                   <div class="col-4 offset-1">
                                       <img width="300px" height="300px" src="images/Centro.jpg" />
                                   </div>
                                       <div class="col-6 order-1">
                                            <br />
                                           <h4 class="text-center">Provincia:   <%#:Item.Provincia.descripcion%></h4>
                                           <br />
                                           <h4 class="text-center">Dirección Exacta:   <%#:Item.direccionExacta%></h4>
                                           <br />
                                           <h4 class="text-center">Encargado:   <%#:Item.Usuario.NombreCompleto%></h4>
                                           <br />
                                           <h4 class="text-center">Teléfono del encargado:   <%#:Item.Usuario.telefono%></h4>
                                       </div> 
                                       </div>                           
                               </div>
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
      
         
     
   
</body>
</html>
