<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Usuario</title>
    </head>
    <body>
        <%
            //Receber os dados ALTERADOS no formulário carregaprod.jsp
           int i;
            String c ,s,n, m,e;
    
            n = request.getParameter("nome");
            m = request.getParameter("sobrenome");
            e = request.getParameter("email");
            s = request.getParameter("senha");
            c = request.getParameter("cpf");
           String idadeParam = request.getParameter("idade");
            i = (idadeParam != null && !idadeParam.isEmpty()) ? Integer.parseInt(idadeParam) : 0;
   try{
            //Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Yan017247!");
            //Alterar o sdados na tabela produtos do BD
            st = conecta.prepareStatement("UPDATE cadastro_usuario SET nome = ?, sobrenome = ?, email = ?,senha = ?,idade = ? WHERE cpf = ?");
            st.setString(1, n);
            st.setString(2, m);
            st.setString(3, e);
            st.setString(4, s);
            st.setInt(5, i);
            st.setString(6, c);
            
            st.executeUpdate(); 
            out.print("Os dados do Usuario " + c + " foram alterados com sucesso");
       } catch (Exception erro){
          out.print ("Entre em contato com o suporte e informe o erro " + erro.getMessage());
       }
%>    
    </body>
</html>



