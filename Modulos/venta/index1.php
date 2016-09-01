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
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <style>
            body {
                padding-top: 50px;
                padding-bottom: 20px;
            }
            .table-sortable tbody tr {
              cursor: move;
              }
        </style>
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>        
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
      <?php include_once "../../menu/m_venta.php"; ?>
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
          <div class="panel panel-primary">
          <div class="panel-heading">Principal.</div>
          <div class="panel-body">
                <div class="row">
        <div class="col-md-10">
                 <div class="panel panel-default">
                  <div class="panel-heading">Registro</div>
                  <div class="panel-body">
             <form class="form-horizontal">
                 <div class="form-group">
                    
                     <label for="inputName" class="control-label col-xs-2">Cliente:</label>
                     <div class="col-xs-6">
                        
                         <input type="name" class="form-control" placeholder="Nombre">
                     </div>
                     <label for="inputName" class="control-label col-xs-1">CI:</label>
                     <div class="col-xs-3">
                        
                         <input type="name" class="form-control" placeholder="Nro. Carnet">
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="inputEmail" class="control-label col-xs-2">Direccion:</label>
                     <div class="col-xs-10">
                         <input type="email" class="form-control" placeholder="Direccion">
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="inputPassword" class="control-label col-xs-2">Telefono(s):</label>
                     <div class="col-xs-5">
                         <input type="text" class="form-control" placeholder="Nro. Telefono"> 
                     </div>
                       
                       <label class="control-label col-xs-1">Ciudad:</label>
                       <div class="col-xs-4">
                        <select class="form-control">
                            <option>El Alto</option>
                            <option>La Paz</option>
                            <option>Cochabanba</option>
                        </select>
                           </div>
                     </div>
                 
                 <div class="form-group">
                     <div class="col-xs-offset-2 col-xs-10">
                         <button type="submit" class="btn btn-primary">Enviar</button>
                             </div>
                 </div>
            </form>
                  </div>
                </div>
                    </div>
                    <div class="col-md-2">
                        <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" class="form-control input-lg" placeholder="Buscar" />
                                <span class="input-group-btn">
                                    <button class="btn btn-info btn-lg" type="button">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                <address>
                  <strong>Numero: 00001</strong><br>
                  Fecha: 23/04/2015<br>
                  Tipo De Cambio: Bolivianos<br>
                </address>

                <address>
                  <strong>Responsable: Cajero 1</strong><br>
                  
                </address>
        </div>
                    <div class="col-md-12">
                 <div class="panel panel-default">
                  <div class="panel-heading">Cotizacion</div>
                  <div class="panel-body">
                            <div class="container">
          <div class="row clearfix">
          	<div class="col-md-12 table-responsive">
      			<table class="table table-bordered table-hover table-sortable" id="tab_logic">
      				<form id="form1" name="form1" method="post">
  
    <tr>
      <th class="text-center">Nro.</th>
      <th class="text-center">Env.</th>
      <th class="text-center">Peso</th>
      <th class="text-center">Tara</th>
      <th class="text-center">Descripcion</th>
      <th class="text-center">Unidad</th>
      <th class="text-center">Bruto</th>
      <th class="text-center">Neto</th>
      <th class="text-center">Cant.</th>
      <th class="text-center">Precio</th>
      <th class="text-center">% Desc.</th>
      <th class="text-center">Importe</th>
      <th class="text-center" style="border-top: 1px solid #ffffff; border-right: 1px solid #ffffff;">
      </th>
    </tr>
    <tr id='addr0' data-id="0" >
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td data-name="sel">
						    <select name="sel0">
        				        <option value"">Select Option</option>
    					        <option value"1">Option 1</option>
        				        <option value"2">Option 2</option>
        				        <option value"3">Option 3</option>
						    </select>
						</td>
      <td><button nam"del0" class='btn btn-danger glyphicon glyphicon-remove row-remove'></button></td>
    </tr>
    <tr>
      <td colspan="12">&nbsp;</td>
    </tr>
    </form>
  </table>

      		</div>
      	</div>
      	<a id="add_row" class="btn btn-success pull-right">Add</a>
      </div>
                  </div>
                </div>
                    </div>
                    
                
                    
              </div>
  </div>
</div>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-12">
          
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Paraba Ideas 2015</p>
      </footer>
    </div> <!-- /container -->        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>
        <script type="text/javascript">
$(document).ready(function() {
    $("#add_row").on("click", function() {
        // Dynamic Rows Code
        
        // Get max row id and set new id
        var newid = 0;
        $.each($("#tab_logic tr"), function() {
            if (parseInt($(this).data("id")) > newid) {
                newid = parseInt($(this).data("id"));
            }
        });
        newid++;
        
        var tr = $("<tr></tr>", {
            id: "addr"+newid,
            "data-id": newid
        });
        
        // loop through each td and create new elements with name of newid
        $.each($("#tab_logic tbody tr:nth(0) td"), function() {
            var cur_td = $(this);
            
            var children = cur_td.children();
            
            // add new td and element if it has a nane
            if ($(this).data("name") != undefined) {
                var td = $("<td></td>", {
                    "data-name": $(cur_td).data("name")
                });
                
                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val("");
                c.attr("name", $(cur_td).data("name") + newid);
                c.appendTo($(td));
                td.appendTo($(tr));
            } else {
                var td = $("<td></td>", {
                    'text': $('#tab_logic tr').length
                }).appendTo($(tr));
            }
        });
        
        // add delete button and td
        /*
        $("<td></td>").append(
            $("<button class='btn btn-danger glyphicon glyphicon-remove row-remove'></button>")
                .click(function() {
                    $(this).closest("tr").remove();
                })
        ).appendTo($(tr));
        */
        
        // add the new row
        $(tr).appendTo($('#tab_logic'));
        
        $(tr).find("td button.row-remove").on("click", function() {
             $(this).closest("tr").remove();
        });
});




    // Sortable Code
    var fixHelperModified = function(e, tr) {
        var $originals = tr.children();
        var $helper = tr.clone();
    
        $helper.children().each(function(index) {
            $(this).width($originals.eq(index).width())
        });
        
        return $helper;
    };
  
    $(".table-sortable tbody").sortable({
        helper: fixHelperModified      
    }).disableSelection();

    $(".table-sortable thead").disableSelection();



    $("#add_row").trigger("click");
});
</script>
    </body>
</html>
