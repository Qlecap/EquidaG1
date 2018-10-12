<%-- 
    Document   : envoyerMail
    Created on : 12 oct. 2018, 06:46:05
    Author     : leneveuT
--%>

<%@page import="modele.Vente"%>
<%@page import="modele.PieceJointe"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Envoyer mail</title>
    </head>
    <body>
        <h1>Envoyer mail</h1>
        
        <form  action="envoyerMail" method="post">
            <p>
                <label for="objet">Objet :</label>
                <input type="text" name="objet" id="objet">
            </p>
            <p>
                <label for="corps">Corps :</label>
                <textarea name="corps" id="corps"></textarea>
            </p>
            <p>
                <label for="vente">Vente :</label>
                <select id="vente">
                    <%
                        ArrayList<Vente> lesVentes = (ArrayList)request.getAttribute("pLesVentes");
                        for (int i=0; i < lesVentes.size(); i++){
                            Vente vente = lesVentes.get(i);
                            out.println("<option value ='" + vente.getId() + "'>" + vente.getNom() + "</option>"); 
                           
                        }
                    %>
                </select>
            </p>
            <p>
                <label for="piecesJointes">Pièces jointes :</label>
                <select id="piecesJointes">
                    <%
                        ArrayList<PieceJointe> lesPieceJointes = (ArrayList)request.getAttribute("pLesPiecesJointes");
                        for (int i=0; i < lesPieceJointes.size(); i++){
                            PieceJointe pieceJointe = lesPieceJointes.get(i);
                            out.println("<option value ='" + pieceJointe.getId() + "'>" + pieceJointe.getDescription()+ "</option>"); 
                           
                        }
                    %>
                </select>
            </p>
            <p>
                <input type="button" value="Envoyer">
            </p>
        </form>
    </body>
</html>
