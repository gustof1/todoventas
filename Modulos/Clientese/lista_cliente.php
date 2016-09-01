<?php
	session_start();
	include_once "../php_conexion.php";
	include_once "class/class.php";
	include_once "../funciones.php";
	include_once "../class_buscar.php";
	if($_SESSION['tipo_user']=='a'){
	}else{
		header('Location: ../../php_cerrar.php');
	}
?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Listado de Clientes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="../../css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../../ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="../../ico/favicon.png">
  </head>

  <body>

    <?php include_once "../../menu/m_cliente.php"; ?>
	<div align="center">
    	<table width="90%">
          <tr>
            <td>
            	<table class="table table-bordered">
                  <tr class="well">
                    <td>
                    	<h1 align="center">
                    		Consultar Clientes Registrados
                    	</h1>
                        <center>
                      	<form name="form3" method="post" action="" class="form-search">
                        	<div class="input-prepend input-append">
								<span class="add-on"><i class="icon-search"></i></span>
                        		<input type="text" name="buscar" autocomplete="off" class="input-xxlarge search-query"
                                autofocus placeholder="Buscar Cliente por Documento o Nombres">
                            </div>
                            <button type="submit" class="btn" name="buton"><strong>Buscar</strong></button>
                    	</form>
                        </center>
                  	</td>
                  </tr>
                </table>

            	<table class="table table-bordered">
                  <tr class="well">
                    <td width="18%"><strong>Documento</strong></td>
                    <td width="62%"><strong>Nombre y Apellidos</strong></td>
                    <td width="20%"><div align="right"><strong>Cupo Disponible</strong></div></td>
                  </tr>
                  	<?php
				  		if(!empty($_POST['buscar'])){
							$buscar=limpiar($_POST['buscar']);
							$pa=mysql_query("SELECT * FROM cliente, persona, username WHERE
username.usu=persona.doc and username.tipo='cliente' and (persona.doc='$buscar' or persona.nom LIKE '%$buscar%' or persona.ape LIKE '%$buscar%')");
							while($row=mysql_fetch_array($pa)){
								$url=cadenas().encrypt($row['doc'],'URLCODIGO');
					?>
                   <tr>
                    <td><?php echo $row['doc']; ?></td>
                    <td>
                    	<a href="crear_cliente.php?doc=<?php echo $url; ?>" title="Editar Cliente">
							<?php echo $row['nom'].' '.$row['ape']; ?>
                        </a>
                    </td>
                    <td>
                    	<div align="right"> $ <?php echo formato($row['cupo']); ?></div>
                    </td>
                  </tr>
                  <?php }} ?>
                </table>

            </td>
          </tr>
        </table>
    </div>
    <!-- Le javascript ../../js/jquery.js
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap-transition.js"></script>
    <script src="../../js/bootstrap-alert.js"></script>
    <script src="../../js/bootstrap-modal.js"></script>
    <script src="../../js/bootstrap-dropdown.js"></script>
    <script src="../../js/bootstrap-scrollspy.js"></script>
    <script src="../../js/bootstrap-tab.js"></script>
    <script src="../../js/bootstrap-tooltip.js"></script>
    <script src="../../js/bootstrap-popover.js"></script>
    <script src="../../js/bootstrap-button.js"></script>
    <script src="../../js/bootstrap-collapse.js"></script>
    <script src="../../js/bootstrap-carousel.js"></script>
    <script src="../../js/bootstrap-typeahead.js"></script>

  </body>
</html>
