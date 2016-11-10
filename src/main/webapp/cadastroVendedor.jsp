<%-- 
    Document   : vendedor
    Created on : 03/11/2016, 15:33:22
    Author     : Michael Facul
--%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="cadastro.css"/>
        <title>Cadastro do Vendedor</title>
    </head>
    <body>
        <nav>
            <ul class="menu">                
                <li><a href="#">Pesquisar</a>
                    <ul>
                        <li><a href="vendedor.jsp">Vendedores Cadastrados</a></li>                        
                    </ul>
                </li>                 
                <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Usu�rio: ${nome}</a></li>
            </ul>
            <div class="imagem"></div>
        </nav>
        <aside>
            <div>
                
                    <legend><h2>Dados Pessoais do Vendedor</h2></legend>
                <form class="formulario" action ="AdicionarVendedor" method="get">
                    Nome: <input type="text" size="40" name="nome" />
                    Endere�o: <input type="text" size="30" name="endereco" /><br/>
                    Bairro: <input type="text" name="bairro" />
                    Cidade: <input type="text" name="cidade" />
                    Estado: <input type="text" name="estado" /><br/>
                    CEP: <input type="text" name="cep" />                    
                    Tel.: <input type="text" name="telefone" />
                    Cel.: <input type="text" name="celular" /><br/>                                        
                
                    <br/><input type="submit" value="Gravar" />
                    <input type="reset" value="Limpar" />                    
                    <input type="button" value="Voltar" onClick="history.go(-1)"> 
                </form>
            </div>
        </aside> 
    </body>
</html>
