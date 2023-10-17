<%-- 
    Document   : salvar_usuario
    Created on : 16 de out. de 2023, 01:44:17
    Author     : yan01
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        
        <%
            
            String email,senha;
            email= request.getParameter("email");
            senha= request.getParameter("senha");
          
            
//conectar com o banco de dados
            Connection conecta =null;
            PreparedStatement st=null;   
           try{ Class.forName("com.mysql.cj.jdbc.Driver");
            conecta= DriverManager.getConnection("jdbc:mysql://localhost:3306/banco","root","Yan017247!");
            // inserir dados na tabela cadastro usuario
            st = conecta.prepareStatement("INSERT INTO cadastro_usuario VALUES(?,?)");
          
            st.setString(1, email);
            st.setString(2, senha);

            st.executeUpdate();
            out.print("Usuario Cadastrado com Sucesso!!");
              } catch (Exception e) {
                out.print("Erro ao cadastrar usuário: " + e.getMessage());
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (conecta != null) {
                        conecta.close();
                    }
                } catch (Exception e) {
                    out.print("Erro ao fechar recursos: " + e.getMessage());
                }
                }
                
        %>
    </body>
</html>
