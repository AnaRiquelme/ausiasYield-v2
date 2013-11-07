<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="net.daw.bean.RepositorioBean"%>
<%@page import="net.daw.helper.Contexto"%>
<% Contexto oContexto = (Contexto) request.getAttribute("contexto");
    String strTitulo = "";
    String strControlEnabled = "";
    String strValueBoton = "Enviar";
    Integer id = 0;
    String titulo = "";
    String contenido = "";
    Integer id_usuario = 0;
    Integer id_lenguaje = 0;
    Integer id_documento = 0;
    Date fecha = new Date();
    if (oContexto.getMetodo().equals("update") || oContexto.getMetodo().equals("view")) {
        RepositorioBean oRepositorioBean = (RepositorioBean) oContexto.getParametro();
        id = oRepositorioBean.getId();
        titulo = oRepositorioBean.getTitulo();
        contenido = oRepositorioBean.getContenido();
        id_usuario = oRepositorioBean.getId_usuario();
        id_lenguaje = oRepositorioBean.getId_lenguaje();
        id_documento = oRepositorioBean.getId_documento();
        fecha = oRepositorioBean.getFecha();
    }
    if (oContexto.getMetodo().equals("view")) {
        strTitulo = "Vista";
        strControlEnabled = "disabled=\"true\"";
        strValueBoton = "Cerrar";
    }
    if (oContexto.getMetodo().equals("update")) {
        strTitulo = "Edición";
        strValueBoton = "Modificar";
    }
    if (oContexto.getMetodo().equals("new")) {
        strTitulo = "Alta";
        strValueBoton = "Crear";
    }
%>
<h1><%=strTitulo%> de cliente</h1>
<form class="semantic" action="Controller" method="post" id="repositorioForm">
    <fieldset>
        <legend>Formulario de Repositorio</legend>
        <input type="hidden" name="id" value="<%=id%>" /> 
        <input type="hidden" name="class" value="repositorio" /> 
        <input type="hidden" name="method" value="<%=oContexto.getMetodo()%>" /> 
        <input type="hidden" name="phase" value="2" />
        <div>
            <label for="titulo">Titulo: </label> 
            <input <%=strControlEnabled%> id="titulo" name="titulo" type="text" size="30" maxlength="50" autofocus="autofocus" value="<%=titulo%>" /><br />
        </div>
        <div>
            <label for="ape1">Contenido: </label>
            <textarea <%=strControlEnabled%> id="ape1" name="ape1" type="text" size="30" maxlength="50" value="<%=contenido%>" ></textarea><br />
        </div>
        <div>
            <label for="ape2">Fecha: </label> 
            <input <%=strControlEnabled%> id="ape2" name="ape2" type="text" size="30" maxlength="50" value="<%=fecha%>" /> <br />
        </div>
        <div>
            <input type="submit" name="enviar" value="<%=strValueBoton%>" />
        </div>
    </fieldset>
</form>
