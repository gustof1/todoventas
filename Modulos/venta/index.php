<?php
	session_start();
	include_once "../php_conexion.php";
	include_once "class/class.php";
	include_once "../funciones.php";
	include_once "../class_buscar.php";

	if($_SESSION['tipo_user']=='a' or $_SESSION['tipo_user']=='c'){
	}else{
		header('Location: ../../php_cerrar.php');
	}

	$usu=$_SESSION['cod_user'];

	$oPersona=new Consultar_Cajero($usu);
	$cajero_nombre=$oPersona->consultar('nom').' '.$oPersona->consultar('ape');

	$pa=mysql_query("SELECT * FROM Cajero WHERE usu='$usu'");
	while($row=mysql_fetch_array($pa)){
		$id_bodega=$row['deposito'];
		$oDeposito=new Consultar_Deposito($id_bodega);
		$nombre_deposito=$oDeposito->consultar('nombre');
	}

	if(!empty($_GET['del'])){
		$id=limpiar($_GET['del']);
		mysql_query("DELETE FROM caja_tmp WHERE usu='$usu' and id='$id'");
		header("Location: index.php");
	}
?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Ventas</title>
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

    <?php include_once "../../menu/m_venta.php"; ?>
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
                                <input type="text" name="buscar" autocomplete="on" class="input-xxlarge search-query"
                                autofocus placeholder="Buscar Cliente por Documento o Nombres">
                            </div>
                            <button type="submit" class="btn" name="buton"><strong>Buscar</strong></button>
														<a href="../../Modulos/Clientes/crear_cliente.php" class="btn btn-primary btn-large">registrar</a>
                        </form>
                        </center>
                    </td>
                  </tr>
                </table>

                <table class="table table-bordered">
                  <tr class="well">
                    <td width="18%"><strong>Documento</strong></td>
                    <td width="62%"><strong>Nombre y Apellidos</strong></td>
                  </tr>
                    <?php
                        if(!empty($_POST['buscar'])){
                            $buscar=limpiar($_POST['buscar']);
                            $pa=mysql_query("SELECT * FROM cliente, persona, username WHERE
username.usu=persona.doc and username.tipo='cliente' and (persona.doc='$buscar' or persona.nom LIKE '%$buscar%' or persona.ape LIKE '%$buscar%')");
                            if($row=mysql_fetch_array($pa)){
                              $url=cadenas().encrypt($row['doc'],'URLCODIGO');
                    ?>
                   <tr>
                    <td><?php echo $row['doc']; ?></td>
                    <td>
                        <a href="../Clientes/crear_cliente.php?doc=<?php echo $url; ?>" title="Editar Cliente">
                            <?php echo $row['nom'].' '.$row['ape']; ?>
                        </a>
                    </td>                 
					<td>
						<center>
                            <a href="index.php?del=<?php echo $url; ?>" class="btn btn-mini" title="Remover Cliente">
                               <i class="icon-remove"></i>
                            </a>
                        </center>
                    </td>
                  </tr>
							<?php 
                            $nomv=$row['nom'].' '.$row['ape'];
                            $civ=$row['doc'];
                            $paa=mysql_query("SELECT * FROM caja_tmp WHERE caja_tmp.nom=$nomv and caja_tmp.ci=$civ");
                            if($roow=mysql_fetch_array($pa)){
                                  mysql_query("UPDATE caja_tmp SET nom=$nomv and ci=$civ");
                            }
                            else{
                               mysql_query("INSERT INTO caja_tmp (nom, ci) VALUES ($nomv, $civ)");
                            }
                   } } ?>
                </table>

            </td>
          </tr>
        </table>
    </div>


	<div align="center">
    	<table width="90%">
          <tr>
            <td>
            	<table class="table table-bordered">
                  <tr class="well">
                    <td>
                   	    <div class="row-fluid">
	                        <div class="span6">
                            	<form name="form2" action="" method="post">
                                    <strong>Codigo o Nombre del Producto</strong><br>
                                    <input type="text" autofocus list="browsers" name="buscar" autocomplete="off" class="input-xxlarge" required>
                                    <datalist id="browsers">
                                        <?php
                                            $pa=mysql_query("SELECT producto.nombre FROM contenido, producto
                                            WHERE producto.codigo=contenido.producto and contenido.deposito='$id_bodega'");
                                            while($row=mysql_fetch_array($pa)){
                                                echo '<option value="'.$row['nombre'].'">';
                                            }
                                        ?>
                                    </datalist>
                                </form>
                            </div>
    	                    		<div class="span3">
                                    	<strong>Cajero: </strong> <?php echo $cajero_nombre; ?><br>
                                        <i class="icon-ok"></i> <strong>Deposito: </strong> <?php echo $nombre_deposito; ?><br>
                                        <i class="icon-ok"></i> <strong>Fecha: </strong> <?php echo fecha(date('Y-m-d')); ?>
                                    </div>
															<div class="span3" align="right">

															<strong>Cliente: </strong><?php echo $row['nom'].' '.$row['ape']; ?><br>
															<i class="icon-ok"></i> <strong>Cedula de Identida: </strong> <?php echo $row['doc']; ?><br>
															</div>
                        </div>
                    </td>
                  </tr>
                </table>
                <?php
					if(!empty($_POST['new_cant'])){
						$new_cant=limpiar($_POST['new_cant']);
						$ncodigo=limpiar($_POST['ncodigo']);
						mysql_query("UPDATE caja_tmp SET cant='$new_cant' WHERE producto='$ncodigo' and usu='$usu'");
					}
                    if(!empty($_POST['new_valor'])){
						$new_valor=limpiar($_POST['new_valor']);
						$ncodigo=limpiar($_POST['ncodigo']);
						mysql_query("UPDATE caja_tmp SET valor='$new_valor' WHERE producto='$ncodigo' and usu='$usu'");
					}

					if(!empty($_POST['ncodigo_ref'])){
						$referencia=limpiar($_POST['referencia']);
						$ref_ant=limpiar($_POST['ref_ant']);
						$ncodigo=limpiar($_POST['ncodigo_ref']);

						if($referencia==''){
							mysql_query("UPDATE caja_tmp SET ref='' WHERE producto='$ncodigo' and usu='$usu' and ref='$ref_ant'");
						}else{
							$pa=mysql_query("SELECT * FROM caja_tmp WHERE caja_tmp.ref='$referencia'");
							if($row=mysql_fetch_array($pa)){
								echo mensajes('El Numero de Referencia "'.$referencia.'" Esta siendo usada','rojo');
							}else{
								mysql_query("UPDATE caja_tmp SET ref='$referencia' WHERE producto='$ncodigo' and usu='$usu' and ref='$ref_ant'");
							}
						}

					}

                	if(!empty($_POST['buscar'])){
						$buscar=limpiar($_POST['buscar']);
						$poa=mysql_query("SELECT producto.codigo FROM producto, contenido
						WHERE contenido.deposito='$id_bodega' and (producto.codigo='$buscar' or producto.nombre='$buscar') GROUP BY producto.nombre");
						if($roow=mysql_fetch_array($poa)){
							$codigo=$roow['codigo'];
							$pa=mysql_query("SELECT * FROM caja_tmp WHERE producto='$codigo' and usu='$usu' and ref=''");
							if($row=mysql_fetch_array($pa)){
								$cant=$row['cant']+1;
								mysql_query("UPDATE caja_tmp SET cant='$cant' WHERE producto='$codigo' and usu='$usu'");
							}else{
								mysql_query("INSERT INTO caja_tmp (producto, cant, usu) VALUES ('$codigo','1','$usu')");
							}
						}else{
							echo mensajes('El Producto que Busca no se encuentra Registrado en la Base de Datos','rojo');
						}
					}
                ?>

                <div class="row-fluid">
	                <div class="span8">
                    	<div style="width:100%; height:300px; overflow: auto;">
                        <table class="table table-bordered">
                            <tr class="well">
                            	<td><strong>Codigo</strong></td>
                                <td><strong><center>Cant.</center></strong></td>
                                <td><strong><center>Tara</center></strong></td>
                                <td><strong><center>Bruto</center></strong></td>
                                <td><strong>Referencia</strong></td>
                                <td><strong>Descripcion del Producto</strong></td>
                                <td><strong><div align="right">Valor</div></strong></td>
                                <td><strong><div align="right">Importe</div></strong></td>
                                <td></td>
                            </tr>
                            <?php
								$neto=0;$item=0;$tara=0;$bruto=0;
                                $pa=mysql_query("SELECT * FROM caja_tmp, producto WHERE caja_tmp.usu='$usu' and caja_tmp.producto=producto.codigo");
                                while($row=mysql_fetch_array($pa)){
									$item=$item+$row['cant'];
									##### CONSULTAR IVA ###################
									$oIVA=new Consultar_IVA($row['ivaventa']);
									$iva=$oIVA->consultar('valor');
                                    ##### Calcular el valor e importe ######
                                    $defecto=strtolower($row['defecto']);
                                    $valor=$row[$defecto.'_venta'];
                                    $importe=$row['cant']*$row['valor'];
									$neto=$neto+$importe;
                                    $tara=$row['cant']*2;
                                    $bruto=$neto-$tara;
                                    ########################################
									if($row['ref']==NULL){
										$referencia='Sin Referencia';
									}else{
										$referencia=$row['ref'];
									}
                            ?>
                            <tr>
                            	<td>
                                    <?php echo $row['codigo']; ?></td>  
                                </td>
                                <td>
                                    <center>
                                        <a href="#m<?php echo $row['id']; ?>" role="button" class="btn btn-mini" data-toggle="modal">
                                            <strong><?php echo $row['cant']; ?></strong>
                                        </a>
                                    </center>
                                </td>
                                <td>
                                    <?php echo $tara; ?>
                                      
                                </td>
                                <td>
                                    <?php echo $bruto; ?></td>  
                                </td>
                                <td>
                                	<a href="#r<?php echo $row['id']; ?>" role="button" class="btn btn-mini" data-toggle="modal">
										<strong><?php echo $referencia; ?></strong>
                                    </a>
                                </td>
                                <td><?php echo $row['nombre']; ?></td>
                                
                                <td><center>
                                    	<a href="#v<?php echo $row['id']; ?>" role="button" class="btn btn-mini" data-toggle="modal">
											<strong><?php echo $row['valor']; ?>,00</strong>
                                        </a>
                                    </center></td>
                                <td><div align="right">$ <?php echo formato($importe); ?></div></td>
                                <td>
                                    <center>
                                        <a href="index.php?del=<?php echo $row['id']; ?>" class="btn btn-mini" title="Remover de la Lista de Compra">
                                            <i class="icon-remove"></i>
                                        </a>
                                    </center>
                                </td>
                            </tr>

                             <div id="r<?php echo $row['id']; ?>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <form name="forme" action="" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel" align="center">Referencia del Producto<br>[<?php echo $row['nombre']; ?>]</h3>
                                </div>
                                <div class="modal-body" align="center">
                                	<input type="hidden" name="ncodigo_ref" value="<?php echo $row['codigo']; ?>">
                               		<strong>Referencia del Producto</strong><br>
                                    <input type="text" name="referencia" value="<?php echo $row['ref']; ?>" class="input-xlarge" autocomplete="off">
                                    <input type="hidden" name="ref_ant" value="<?php echo $row['ref']; ?>">
                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true"><strong>Cerrar</strong></button>
                                    <button type="submit" class="btn btn-primary"><strong>Registrar Referencia</strong></button>
                                </div>
                                </form>
                            </div>



                    <div id="v<?php echo $row['id']; ?>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <form name="forme" action="" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel" align="center">Actualizar Precio<br>[<?php echo $row['nombre']; ?>]</h3>
                                </div>
                                <div class="modal-body" align="center">
                                	<input type="hidden" name="ncodigo" value="<?php echo $row['codigo']; ?>">
                               		<strong>Nueva Cantidad</strong><br>
                                    <input type="number" name="new_valor" value="<?php echo $valor; ?>" autocomplete="off" required>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true"><strong>Cerrar</strong></button>
                                    <button type="submit" class="btn btn-primary"><strong>Actualizar Cantidad</strong></button>
                                </div>
                                </form>
                            </div>



                            <div id="m<?php echo $row['id']; ?>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <form name="forme" action="" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel" align="center">Actualizar Cantidad<br>[<?php echo $row['nombre']; ?>]</h3>
                                </div>
                                <div class="modal-body" align="center">
                                	<input type="hidden" name="ncodigo" value="<?php echo $row['codigo']; ?>">
                               		<strong>Nueva Cantidad</strong><br>
                                    <input type="number" name="new_cant" min="1" value="<?php echo $row['cant']; ?>" autocomplete="off" required>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true"><strong>Cerrar</strong></button>
                                    <button type="submit" class="btn btn-primary"><strong>Actualizar Cantidad</strong></button>
                                </div>
                                </form>
                            </div>

                            <?php } ?>
                        </table>
                        </div>
                    </div>
    	            <div class="span4">
                    	<table class="table table-bordered">
                            <tr>
                                <td>
                                	<center><strong>Neto a Pagar</strong>
                                	<pre><h2 class="text-success" align="center">$ <?php echo formato($neto); ?></h2></pre>
                                    <strong>Numero de Items: <br><span class="badge badge-success"><?php echo $item; ?></span></strong></center>
                                </td>
                            </tr>
                    	</table>
                        <?php if($neto<>0){ ?>
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                	<div align="center">
                                        <a href="#contado" role="button" class="btn" data-toggle="modal">
                                            <i class="icon-shopping-cart"></i> <strong>Compra al Contado</strong>
                                        </a>
                                	</div>
                                </td>
                            </tr>
                    	</table>
                        <?php } ?>
                    </div>
                </div>

            </td>
          </tr>
        </table>
    </div>

    <div id="contado" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<form name="contado" action="pro_contado.php" method="get">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel" align="center">Compra al Contado</h3>
        </div>
        <div class="modal-body" align="center">
        	<strong>Hola! <?php echo $cajero_nombre; ?></strong><br>
			<strong>Neto a Pagar</strong>
           	<pre><h2 class="text-success" align="center">$ <?php echo formato($neto); ?></h2></pre>
            <strong>Dinero Recibido</strong><br>
            <div class="input-prepend input-append">
				<span class="add-on"><strong><?php echo $s; ?></strong></span>
            	<input type="number" name="valor_recibido" min="<?php echo $neto; ?>" autocomplete="off" required>
                <span class="add-on"><strong>.00</strong></span>
        	</div>
            <input type="hidden" value="<?php echo $neto; ?>" name="neto">
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true"><strong>Cerrar</strong></button>
            <button type="submit" class="btn btn-primary"><strong>Registrar Compra</strong></button>
        </div>
        </form>
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
