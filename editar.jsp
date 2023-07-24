<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Actualizar</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/stilos.css">
    <style>
        body{
            background-image: url("img/slider.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-sm navbar-dark justify-content-center">
        <a class="navbar-brand">
          <img src="img/logo.jpg" alt="logo" style="width:120px;" class="img-thumbnail">
        </a>
    </nav>

    <%
  Connection conexion=null;
  Statement  sentencia=null;
  ResultSet rs=null;

  Class.forName("com.mysql.jdbc.Driver");

  conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps_curitas","root","");

  sentencia= conexion.createStatement();

  String item_cod = request.getParameter("id");

  String consultaSQL=  " select * from paciente where documento = ";
  consultaSQL += "'" + item_cod + "'";

  rs=sentencia.executeQuery(consultaSQL);

  while(rs.next()) { %>
    <div class="container">
        <br>
        <h2 class="text-center" id="titulo">Actualizar datos</h2>
        <form action="edit.jsp" method="POST">
            <div class="form-group">
                <label for="nombre">Nombres:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=rs.getString("nombre")%>">
            </div>
            <div class="form-group">
                <label for="apellido">Apellidos:</label>
                <input type="text" class="form-control" id="apellido" name="apellido" value="<%=rs.getString("apellido")%>">
            </div>
             <div class="form-group">
                <label for="correo">Correo:</label>
                <input type="text" class="form-control" id="correo" name="correo" value="<%=rs.getString("correo")%>">
            </div>
            <div class="form-group">
                <label for="sel1">Seleccione la ciudad de residencia:</label>
                <select class="form-control" id="ciudad" name="ciudad">
                  <option value="Bucaramanga" <%if(rs.getString("ciudad").equals("Bucaramanga")){%>selected<%}%>>Bucaramanga</option>
                  <option value="Floridablanca" <%if(rs.getString("ciudad").equals("Floridablanca")){%>selected<%}%>>Floridablanca</option>
                  <option value="Giron" <%if(rs.getString("ciudad").equals("Giron")){%>selected<%}%>>Girón</option>
                  <option value="Piedecuesta" <%if(rs.getString("ciudad").equals("Piedecuesta")){%>selected<%}%>>Piedecuesta</option>
                </select>
            </div>
            <div class="form-group">
                <label for="direccion">Dirección de residencia:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="<%=rs.getString("direccion")%>">
            </div>
            <div>
                <div class="form-group form-check-inline">
                    <label class="form-check-label">Estado civil:
                        <br><input type="radio" class="form-check-input" name="civil" value="Soltero(a)" <%if(rs.getString("civil").equals("Soltero(a)")){%>checked<%}%>>Soltero(a)
                    </label>
                </div>
                <div class="form-group form-check-inline">
                    <label class="form-check-label">
                        <br><input type="radio" class="form-check-input" name="civil" value="Casado(a)" <%if(rs.getString("civil").equals("Casado(a)")){%>checked<%}%>>Casado(a)
                    </label>
                </div>
                <div class="form-group form-check-inline">
                    <label class="form-check-label">
                        <br><input type="radio" class="form-check-input" name="civil" value="Viudo(a)" <%if(rs.getString("civil").equals("Viudo(a)")){%>checked<%}%>>Viudo(a)
                    </label>
                </div>
            </div> 
            <input type="hidden" name="id" value="<%=rs.getString("documento")%>">
            <button type="submit" class="btn btn-outline-primary btn-block">Actualizar</button>
        </form>
    </div>

  <% } %>

</body>

</html>