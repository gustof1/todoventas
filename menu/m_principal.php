<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#" style="color:#FFF">Paraba I.T.</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="Principal.php" style="color:#FFF">Principal</a></li>
               <?php if($_SESSION['tipo_user']=='a'){   ?>
              <li class="dropdown">
              	<a href="#" style="color:#FFF" class="dropdown-toggle" data-toggle="dropdown">Producto y Proveedores <b class="caret"></b></a>
                <ul class="dropdown-menu">
                	<li><a href="Modulos/Producto/crear_producto.php"><i class="icon-plus"></i> Crear Producto</a></li>
                    <li><a href="Modulos/Producto/listado_producto.php"><i class="icon-list"></i> Listado de Productos</a></li>
                    <li class="divider"></li>
                    <li><a href="Modulos/Producto/listado_proveedor.php"><i class="icon-plus"></i>Proveedores</a></li>
                </ul>
              </li>
              
              <li><a href="Modulos/Clientes/" style="color:#FFF">Clientes</a></li> 
              
              <?php } ?>
              <li><a href="Modulos/Venta/" style="color:#FFF">Venta</a></li>
            </ul>
            <ul class="nav pull-right">
                <li class="dropdown">
              		<a href="#" style="color:#FFF" class="dropdown-toggle" data-toggle="dropdown">
                    	Hola! <?php echo $_SESSION['user_name']; ?> <b class="caret"></b>
                    </a>
                	<ul class="dropdown-menu">
	                    <li><a href="perfil.php"><i class="icon-user"></i> Mi Perfil</a></li>
                      	<li class="divider"></li>
                      	<li><a href="php_cerrar.php"><i class="icon-off"></i> Salir</a></li>
                    </ul>
                </li>
          	</ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
<!-- /container -->