<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <title>Citas Especialistas</title>
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

    <div class="container">
        <h2 class="text-center" id="titulo">Citas Especialistas</h2>
        <form action="insertar_esp.jsp" method="POST">
            <div class="form-group">
                <label for="centro">Seleccione el centro de atención:</label>
                <select class="form-control" id="centro" name="centro">
                  <option value="Cra. 33 #54-85, Bucaramanga" required>Cra. 33 #54-5, Bucaramanga</option>
                  <option value="Cl. 30a #23-64, Floridablanca" required>Cl. 30a #23-64, Floridablanca</option>
                  <option value="Cra. 25 #29-36, Giron" required>Cra. 25 #29-36, Girón</option>
                  <option value="Cra. 11 #8-58, Piedecuesta" required>Cra. 11 #8-58, Piedecuesta</option>
                </select>
            </div>
            <div class="form-group">
                <label for="especialidad">Seleccione la especialidad:</label>
                <select class="form-control" id="especialidad" name="especialidad">
                  <option value="Optometria" required>Optometría</option>
                  <option value="Nutricion" required>Nutrición</option>
                  <option value="Odontologia" required>Odontología</option>
                  <option value="Ginecologia" required>Ginecología</option>
                </select>
            </div>
            <div class="form-group">
                <label for="medico">Seleccione el médico especialista:</label>
                <select class="form-control" id="medico" name="medico">
                  <option value="Dr. Andres Felipe Gomez Corrales" required>Dr. Andrés Felipe Gómez Corrales</option>
                  <option value="Dr. Vicente Jose Carmona Pertuz" required>Dr. Vicente José Carmona Pertúz</option>
                  <option value="Dra. Bilena Margarita Molina Arteta" required>Dra. Bilena Margarita Molina Arteta</option>
                  <option value="Dr. Nicolas Villareal Trujillo" required>Dr. Nicolás Villareal Trujillo</option>
                  <option value="Dra. Maria del Pilar Aranza Jimenez" required>Dra. María del Pilar Aranza Jiménez</option>
                  <option value="Dra. Paola Sedano" required>Dra. Paola Sedano</option>
                </select>
            </div>
            <div class="form-group">
                <label for="fecha">Fecha de atención:</label>
                <input type="date" class="form-control" id="fecha" name="fecha" required>
            </div>
            <div class="form-group">
                <label for="hora">Seleccione la hora de atención:</label>
                <select class="form-control" id="hora" name="hora">
                  <option value="8:00 AM" required>8:00 AM</option>
                  <option value="9:00 AM" required>9:00 AM</option>
                  <option value="10:00 AM" required>10:00 AM</option>
                  <option value="11:00 AM" required>11:00 AM</option>
                  <option value="12:00 PM" required>12:00 PM</option>
                  <option value="1:00 PM" required>1:00 PM</option>
                  <option value="2:00 PM" required>2:00 PM</option>
                  <option value="3:00 PM" required>3:00 PM</option>
                  <option value="4:00 PM" required>4:00 PM</option>
                  <option value="5:00 PM" required>5:00 PM</option>
                </select>
            </div>
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
            <button type="submit" class="btn btn-outline-primary btn-block">Registrar</button>
            <button type="reset" class="btn btn-outline-info btn-block">Reestablecer</button>
        </form>
    </div>

</body>

</html>