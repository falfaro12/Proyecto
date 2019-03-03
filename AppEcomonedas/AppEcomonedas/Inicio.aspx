<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="AppEcomonedas.Inicio1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Company-HTML Bootstrap theme</title>

    <!-- Bootstrap -->
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
	<header>		
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navigation">
				<div class="container">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href="index.html"><h1><span>Eco</span>monedas</h1></a>
						</div>
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="Inicio.html" class="active">Inicio</a></li>
								<li role="presentation"><a href="about.html">Centros de Acopio</a></li>
								<li role="presentation"><a href="services.html">Tipos de Materiales</a></li>								
								<li role="presentation"><a href="portfolio.html">Mi cuenta</a></li>													
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		</nav>		
	</header>
	
	<section id="main-slider" class="no-margin">
        <div class="carousel slide">      
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(images/slider/bg1.png)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h2 class="animation animated-item-1">Bienvenidos a <span>Ecomonedas</span></h2>
                                    <p class="animation animated-item-2">Una forma diferente de reciclar....</p>                            
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                   
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->             
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->
	
	<div class="feature">
		<div class="container">
			<div class="text-center">
				<div class="col-md-4">
					<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms" >
						<i class="fa fa-cloud"></i>	
						<h2>Ayuda al ambiente</h2>
						<p>Reciclando todo lo que puedas</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" >
						<i class="fa fa-laptop"></i>	
						<h2>Gana Cupones en linea</h2>
						<p>Cada material te da puntos que puedes canjear.</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="hi-icon-wrap hi-icon-effect wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" >
						<i class="fa fa-heart-o"></i>	
						<h2>Cambia tus cupones</h2>
						<p>Tenemos muchos lugares donde puedes cambiar tus cupones.</p>
					</div>
				</div>				
			</div>
		</div>
	</div>
	
	<div class="about">
		<div class="container">
			<div class="col-md-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" >
				<h2>Acerca de</h2>
				<img src="images/62.jpg" class="img-responsive"/>			
			</div>
			
            <div class="col-md-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                <h2>¿Que es Ecomonedas?</h2>
                <p>
                    Ecomonedas es una moneda virtual que ayuda al medio ambiente.Se realiza mediante el cambio de materiales reciclables, previamente limpiador y ordenados según tipo,luego son llevados a diferentes centros de acopio para ser cambiados por] cupones dediferentes productos y servicios.
                </p>
            </div>
		</div>
	</div>
	
	<div class="lates">
		<div class="container">
			<div class="text-center">
				<h2>Lates News</h2>
			</div>
			<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
				<img src="images/4.jpg" class="img-responsive"/>
				<h3>Template built with Twitter Bootstrap</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum erat 
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				</p>
			</div>
			
			<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
				<img src="images/4.jpg" class="img-responsive"/>
				<h3>Template built with Twitter Bootstrap</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum erat 
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				</p>
			</div>
			
			<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms">				
				<img src="images/4.jpg" class="img-responsive"/>
				<h3>Template built with Twitter Bootstrap</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum erat 
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				libero, pulvinar tincidunt leo consectetur eget. Curabitur lacinia pellentesque
				</p>
			</div>
		</div>
	</div>
	
	<section id="partner">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2>Our Partners</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>
            </div>    

            <div class="partners">
                <ul>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" src="images/partners/partner1.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" src="images/partners/partner2.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms" src="images/partners/partner3.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms" src="images/partners/partner4.png"></a></li>
                    <li> <a href="#"><img class="img-responsive wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1500ms" src="images/partners/partner5.png"></a></li>
                </ul>
            </div>        
        </div><!--/.container-->
    </section><!--/#partner-->
	
	<section id="conatcat-info">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="media contact-info wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="pull-left">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="media-body">
                            <h2>Have a question or need a custom quote?</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation +0123 456 70 80</p>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/.container-->    
    </section><!--/#conatcat-info-->
	
	<footer>
		<div class="footer">
			<div class="container">
				<div class="social-icon">
					<div class="col-md-4">
						<ul class="social-network">
							<li><a href="#" class="fb tool-tip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="twitter tool-tip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="gplus tool-tip" title="Google Plus"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#" class="linkedin tool-tip" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#" class="ytube tool-tip" title="You Tube"><i class="fa fa-youtube-play"></i></a></li>
						</ul>	
					</div>
				</div>
				
				<div class="col-md-4 col-md-offset-4">
					<div class="copyright">
						&copy; June  2015 by <a target="_blank" href="http://bootstraptaste.com/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">Bootstrap Themes</a>. All Rights Reserved.
					</div>
                    <!-- 
                        All links in the footer should remain intact. 
                        Licenseing information is available at: http://bootstraptaste.com/license/
                        You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Company
                    -->
				</div>						
			</div>
			
			<div class="pull-right">
				<a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
			</div>		
		</div>
	</footer>

	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.1.1.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>  
	<script src="js/wow.min.js"></script>
	<script src="js/functions.js"></script>
	
  </body>
</html>
