<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<%
    String nombre = null;
    String apellido = null;
    String documento = null;
    String correo = null;
    String ciudad = null;
    String direccion = null;
    String civil = null;

    if(!request.getParameter("nombre").isEmpty()){
        nombre=request.getParameter("nombre");
    }

    if(!request.getParameter("apellido").isEmpty()){
        apellido=request.getParameter("apellido");
    }

    if(!request.getParameter("id").isEmpty()){
        documento=request.getParameter("id");
    }

    if(!request.getParameter("correo").isEmpty()){
        correo=request.getParameter("correo");
    }

    if(request.getParameter("ciudad")!=null){
        ciudad=request.getParameter("ciudad");
    }

    if(request.getParameter("direccion")!=null){
        direccion=request.getParameter("direccion");
    }

    if(request.getParameter("civil")!=null){
        civil=request.getParameter("civil");
    }

    Connection conexion = null;
    Statement sentencia = null;
    int filas=0;

    try{

        Class.forName("com.mysql.jdbc.Driver"); 	
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps_curitas","root","");
        sentencia = conexion.createStatement();

        String consultaSQL = "UPDATE paciente SET nombre ='" + nombre + "', apellido ='" + apellido +"', correo ='" + correo + "', ciudad = '" + ciudad + "', direccion = '" + direccion + "', civil = '" + civil+ "' where documento = '" + documento +"';";
    
        filas = sentencia.executeUpdate(consultaSQL);

        response.sendRedirect("resultado.jsp");

    } catch (ClassNotFoundException x){

        out.println("Error en la carga del driver" + x.getMessage());
   
    } catch (SQLException x){

        out.println("Error accediendo a la base de datos " + x.getMessage());

    } finally {

        if(sentencia != null){
            try{sentencia.close();}
            catch(SQLException x){
                out.println("Error cerrando la sentencia " + x.getMessage());
            }
        }

        if(conexion != null){
            try{conexion.close();}
            catch(SQLException x){
                out.println("Error cerrando la conexion " + x.getMessage());
            }
        }
    }
%>    