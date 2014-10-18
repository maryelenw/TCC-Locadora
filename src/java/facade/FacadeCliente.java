/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import DAO.ClienteDao;
import DAO.ClienteDaoMySql;
import Entity.Cliente;
import java.util.List;

/**
 *
 * @author maryelen_cassia
 */
public class FacadeCliente {

    public void salvar(Cliente cliente) {

        if ((cliente.getNomeCliente() != null)
                || (cliente.getNomeCliente() != "")) {
        }

        if ((cliente.getCpf() != null)
                || (cliente.getCpf() != "")) {
        }

        if ((cliente.getEmail() != null)
                || (cliente.getEmail() != "")) {

        }

        if ((cliente.getEndereco() != null)
                || (cliente.getEndereco() != "")) {

        }

        if ((cliente.getEstado() != null)
                || (cliente.getEstado() != "")) {

        }

        if ((cliente.getTelefoneCelular() != null)
                || (cliente.getTelefoneCelular() != "")) {

        }

        if ((cliente.getTelefoneRecado() != null)
                || (cliente.getTelefoneRecado() != "")) {

        }
        if ((cliente.getTelefoneResidencial()
                != null) || (cliente.getTelefoneResidencial() != "")) {

        }

        if ((cliente.getCidade() != null)
                || (cliente.getCidade() != "")) {

        }
        if ((cliente.getBairro() != null)
                || (cliente.getBairro() != "")) {

        }
        if ((cliente.getComplemento() != null)
                || (cliente.getComplemento() != "")) {
        }

        ClienteDaoMySql dao = new ClienteDaoMySql();
        dao.salvar(cliente);
    }

    public List<Cliente> getAll() {
        ClienteDao dao = new ClienteDaoMySql();
        return dao.getAll();
    }

    public void deletar(int id) {
        ClienteDao dao = new ClienteDaoMySql();
        dao.deletar(id);
    }

    public Cliente getById(int id) throws ClassNotFoundException {
        ClienteDao dao = new ClienteDaoMySql();
        return dao.getById(id);
    }
}