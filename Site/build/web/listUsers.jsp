<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Listagem de Usuarios</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Yan017247!");
                //Listar os dados da tabela produto do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM cadastro_usuario ORDER By nome");
                ResultSet rs = st.executeQuery();
                %>
                <table>
                   <tr>
                       <th>Nome</th>
                       <th>sobrenome</th>
                       <th>email</th>
                       <th>senha</th>
                       <th>idade</th>
                       <th>cpf</th>
                       <th>Exclusão</th>
                       <th>Alteração</th>                       
                   </tr>                
                <%
                while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getString("Nome")%></td>
                        <td><%= rs.getString("sobrenome")%></td>
                        <td><%= rs.getString("email")%></td>
                        <td><%= rs.getString("senha")%></td>
                        <td><%= rs.getInt("idade")%></td>
                        <td><%= rs.getString("cpf")%></td>
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
