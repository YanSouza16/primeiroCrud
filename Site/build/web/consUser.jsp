
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Lista de Usuario</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
            // Recebe o nome do produto digitado no formulário conpro.html
            String nome;
            nome = request.getParameter("nome");
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Yan017247!");
                //Listar os dados da tabela produto do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM cadastro_usuario WHERE nome LIKE ? ORDER By nome");
                st.setString(1, "%" + nome + "%");
                ResultSet rs = st.executeQuery();
        %>
        <table>
            <tr>
                <th>Nome</th>
                <th>Sobrenome</th>
                <th>Email</th>
                <th>Senha</th>
                <th>CPF</th>
                <th>Idade</th>
                <th>Exclusão</th>
                <th>Alterar</th>
            
            </tr>                
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("sobrenome")%></td>
                <td><%= rs.getString("email")%></td>
                <td><%= rs.getString("senha")%></td>
                <td><%= rs.getString("cpf")%></td>
                <td><%= rs.getInt("idade")%></td>
                <td><a href="excUser.jsp?cpf=<%=rs.getString("cpf")%>">Excluir</a></td>
                <td><a href="upUser.jsp?cpf=<%=rs.getString("cpf")%>">Alterar</a></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
             
                out.print("Mensagem de erro:" + x.getMessage());
            }
        %>   
    </body>
</html>

