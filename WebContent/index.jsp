<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="ao.co.angotech.entidades.Funcionario"%>
<%@page import="ao.co.angotech.jdbc.FuncionarioDAO"%>
<!DOCTYPE HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>GestHosp - Administracao</title>
<link rel="stylesheet" type="text/css" href="css/estilo.css"  />
<link rel="stylesheet" type="text/css" href="tmp/jquery-ui.css" />
<link href="css/madal.css" rel="stylesheet" />
	<script src="tmp/jquery-1.8.2.js"></script>
    <script src="js/form-validation.js"></script>
    <script src="js/addcampos.js"></script>
    <script type="http://bootboxjs.com/js/example.js"></script>
	<script src="tmp/jquery-ui.js"></script>
    <script src="tmp/jquery.maskedinput-1.3.min.js"></script>
    <script src="js/jquery-1.11.1.js"></script>
    <script src="js/ajax.js"></script>
    <script src="js/ajaxtela.js"></script>
</head>
<body>
<div id="view">
      <div id="main">
        <img src="img/Log gesthosp.jpg" alt="" width="298" height="67" class="left" />
          <a href="#" >Agenda</a> 
          <a href="#" >Facturação</a>  
          <a href="#" >Procedimentos</a> 
          <a href="#" >Laboratorio</a> 
          <a href="#" class="ative">Administração </a>  
          <a href="#" >Ajuda</a>     
      </div>
  <div id="sob_main">
         </div>
  <div id="mainMenu">
          <ul >
          <% 
		  	 String cont = request.getParameter("pesquisar");
			 if(cont.equals("f") || cont.equals("al")|| cont.equals("Novo")) 
			  {
		  %>
                <li class="ative"><a href="index.jsp?pesquisar=f">Cadastrar Funcionário<span></span></a></li>
                <li><a href="index.jsp?pesquisar=p">Pesquisar Funcionário<span></span></a></li>
                <li><a href="index.jsp?pesquisar=cg">Criar Grupos<span></span></a></li>
                <li><a href="#">Gerir Grupos<span></span></a></li>
                <li><a href="index.jsp?pesquisar=u">Usuários<span></span></a></li>
                <li><a href="#">Agenda de Trabalho<span></span></a></li>
            <% } else if (cont.equals("p") || cont.equals("Pesquisar")) { %>
                
                <li ><a href="index.jsp?pesquisar=f">Cadastrar Funcionário<span></span></a></li>
                <li class="ative"><a href="index.jsp?pesquisar=p">Pesquisar Funcionário<span></span></a></li>
                <li><a href="index.jsp?pesquisar=cg">Criar Grupos<span></span></a></li>
                <li><a href="#">Gerir Grupos<span></span></a></li>
                <li><a href="index.jsp?pesquisar=u">Usuários<span></span></a></li>
              	<li><a href="#">Agenda de Trabalho<span></span></a></li>
                <% } else if (cont.equals("cg")) { %>
                
                <li ><a href="index.jsp?pesquisar=f">Cadastrar Funcionário<span></span></a></li>
                <li ><a href="index.jsp?pesquisar=p">Pesquisar Funcionário<span></span></a></li>
                <li class="ative"><a href="index.jsp?pesquisar=cg">Criar Grupos<span></span></a></li>
                <li><a href="#">Gerir Grupos<span></span></a></li>
                <li><a href="index.jsp?pesquisar=u">Usuários<span></span></a></li>
                <li><a href="#">Agenda de Trabalho<span></span></a></li>
                
                <% } else if (cont.equals("u")) { %>
                
                <li ><a href="index.jsp?pesquisar=f">Cadastrar Funcionário<span></span></a></li>
                <li ><a href="index.jsp?pesquisar=p">Pesquisar Funcionário<span></span></a></li>
                <li ><a href="index.jsp?pesquisar=cg">Criar Grupos<span></span></a></li>
                <li><a href="#">Gerir Grupos<span></span></a></li>
                <li class="ative"><a href="index.jsp?pesquisar=u">Usuários<span></span></a></li>
                <li><a href="#">Agenda de Trabalho<span></span></a></li>
                
                <% } else if (cont.equals("Modificar")) { %>
                
                <li ><a onclick = "window.history.back()" style="color:#CCC; cursor: pointer;">Voltar >></a><a href="#"><span style="color:#BA122B;">Modificar</span></a></li>
               
                <% } else if (cont.equals("Arquivo")) { %>
                <li ><a href="index.jsp?pesquisar=f" onclick = "Window.history.back()" style="color:#CCC;"> Voltar >></a><a href="#"><span style="color:#BA122B;">Arquivos</span></a></li>
                <%}else {%>
                	<li><a href="index.jsp?pesquisar=f">Cadastrar Funcionário<span></span></a></li>
                    <li><a href="index.jsp?pesquisar=p">Pesquisar Funcionário<span></span></a></li>
                    <li><a href="index.jsp?pesquisar=cg">Criar Grupos<span></span></a></li>
                    <li><a href="#">Gerir Grupos<span></span></a></li>
                	<li><a href="index.jsp?pesquisar=u">Usuários<span></span></a></li>
                    <li><a href="#">Agenda de Trabalho<span></span></a></li>
                	<%  } %>
                
          </ul>
      </div>
  <div id="content">
       <%
	       String pesquisar = request.getParameter("pesquisar");
		   if(pesquisar.equals("f")|| pesquisar.equals("Novo")){
	   %>
           <jsp:include page="administracao/funcionario.jsp" /> 
       <%
		   } else if(pesquisar.equals("cg")) {
	   %>  
          <jsp:include page="administracao/cr_grupo.jsp" />
	  <% } 
	  	  else if(pesquisar.equals("p") || request.getParameter("pesquisar").equals("Pesquisar") ) {
			  
	  %>
          <jsp:include page="administracao/pesquisar.jsp" />
          
      <% } 
	      else if(pesquisar.equals("gg")) {
		  
		%> 
           <jsp:include page="administracao/usuario.jsp" />
        <%}
		   else if(pesquisar.equals("Modificar")) {
        %> 
           <jsp:include page="administracao/Editfuncionario.jsp" />
        <%}
		   else if(pesquisar.equals("ms")) {
		  %> 
		           <jsp:include page="administracao/mensagem.jsp" />
        <% }else if(pesquisar.equals("msq")) {
		  %> 
		           <jsp:include page="administracao/mensagens.jsp" />
		 <%}  
		  else if(pesquisar.equals("msq")) {
		  %> 
		           <jsp:include page="administracao/mensagenss.jsp" />
		 <%}  
		 else if(pesquisar.equals("mss")) {  %> 
		           <jsp:include page="administracao/mensagenss.jsp" />
		 <%}  
		   if(pesquisar.equals("u")) {  %>
		   <jsp:include page="administracao/usuario.jsp" />
		<%} 
		   else if(pesquisar.equals("Arquivo")) {
				  
				%> 
		           <jsp:include page="administracao/arquivos.jsp" />
		        <%}
		%>
        
       
      </div>
      <div id="foot">
        Angotech - Todos Direitos Reservados &copy; 2014 
      </div>
</div>
</body>
<script>
function voltar() {
    history.back();
}
</script>
</html>
