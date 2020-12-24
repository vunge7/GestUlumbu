/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Abilio Caculo
 */
@Entity
@Table(name = "pesquisa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pesquisa.findAll", query = "SELECT p FROM Pesquisa p")
    , @NamedQuery(name = "Pesquisa.findByPkpesquisa", query = "SELECT p FROM Pesquisa p WHERE p.pkpesquisa = :pkpesquisa")
    , @NamedQuery(name = "Pesquisa.findByDescricao", query = "SELECT p FROM Pesquisa p WHERE p.descricao = :descricao")
    , @NamedQuery(name = "Pesquisa.findByData", query = "SELECT p FROM Pesquisa p WHERE p.data = :data")})
public class Pesquisa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pkpesquisa")
    private Integer pkpesquisa;
    @Size(max = 500)
    @Column(name = "descricao")
    private String descricao;
    @Column(name = "data")
    @Temporal(TemporalType.DATE)
    private Date data;

    public Pesquisa() {
    }

    public Pesquisa(Integer pkpesquisa) {
        this.pkpesquisa = pkpesquisa;
    }

    public Integer getPkpesquisa() {
        return pkpesquisa;
    }

    public void setPkpesquisa(Integer pkpesquisa) {
        this.pkpesquisa = pkpesquisa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pkpesquisa != null ? pkpesquisa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pesquisa)) {
            return false;
        }
        Pesquisa other = (Pesquisa) object;
        if ((this.pkpesquisa == null && other.pkpesquisa != null) || (this.pkpesquisa != null && !this.pkpesquisa.equals(other.pkpesquisa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Pesquisa[ pkpesquisa=" + pkpesquisa + " ]";
    }
    
}
