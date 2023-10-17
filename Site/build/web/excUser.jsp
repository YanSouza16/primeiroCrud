
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
    </head>
    <body>
        <%
            long cpf;
            cpf = Long.parseLong(request.getParameter("cpf"));
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Yan017247!");
                PreparedStatement st = conecta.prepareStatement("DELETE FROM cadastro_usuario WHERE cpf=?");
                st.setLong(1, cpf);
                int resultado = st.executeUpdate(); 
                if (resultado == 0) {
                    out.print("Este usuario não está cadastrado");
                } else {
                    out.print("O Usuario de CPF: " + cpf + " foi excluído com sucesso");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
            }
        %>   
    </body>
</html>
