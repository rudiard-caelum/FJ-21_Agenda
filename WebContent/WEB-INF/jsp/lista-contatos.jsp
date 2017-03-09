<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Contatos</title>
</head>
<body>
	<c:import url="/cabecalho.jsp" />
	<!--  cria o DAO -->
	<table border="1px">
		<tr>
			<td>ID</td>
			<td>Nome</td>
			<td>E-Mail</td>
			<td>Endereço</td>
			<td>Data Nascimento</td>
			<td colspan="2">Atividade</td>
		</tr>
		<!--  percorre contatos montando as linhas da tabela -->
		<c:forEach var="contato" items="${contatos}" varStatus="id">
			<tr bgcolor="=${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
				<td>${contato.id}</td>
				<td>${contato.nome}</td>
				<td><c:if test="${not empty contato.email}">
						<a href="mailto:${contato.email}">${contato.email}</a>
					</c:if> <c:if test="${empty contato.email}">
						E-mail não infomado
					</c:if></td>
				<td>${contato.endereco}</td>
				<td><fmt:formatDate value="${contato.dataNascimento.time}"
						pattern="dd/MM/yyyy" /></td>
				<td><a
					href="mvc?logica=AlteraContatoLogic&id=${contato.id}&nome=${contato.nome}&email=${contato.email}&endereco=${contato.endereco}&dataNascimento=${contato.dataNascimento.time}">Alterar</a>
				</td>
				<td><a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="adiciona-contato.jsp">Adicionar Novo Contato</a>
	<c:import url="/rodape.jsp" />
</body>
</html>