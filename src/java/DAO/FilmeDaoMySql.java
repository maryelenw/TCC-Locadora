/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Filme;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author maryelen_cassia
 */
public class FilmeDaoMySql implements FilmeDao {

    @Override
    public void salvar(Filme filme) {

        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection conex = DriverManager.getConnection("jdbc:mysql://localhost/bdreservalocadora", "root", "");
            String sql
                    = "insert into Filme (nomeFilme, anoFilme,generoFilme,diretorFilme,codigoFilme,"
                    + "midiaFilme,sinopseFilme,produtoraFilme,classificacaoIndicativaFilme,"
                    + "valorPagoLocadora,classificacaoValorFilme) values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = conex.prepareStatement(sql);
            stmt.setString(1, filme.getNomeFilme());
            stmt.setInt(2, filme.getAnoFilme());
            stmt.setString(3, filme.getGeneroFilme());
            stmt.setString(4, filme.getDiretorFilme());
            stmt.setInt(5, filme.getCodigoFilme());
            stmt.setString(6, filme.getMidiaFilme());
            stmt.setString(7, filme.getSinopseFilme());
            stmt.setString(8, filme.getProdutoraFilme());
            stmt.setString(9, filme.getClassificacaoIndicativaFilme());
            stmt.setDouble(10, filme.getValorPagoLocadora());
            stmt.setString(11, filme.getClassificacaoValorFilme());

            stmt.execute();
            conex.close();

        } catch (Exception ex) {
            ex.printStackTrace();

        }

    }
}