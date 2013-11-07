/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.operation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.daw.bean.RepositorioBean;
import net.daw.dao.RepositorioDao;
import net.daw.helper.Contexto;
import net.daw.parameter.RepositorioParam;

/**
 *
 * @author al037793
 */
public class RepositorioNew2 implements Operation {
    
    @Override
    public Object execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Contexto oContexto = (Contexto) request.getAttribute("contexto");
        oContexto.setVista("jsp/mensaje.jsp");
        RepositorioBean oRepositorioBean = new RepositorioBean();
        RepositorioDao oRepositorioDao = new RepositorioDao(oContexto.getEnumTipoConexion());
        RepositorioParam oRepositorioParam = new RepositorioParam(request);
        oRepositorioBean = oRepositorioParam.loadId(oRepositorioBean);
        try {
            oRepositorioBean = oRepositorioParam.load(oRepositorioBean);
        } catch (NumberFormatException e) {
            return "Tipo de dato incorrecto en uno de los campos del formulario";
        }
        try {
            oRepositorioDao.set(oRepositorioBean);
        } catch (Exception e) {
            throw new ServletException("RepositorioController: Update Error: Phase 2: " + e.getMessage());
        }
        return "Se ha añadido la información del repositorio con id=" + Integer.toString(oRepositorioBean.getId());
    }
    
}
