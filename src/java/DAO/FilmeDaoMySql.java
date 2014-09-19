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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public void editar(Filme filme) {

        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection conex = DriverManager.getConnection("jdbc:mysql://localhost/bdreservalocadora", "root", "");
            String sql
                    = "update into Filme nomeFilme = ?, anoFilme = ?,generoFilme = ?,diretorFilme = ?,codigoFilme = ?,"
                    + "midiaFilme = ?,sinopseFilme = ?,produtoraFilme = ?,classificacaoIndicativaFilme = ?,"
                    + "valorPagoLocadora = ?,classificacaoValorFilme = ? "
                    + " WHERE idFilme = ? ";
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

    public void excluir(int idFilme) {

        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection conex = DriverManager.getConnection("jdbc:mysql://localhost/bdreservalocadora", "root", "");
            String sql
                    = "DELETE FROM Filme "
                    + "WHERE idFilme = ?";
            PreparedStatement stmt = conex.prepareStatement(sql);
            stmt.setInt(1, idFilme);

            stmt.execute();
            conex.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public List<Filme> getAll() {

        List<Filme> lista = new ArrayList<Filme>();
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection conex = DriverManager.getConnection("jdbc:mysql://localhost/senai", "root", "");
            String sql = "select * from filme";
            PreparedStatement stmt = conex.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            Filme f = new Filme();
            f.setIdFilme(rs.getInt("idFilme"));
            f.setNomeFilme(rs.getString("nomeFilme"));
            f.setAnoFilme(rs.getInt("anoFilme"));
            f.setClassificacaoIndicativaFilme(rs.getString("classificacaoIndicativaFilme"));
            f.setClassificacaoValorFilme(rs.getString("classificacaoValorFilme"));
            f.setCodigoFilme(rs.getInt("codigoFilme"));
            f.setGeneroFilme(rs.getString("generoFilme"));
            f.setProdutoraFilme(rs.getString("produtoraFilme"));
            f.setMidiaFilme(rs.getString("midiaFilme"));
            f.setDiretorFilme(rs.getString("diretorFilme"));
            f.setSinopseFilme(rs.getString("sinopseFilme"));
            f.setValorPagoLocadora(rs.getDouble("valorPagoLocadora"));

            lista.add(f);

            conex.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return lista;
    }

    public Filme getById(int idFilme) throws ClassNotFoundException {
        
        Filme f = new Filme();
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection conex = DriverManager.getConnection("jdbc:mysql://localhost/senai", "root", "");
            String sql = "SELECT "
                    + "idFilme, "
                    + "nomeFilme, "
                    + "anoFilme, "
                    + "diretorFilme, "
                    + "codigoFilme, "
                    + "midiaFilme, "
                    + "sinopseFilme, "
                    + "produtoraFilme, "
                    + "classificacaoIndicativaFilme, "
                    + "valorPagoLocadora "
                    + "classificacaoValorFilme, "
                    + "generoFilme "
                    + "FROM Filme WHERE idFilme = ?";
            PreparedStatement stmt = conex.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            f.setIdFilme(rs.getInt("idFilme"));
            f.setNomeFilme(rs.getString("nomeFilme"));
            f.setAnoFilme(rs.getInt("anoFilme"));
            f.setDiretorFilme(rs.getString("diretorFilme"));
            f.setCodigoFilme(rs.getInt("codigoFilme"));
            f.setMidiaFilme(rs.getString("midiaFilme"));
            f.setSinopseFilme(rs.getString("sinopseFilme"));
            f.setProdutoraFilme(rs.getString("produtoraFilme"));
            f.setClassificacaoIndicativaFilme(rs.getString("classificacaoIndicativaFilme"));
            f.setValorPagoLocadora(rs.getDouble("valorPagoLocadora"));
            f.setClassificacaoIndicativaFilme(rs.getString("classificacaoValorFilme"));
            f.setGeneroFilme(rs.getString("generoFilme"));

            conex.close();
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return f;

    }

}
