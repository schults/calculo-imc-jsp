<!DOCTYPE html>
<!-- mvn org.apache.tomcat.maven:tomcat7-maven-plugin:2.2:run -Dmaven.tomcat.port=9090 -->
<html>
<head>
	<%@page contentType="text/html" pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<title>Calculo de IMC</title>
	<style type="text/css">
	</style>
</head>
<body>
	<div class ="row-fluid">		
		<div class="col-md-4 col-md-offset-4" id="painel-meio">
		    <div class="panel panel-default" style="margin-top: 84px;">
		    	<div class="panel-heading"> 
		    		<h1>Calculo do Índice de Massa Corpórea (IMC)</h1>                               
		        </div>
		        <div class="panel-body">
		     		<div class="col-xs-2" style="margin-top: -15px;">
			        	<h3><small>Peso(kg)</small></h3>
			        	<h3><small>Altura</small></h3>	        	 
			        </div>
			        <form>
				        <div class="col-xs-8"> 
				        	<input class="form-control" type="text" name="peso"  placeholder="Peso ex: 75,8" id= "peso" autofocus="" style="margin-bottom: 10px;">
				        	<input class="form-control" type="text" name="altura"  placeholder="Altura ex: 1,8" id = "altura" style="margin-bottom: 10px;">

				        	<div id="div-radio" style="margin-bottom: 10px;">
				        		<label class="radio-inline">
	  								<input type="radio" name="genderOption" value="M"> M
								</label>
								<label class="radio-inline">
								  <input type="radio" name="genderOption"  value="F"> F
								</label>
				        	</div>
				   			
				      	</div>
				      	<div class= "col-xs-12">
				        		<button type="submit" class="btn btn-primary btn-lg btn-block" name="btn-calc" value="calc">Calcular</button>
				        	</div>
			        </form>
		        </div>
		    </div>
		</div>
	</div>
	<div class="col-md-4 col-md-offset-4" id =" resultado">
		  <%	
			 try{
	    String peso = request.getParameter("peso");
	    String altura = request.getParameter("altura");
	    String resultado="";
	    String genero = request.getParameter("genderOption");
	 	String msg ="";
	    altura = altura.replace(",", ".");
	    peso = peso.replace(",", ".");
	    if (altura != null && peso != null && genero != null){             
	        double imc = Double.parseDouble(peso) / (Double.parseDouble(altura) * Double.parseDouble(altura));
	        
	        
	       	
	        if((imc < 19.1 && genero.equals("F"))|| (imc <20.7 && genero.equals("F"))){
				msg ="<div class= 'alert alert-warning'>"+ "Você está muito abaixo do peso"+"</div>";
			
			}else if((imc >= 19.1 && imc < 25.8 && genero.equals("F"))|| (imc >= 20.7 && imc <26.4 && genero.equals("M"))){
				
				msg ="<div class= 'alert alert-success'>" +"Parabens! Você está com peso normal!" +"</div>";
			}else if((imc >= 25.8 && imc < 27.3 && genero.equals("F"))|| (imc >= 26.4 && imc <27.8 && genero.equals("M"))){
			
				msg = "<div class= 'alert alert-warning'>" + "Você esta acima do peso." +"</div>";
			}else if((imc >= 27.3 && imc < 32.3 && genero.equals("F"))|| (imc >= 27.8 && imc < 31.1 && genero.equals("M"))){
				
				msg = "<div class= 'alert alert-warning'>" + "Você está bem acima do peso, tenha cuidado! "+ "</div>";
			}else if((imc > 32.3 && genero.equals("F")) || (imc> 31.1 && genero.equals("M"))){
				
				msg = "<div class= 'alert alert-danger'>" + "Meu Deus! Você vai morrer se não procurar ajuda urgente" +"</div>";
			}else{
			
				msg = "E agora?!";
			}
			System.out.println("IMC:" + imc+"\nMsg: "+ msg );
	       	resultado = "<h1 style='text-align: center;'>" + String.format("%.2f", imc) + "\n"+ msg+"</h1>" ;
	       	out.println(resultado);
	    }
	}catch(Exception e){    
	}
		
	%>
	</div>
</body>
</html>

