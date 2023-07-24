<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Date"%>

<%
    String centro = null;
    String medico = null;
    String fecha = null;
    String hora = null;
    String especialidad = null;

    if(request.getParameter("centro")!=null){
        centro=request.getParameter("centro");
    }

    if(request.getParameter("medico")!=null){
        medico=request.getParameter("medico");
    }

    if(request.getParameter("fecha")!=null){
        fecha=request.getParameter("fecha");
    }

    if(request.getParameter("hora")!=null){
        hora=request.getParameter("hora");
    }

    if(request.getParameter("especialidad")!=null){
        especialidad=request.getParameter("especialidad");
    }

    String user = request.getParameter("id");

    Connection conexion = null;
    Statement sentencia = null;
    int filas=0;

    try{

        Class.forName("com.mysql.jdbc.Driver"); 	
        conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/eps_curitas","root","");
        sentencia = conexion.createStatement();

        String consultaSQL = "insert into especialidad (doc_esp,medico_esp,centro_esp,fecha_esp,hora_esp,especialidad) values ";
        consultaSQL+= "('" + user + "','" + medico + "','" + centro + "','" + fecha + "','" + hora+"','" + especialidad + "')";

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