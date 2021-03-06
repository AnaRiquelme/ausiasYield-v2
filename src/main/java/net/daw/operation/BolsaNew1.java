/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package net.daw.operation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.daw.bean.BolsaBean;
import net.daw.dao.DocumentoDao;
import net.daw.dao.BolsaDao;
import net.daw.helper.Contexto;
import net.daw.parameter.BolsaParam;

/**
 *
 * @author Jacobo Segovia
 */
public class BolsaNew1 implements Operation{
    
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Contexto oContexto = (Contexto) request.getAttribute("contexto");
        BolsaParam oBolsaParam = new BolsaParam(request);
        BolsaBean oBolsaBean = new BolsaBean();
        DocumentoDao oDocumento1Dao = new DocumentoDao(oContexto.getEnumTipoConexion());
        DocumentoDao oDocumento2Dao = new DocumentoDao(oContexto.getEnumTipoConexion());
        try {
            oBolsaBean = oBolsaParam.load(oBolsaBean);
            oBolsaBean.setDocumento1(oDocumento1Dao.get(oBolsaBean.getDocumento1()));
            oBolsaBean = oBolsaParam.load(oBolsaBean);
            oBolsaBean.setDocumento2(oDocumento2Dao.get(oBolsaBean.getDocumento2()));
        } catch (NumberFormatException e) {
            oContexto.setVista("jsp/mensaje.jsp");
            return "Tipo de dato incorrecto en uno de los campos del formulario";
        }
        oContexto.setVista("jsp/bolsa/form.jsp");
        return oBolsaBean;
    }
}
