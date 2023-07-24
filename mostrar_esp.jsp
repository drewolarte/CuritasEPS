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

    <title>Mis citas médico especialista</title>
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

                        String user = request.getParameter("id");
        
                        try{

                            Class.forName("com.mysql.jdbc.Driver");
                            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps_curitas","root","" );
                            sentencia = conexion.createStatement();

                            String consultaSQL = "select * from especialidad where doc_esp = '"+user+"';";
                            rs=sentencia.executeQuery(consultaSQL);

                            while(rs.next()){
                                String centro = rs.getString("centro_esp");
                                String especialidad = rs.getString("especialidad");
                                String medico = rs.getString("medico_esp");
                                String fecha = rs.getString("fecha_esp");
                                String hora = rs.getString("hora_esp");  %> 
                                <br>
                                
                                <div class="container d-flex justify-content-center">
                                    <div class="card bg-light text-dark d-flex justify-content-center" style="width:300px" >
                                        <img class="card-img-top" src="img/appointment.png" alt="Card image" id="imaesp" style="width:80px;margin-top: 10px;margin-left: 37%;">
                                        <div class="card-body d-flex flex-column justify-content-center text-center font-weight-bold">
                                            <p class="card-text"><%=centro%></p>
                                            <p class="card-text"><%=especialidad%></p>
                                            <p class="card-text"><%=medico%></p>
                                            <p class="card-text"><%=fecha%></p>
                                            <p class="card-text"><%=hora%></p>
                                        </div>
                                    </div>
                                </div>  

                                <br>

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