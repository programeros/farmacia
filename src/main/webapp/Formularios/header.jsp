<%-- 
    Document   : header
    Created on : 20/11/2016, 19:56:29
    Author     : smarangoni
--%>


<script type="text/javascript">

    $(document).ready(function () {

        $(".dropdown-toggle").dropdown('toggle');

    });

</script>


<html lang="pt-br">
    <body>
        <div class="container-fluid">
            <div class="row">
                <header class="page-header"> 
                    <img class="logo" src="../images/logo.png" id="logo" height="100" width="100">   
                    <h1>Sistema de Gest�o de Farm�cias - SGF</h1>
                </header>
            </div> <!--Encerramento do page-header-->
        </div> 

        <!--Cria��o do menu principal da aplica��o-->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navegacao">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">SGF</a>
                </div><!--navbar-header-->

                <!-- Inicio do Menu Superior -->
                <div class="collapse navbar-collapse" id="navegacao">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastros <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Fornecedores/fornecedor.jsp">Fornecedores</a></li>
                                <li><a href="Vendedores/vendedor.jsp">Vendedores</a></li>   
                                <li><a href="Produtos/produtos.jsp">Produtos</a></li>                  
                                <li><a href="almoxarifado.jsp">Almoxarifados</a></li> 
                                <li><a href="filial.jsp">Filiais</a></li> 
                                <li><a href="Usuarios/usuarios.jsp">Usu�rios</a></li> 
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Atualiza��es <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="PedidosVendas/pedidosdeVendas.jsp">Vendas</a></li>
                                <li><a href="#">Compras</a></li>
                                <li><a href="#">Recebimentos</a></li>                    
                                <li><a href="#">Pagamentos</a></li>
                                <li><a href="#">Transferencias</a></li>	  
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Relat�rios <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="active"><a>Relatorios</a></li>
                                <li><a href="#">Compras</a></li>
                                <li><a href="#">Recebimentos</a></li>                    
                                <li><a href="#">Pagamentos</a></li>
                                <li><a href="#">Transferencias</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Sobre</a></li>
                    </ul> <!-- .navbar -->     
                </div> <!--Menu id=navegacao-->


            </div> <!--fechamento do container do menu -->
        </nav> <!--Fim do menu-->





