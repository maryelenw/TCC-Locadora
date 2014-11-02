<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Usu�rio</h1>
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-edit fa-fw"></i> Lista de Locadora
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-funcionarios">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nome</th>
                                <th>Cnpj</th>
                                <th>Rua</th>
                                <th>N�mero</th>
                                <th>Complemento</th>
                                <th>Bairro</th>
                                <th>Cidade</th>
                                <th>Estado</th>
                                <th>Telefone Comercial</th>
                                <th>Telefone Contato</th>
                                <th>Email</th>
                                <th>Site</th>
                                <th width="160px">Acao</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="locadora" items="${locadora}">


                                <tr class="odd gradeX">
                                    <td>${locadora.id}</td>
                                    <td>${locadora.nome}</td>
                                    <td>${locadora.Cnpj}</td>
                                    <td>${locadora.Rua}</td>
                                    <td>${locadora.Numero}</td>
                                    <td>${locadora.Complemento}</td>
                                    <td>${locadora.Bairro}</td>
                                    <td>${locadora.Cidade}</td>
                                    <td>${locadora.Estado}</td>
                                    <td>${locadora.TelefoneResidencial}</td>
                                    <td>${locadora.TelefoneContato}</td>
                                    <td>${locadora.TelefoneEmail}</td>
                                    <td>${locadora.TelefoneSite}</td>
                                    <td>
                                        <a href="#" class="btnAlterar" id="${locadora.id}">
                                            <i class="fa fa-edit fa-fw"></i>Detalhe
                                        </a>
                                        &nbsp;
                                        <a href="#" class="btnExcluir" id="${locadora.id}">
                                            <i class="fa fa-trash-o fa-fw"></i>Excluir
                                        </a>                        
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel-body -->
    </div>
</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- Page-Level Demo Scripts - Tables - Use for reference -->

<script>

    $(document).ready(function() {
        $('#dataTables-funcionarios').dataTable();
    });

    $(".btnAlterar").click(function() {
        $("#conteudoForm").load("servlet", {
            //variaveis de controle
            txtObjeto: 'locadora'
            , txtMetodo: 'detalhe'
                    //variaveis para o objeto
            , txtId: this.id
        }, function(responseTxt, statusTxt, xhr) {
            if (statusTxt == "error")
                alert("Error: " + xhr.status + ": " + xhr.statusText);
        });
    });

    $(".btnExcluir").click(function() {
        if (confirm('Deseja realmente excluir o registro?')) {
            $("#conteudoForm").load("servlet", {
                //variaveis de controle
                txtObjeto: 'locadora'
                , txtMetodo: 'deletar'
                        //variaveis para o objeto
                , txtId: this.id
            }, function(responseTxt, statusTxt, xhr) {
                if (statusTxt == "error")
                    alert("Error: " + xhr.status + ": " + xhr.statusText);
            });
        }
    });

</script>
