<?php

class Proceso_Cliente{
	var $doc;		var $nom;		var $ape;	 	var $cel;
	var $sexo;		var $dir;		var $nota;		var $estado;	
	var $con;		
	
	function __construct($doc,$nom,$ape,$cel,$sexo,$dir,$nota,$estado,$con){
		$this->doc=$doc;	$this->nom=$nom;	$this->ape=$ape;	$this->cel=$cel;
		$this->sexo=$sexo;	$this->dir=$dir;	$this->nota=$nota;	$this->estado=$estado;	
		$this->con=$con;	
	}
	
	function crear(){
		$doc=$this->doc;	$nom=$this->nom;	$ape=$this->ape;	$cel=$this->cel;
		$sexo=$this->sexo;	$dir=$this->dir;	$nota=$this->nota;	$estado=$this->estado;	
		$con=$this->con;	
		mysql_query("INSERT INTO persona (doc, nom, ape, cel, sexo, dir, nota, estado) VALUES 
				('$doc','$nom','$ape','$cel','$sexo','$dir','$nota','$estado')");
		mysql_query("INSERT INTO username (usu, con, tipo) VALUES ('$doc','$con','cliente')");
		mysql_query("INSERT INTO cliente (doc, cupo) value ('$doc')");
	}
	
	function actualizar(){
		$doc=$this->doc;	$nom=$this->nom;	$ape=$this->ape;	$cel=$this->cel;
		$sexo=$this->sexo;	$dir=$this->dir;	$nota=$this->nota;	$estado=$this->estado;		
		$con=$this->con;
		
		mysql_query("UPDATE persona SET nom='$nom', ape='$ape', cel='$cel', sexo='$sexo', dir='$dir',
										nota='$nota', estado='$estado' WHERE doc='$doc'");
	}
}

?>