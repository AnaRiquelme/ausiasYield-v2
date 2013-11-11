<%-- 
    Document   : form
    Created on : 07-nov-2013, 12:20:07
    Author     : al037431
--%>

<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="net.daw.helper.Enum.Connection"%>
<%@page import="net.daw.data.Mysql"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="net.daw.bean.IncidenciaBean"%>
<%@page import="net.daw.helper.Contexto"%>
<% Contexto oContexto = (Contexto) request.getAttribute("contexto");
    String strTitulo = "";
    String strControlEnabled = "";
    String strValueBoton = "Enviar";
    Integer id = 0;
    Integer id_usuario = 0;
    String resumen = "";
    String cambios = "";
    Integer id_estado = 0;
    Integer id_repositorio = 0;
    String fechaAlta = "";
    String fechaResolucion = "";

    if (oContexto.getMetodo().equals("update") || oContexto.getMetodo().equals("view")) {
        IncidenciaBean oIncidenciaBean = (IncidenciaBean) oContexto.getParametro();
        id = oIncidenciaBean.getId();
        resumen = oIncidenciaBean.getResumen();
        cambios = oIncidenciaBean.getCambios();
        id_estado = oIncidenciaBean.getId_estado();
        id_repositorio = oIncidenciaBean.getId_repositorio();
        id_usuario = oIncidenciaBean.getId_usuario();
        fechaAlta = oIncidenciaBean.getFechaAlta();
        fechaResolucion = oIncidenciaBean.getFechaResolucion();
    }
    if (oContexto.getMetodo().equals("view")) {
        strTitulo = "Vista";
        strControlEnabled = "disabled=\"true\"";
        strValueBoton = "Cerrar";
    }
    if (oContexto.getMetodo().equals("update")) {
        strTitulo = "Edici�n";
        strValueBoton = "Modificar";
    }
    if (oContexto.getMetodo().equals("new")) {
        strTitulo = "Alta";
        strValueBoton = "Crear";
    }
/*
    if (oContexto.getMetodo().equals("new")) {
        Mysql oMysql;
        net.daw.helper.Enum.Connection enumTipoConexion;
        oMysql = new Mysql();
        oMysql.conexion(Connection.DataSource);
        
        id_estado = Integer.parseInt(oMysql.getId("estado", "true", "true"));
    }*/

%>
<h1><%=strTitulo%> de cliente</h1>
<form class="semantic" action="Controller" method="post" id="incidenciaForm">
    <fieldset>
        <legend>Formulario de Repositorio</legend>
        <input type="hidden" name="id" value="<%=id%>" /> 
        <input type="hidden" name="class" value="incidencia" /> 
        <input type="hidden" name="method" value="<%=oContexto.getMetodo()%>" /> 
        <input type="hidden" name="phase" value="2" />
        <div>
            <label for="Resumen_incidencia">Resumen Incidencia </label> 
            <input <%=strControlEnabled%> id="Resumen_incidencia" name="Resumen_incidencia" type="text" size="30" maxlength="50" autofocus="autofocus" value="<%=resumen%>" /><br />
        </div>
        <div>
            <label for="cambios">Cambios </label>
            <textarea <%=strControlEnabled%> id="cambios" name="cambios" type="text" size="30" maxlength="50" value="<%=cambios%>" ></textarea><br />
        </div>

        <div>
            <label for="fechaAlta">Fecha Alta: </label> 
            <input <%=strControlEnabled%> id="fechaAlta" name="fechaAlta" type="date" size="30" maxlength="50" value="<%=fechaAlta%>" /> <br />
        </div>
        <div>
            <label for="fechaResolucion">Fecha Resoluci�n: </label> 
            <input <%=strControlEnabled%> id="fechaResolucion" name="fechaResolucion" type="date" size="30" maxlength="50" value="<%=fechaResolucion%>" /> <br />
        </div>
        <div>
            <input type="submit" name="enviar" value="<%=strValueBoton%>" />
        </div>
    </fieldset>
</form>
