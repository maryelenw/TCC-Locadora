<%-- 
    Document   : editFilme
    Created on : 18/09/2014, 20:30:42
    Author     : jorge_filho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="servlet" method="get">
            <input type="hidden" name="acao" value="salvarFilme">
            <input type="hidden" name="idFilme" value="0"/>
            Nome: <input type="text" name="nomeFilme" value="${filme.nomeFilme}" /><br />
            Ano: <input type="text" name="anoFilme" value="${filme.anoFilme}" /><br />
            Genero: <input type="text" name="generoFilme" value="${filme.generoFilme}" /><br />
            Diretor: <input type="text" name="diretorFilme" value="${filme.diretorFilme}" /><br />
            Codigo: <input type="text" name="codigoFilme" value="${filme.codigoFilme}" /><br />
            Midia: <input type="text" name="midiaFilme" value="${filme.midiaFilme}" /><br />
            Sinopse: <input type="text" name="sinopseFilme" value="${filme.sinopseFilme}" /><br />
            Produtora: <input type="text" name="produtoraFilme" value="${filme.produtoraFilme}" /><br />
            Classificacao Indicativa: <input type="text" name="classificacaoFilme" value="${filme.classificacaoFilme}" /><br />
            Valor Pago: <input type="text" name="valorFilmePagoLocadora" value="${filme.valorFilmePagoLocadora}" /><br />
            Classificacao: <input type="text" name="classificacaoValorFilme" value="${filme.classificacaoValorFilme}" />
            <a href="servlet?acao=salvarFilme"</a>
            <br />
            <br />
            <input type="submit" value="Enviar" />
        </form>
    <c:import url="rodape.jsp" />
</body>
</html>
