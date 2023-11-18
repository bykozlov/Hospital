<%@page import="com.project.hospital.model.Cita"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.project.hospital.utils.Utils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Citas</title>
</head>
<body>

	<%@include file="../../template/menu.jsp"%>

	<%
	List<Cita> data = (List<Cita>) request.getAttribute("citas");

	if (!Utils.isAdmin(user)) {
		response.sendRedirect("/");
	}
	%>

	<div class="container">
		<h1>Citas</h1>
		<hr>

		<form action="citas" method="post">
			<div class="row">
				<div class="col-4">
					<label>Fecha Inicio</label> <input class="form-control" type="date"
						name="fecha_inicio" value="${fecha_inicio}">
				</div>
				<div class="col-4">
					<label>Fecha Fin</label> <input class="form-control" type="date"
						name="fecha_fin" value="${fecha_fin}">
				</div>
				<div>
					<label>&nbsp</label><br> <input class="btn btn-primary"
						type="submit" value="Buscar"> <a class="btn btn-warning"
						href="citas/pdf?fecha_inicio=${fecha_inicio}&fecha_fin=${fecha_fin}">Exportar
						PDF</a>
				</div>
			</div>
		</form>

		<hr>

		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>Fecha</th>
						<th>Hora</th>
						<th>Usuario</th>
						<th>Especialidad</th>
						<th>Descripción</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (data != null) {
						for (Cita item : data) {
					%>
					<tr>
						<td><%=item.getFecha()%></td>
						<td><%=item.getHora()%></td>
						<td><%=item.getUsuario()%></td>
						<td><%=item.getEspecialidad()%></td>
						<td><%=item.getDescripcion()%></td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>