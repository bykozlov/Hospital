<%@page import="com.project.hospital.model.Especialidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.project.hospital.utils.Utils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Especialidades</title>
</head>
<body>

	<%@include file="../../template/menu.jsp"%>

	<%
	List<Especialidad> data = (List<Especialidad>) request.getAttribute("especialidades");

	if (!Utils.isAdmin(user)) {
		response.sendRedirect("/");
	}
	%>

	<div class="container">
		<h1>Especialidades</h1>
		<hr>

		<%@include file="../../template/message-box.jsp"%>

		<div class="text-right mb-2">
			<a class="btn btn-success" href="add-especialidad">Registrar
				Nuevo</a> <a class="btn btn-warning" href="especialidades/pdf">Exportar
				PDF</a>
		</div>

		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Precio</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
					if (data != null) {
						for (Especialidad item : data) {
					%>
					<tr>
						<td><%=item.getNombre()%></td>
						<td><%=item.getPrecio()%></td>
						<td class="text-right">
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">Opciones</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item"
										href="edit-especialidad?id=<%=item.getId()%>">Editar</a>
									<form action="delete-especialidad">
										<input type="number" name="id" value="<%=item.getId()%>"
											required hidden="true"> <input class="dropdown-item"
											type="submit" value="Eliminar">
									</form>
								</div>
							</div>
						</td>
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