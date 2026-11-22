<%
  String usuario = request.getParameter("usuario");
  String contrasena = request.getParameter("contrasena");
  Usuario miUser =new Usuario(usuario, contrasena)
  if (usuario.equals("pepe") && contrasena.equals("1234")) {
    //session.setAttribute("usuario", "pepe");
    response.sendRedirect("admin.jsp");
  } else if(miUser.verificarDatos() == true) {
    session.setAttribute("usuario", usuario);
    response.sendRedirect("index.jsp");
  } else {
    session.setAttribute("error", "Usuario o contrasena incorrecto");
    response.sendRedirect("formulario-login.jsp");
  }
%>
