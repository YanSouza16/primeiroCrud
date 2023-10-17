<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alteração de Usuario</title>
    </head>
    <body>
        <%
            
         String c;
            c =request.getParameter("cpf");
            //Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Yan017247!");
            //Buscar o produto pelo código recebido
            st = conecta.prepareStatement("SELECT * FROM cadastro_usuario WHERE cpf = ?");
            st.setString(1, c);
            ResultSet resultado = st.executeQuery(); //Executa o SELECT
            //Verifica se o produto de código informado foi encontrado
            if (!resultado.next()) { //se não encontrou o produto
                out.print("Este Usuario não foi encontrado");
            } else { //se encontrou o produto
    %>
         <form method="post" action="altUser.jsp">
            <p>
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" value="<%= resultado.getString("nome") %>" >
            </p>
            <p>
                <label for="sobrenome">Sobrenome:</label>
                <input type="text" name="sobrenome" id="sobrenome" value="<%= resultado.getString("sobrenome") %>">
            </p>  
            <p>
                <label for="email">Email</label>
                <input type="text" name="email" id="email" value="<%= resultado.getString("email") %>">
            </p> 
            <p>
                <label for="senha">Senha</label>
                <input type="password" name="senha" id="senha" value="<%= resultado.getString("senha") %>">
            </p> 
            <p>
                <label for="idade">Idade</label>
                <input type="number" name="idade" id="idade" value="<%= resultado.getString("idade") %>">
            </p> 
            <p>
                <label for="cpf">CPF</label>
                <input type="text" name="cpf" id="cpf" value="<%= resultado.getString("cpf") %>"readonly>
            </p> 
                      
            <p>
                <input type="submit" value="Salvar Alterações">   
            </p>
        </form>    
        <%
            }
        %>    
    </body>
</html>
