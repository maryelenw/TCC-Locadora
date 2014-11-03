<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Filme</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<c:set var="filme" value="${filme}" />
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-edit fa-fw"></i> Altera��o de Filme
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form role="form" id="formAtual" name="formAtual">
                    <div class="panel-body">
                        <form role="form" id="formAtual" name="formAtual">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>Nome</label>
                                        <input class="form-control" placeholder="Informe o nome" type="text" id="txtNome" name="txtNome" value="${filme.nome}">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>Descri��o</label>
                                        <input class="form-control" placeholder="Informe a Descri��o" type="text" id="txtDescricao" name="txtDescricao" value="${filme.descricao}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label>Foto</label>
                                        <input class="form-control" placeholder="Insira a Foto" type="text" id="txtFoto" name="txtFoto" value="${filme.foto}">
                                    </div>
                                </div> 
                            </div>
                            <div class="row">
                                <div class="col-lg-12" align="right">
                                    <input type="hidden" name="txtId" id="txtId" value="${filme.id}" >
                                    <input type="hidden" name="txtObjeto" id="txtObjeto" value="filme" >
                                    <input type="hidden" name="txtMetodo" id="txtMetodo" value="alterar">
                                    <button tabindex="5" type="button" class="btn btn-default" id="btnEnviar">Salvar</button>
                                </div>
                            </div>
                        </form>
                        <!-- /.row (nested) -->
                    </div>
                    <!-- /.panel-body -->
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->



    <script type="text/javascript">
        $(document).ready(function() {

        });

        $("#btnEnviar").click(function() {
            $("#conteudoForm").load("servlet", {
                //variaveis de controle
                txtObjeto: document.forms["formAtual"].elements["txtObjeto"].value
                        , txtMetodo: document.forms["formAtual"].elements["txtMetodo"].value
                        //variaveis para o objeto locadora
                        , txtId: document.forms["formAtual"].elements["txtId"].value
                        , txtNome: document.forms["formAtual"].elements["txtNome"].value
                        , txtDescricao: document.forms["formAtual"].elements["txtDescricao"].value
                        , txtFoto: document.forms["formAtual"].elements["txtFoto"].value
            }, function(responseTxt, statusTxt, xhr) {
                if (statusTxt == "error")
                    alert("Error: " + xhr.status + ": " + xhr.statusText);
            });
        });

    </script>
