<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="css/stilos.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <title>Interfaz de usuario</title>
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
          <img src="img/logo.jpg" alt="logo" style="width:150px;" class="img-thumbnail">
        </a>
    </nav>

    <div class="container">
        
       
            <%
                        Connection conexion = null;
                        Statement sentencia = null;
                        ResultSet rs = null;
                        String user;
                        String password;

                       if(request.getParameter("user")==null&&request.getParameter("pwd")==null) {
                            user = (String) session.getAttribute("usr1");
                            password = (String) session.getAttribute("pwd1");
                       } else {
                            session.setAttribute("usr1",request.getParameter("user"));
                            session.setAttribute("pwd1",request.getParameter("pwd"));
                            user = (String) session.getAttribute("usr1");
                            password = (String) session.getAttribute("pwd1");
                       }

                        try{

                            Class.forName("com.mysql.jdbc.Driver");
                            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps_curitas","root","" );
                            sentencia = conexion.createStatement();

                            String consultaSQL = "select * from paciente where documento = '"+user+"' and contrasena = '"+password+"';";
                            rs=sentencia.executeQuery(consultaSQL);

                            if(rs.next() ){
                                String documento = rs.getString("documento");
                                String nombre = rs.getString("nombre");
                                String apellido = rs.getString("apellido"); %> 
                                <h2 class="text-center" id="titulo">Bienvenido: <%=nombre%> <%=apellido%></h2>
                                <h4 class="text-center" id="titulo">Documento: <%=documento%></h4>
                                <br>
                                
                                <div class="container d-flex justify-content-center">
                                    <div class="card bg-light text-dark" style="width:300px" >
                                        <div class="card-body d-flex flex-column justify-content-center text-center">
                                            <span class="material-symbols-outlined" width="70px">calendar_today</span>
                                            <p class="card-text">Solicitar citas médico general</p>
                                            <form action="general.jsp" method="POST">
                                                <input type="hidden" name="id" value="<%=rs.getString("documento")%>">
                                                    <button type="submit" class="btn">
                                                        <a class="btn btn-outline-dark">Solicitar</a>
                                                    </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card bg-light text-dark" style="width:300px" >
                                        <div class="card-body d-flex flex-column justify-content-center text-center">
                                            <span class="material-symbols-outlined">event_available</span>
                                            <p class="card-text">Solicitar citas médico especializado</p>
                                            <form action="especializado.jsp" method="POST">
                                                <input type="hidden" name="id" value="<%=rs.getString("documento")%>">
                                                    <button type="submit" class="btn">
                                                        <a class="btn btn-outline-dark">Solicitar</a>
                                                    </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card bg-light text-dark" style="width:300px" >
                                        <div class="card-body d-flex flex-column justify-content-center text-center">
                                            <span class="material-symbols-outlined">badge</span>
                                            <p class="card-text">Actualizar mis datos</p>
                                            <form action="editar.jsp" method="POST">
                                                <input type="hidden" name="id" value="<%=rs.getString("documento")%>">
                                                    <button type="submit" class="btn">
                                                        <a class="btn btn-outline-dark">Actualizar</a>
                                                    </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="container d-flex justify-content-center">
                                    <div class="card bg-light text-dark" style="width:300px" >
                                        <div class="card-body d-flex flex-column justify-content-center text-center">
                                            <span class="material-symbols-outlined">date_range</span>
                                            <p class="card-text">Mis citas médico general</p>
                                            <form action="mostrar_gen.jsp" method="POST">
                                                <input type="hidden" name="id" value="<%=rs.getString("documento")%>">
                                                    <button type="submit" class="btn">
                                                        <a class="btn btn-outline-dark">Mostrar</a>
                                                    </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card bg-light text-dark" style="width:300px" >
                                        <div class="card-body d-flex flex-column justify-content-center text-center">
                                            <span class="material-symbols-outlined">event_note</span>
                                            <p class="card-text">Mis citas médico especialista</p>
                                            <form action="mostrar_esp.jsp" method="POST">
                                                <input type="hidden" name="id" value="<%=rs.getString("documento")%>">
                                                    <button type="submit" class="btn">
                                                        <a class="btn btn-outline-dark">Mostrar</a>
                                                    </button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card bg-light text-dark" style="width:300px" >
                                        <div class="card-body d-flex flex-column justify-content-center text-center">
                                            <span class="material-symbols-outlined">perm_contact_calendar</span>
                                            <p class="card-text">Mis datos</p>
                                            <form action="mostrar_per.jsp" method="POST">
                                                <input type="hidden" name="id" value="<%=rs.getString("documento")%>">
                                                    <button type="submit" class="btn">
                                                        <a class="btn btn-outline-dark">Mostrar</a>
                                                    </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            <%} else { %>
                                <br>
                                <div class="alert alert-secondary text-center">
                                    <strong>Error!</strong> Usuario y/o contraseña errada.
                                </div>
                                <a href="index.html" class="btn btn-outline-primary btn-block">Intentar de nuevo</a>

                            <%}
                        } catch (ClassNotFoundException x){

                            out.println("Error en la carga del driver " + x.getMessage());

                        } catch (SQLException x){

                            out.println("Error accediendo a la base de datos " + x.getMessage());

                        } finally {

                            if( rs != null ){
                                try{rs.close();}
                                catch(SQLException x){
                                    out.println("Error cerrando el resultset " + x.getMessage());
                                }
                            }

                            if( sentencia != null ){
                                try{sentencia.close();}
                                catch(SQLException x){
                                    out.println("Error cerrando la sentencia " + x.getMessage());
                                }
                            }

                            if( conexion != null ){
                                try{conexion.close();}
                                catch(SQLException x){
                                    out.println("Error cerrando la conexion " + x.getMessage());
                                }

                            }
                        }
            %>
        
    </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>