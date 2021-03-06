<%-- 
    Document   : envoyerMail
    Created on : 12 oct. 2018, 06:46:05
    Author     : leneveuT
--%>
<%@page import="formulaires.CourrielForm"%>
<%@page import="modele.Vente"%>
<%@page import="modele.PieceJointe"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/vues/Header.jsp" >
    <jsp:param name="NomPage" value="Création du mail" />
    </jsp:include>
    
    <body>
        <jsp:include page="/vues/MenuNavigation.jsp" />
        
        <div class="container">
            <h3>Création du mail</h3>
            
            <%
                CourrielForm form = (CourrielForm)request.getAttribute("form");
            
                if(form != null && form.getErreurs() != null){
            %>
            <div class="card-panel red lighten-1">
                    <ul>
                        <%
                        for(int i = 0; i < form.getErreurs().size();i++)
                        {
                        
                            out.println("<li>" + form.getErreurs().get(i) + "<li/>");
                        }
                        %>
                    </ul>
            </div>
            <%
                }
            %>
 
                    
           <div class="row">
                <form  action="creerMail" method="post" class="col s12" enctype="multipart/form-data">
                    <div class="row">
                        <div class="input-field col-s6">
                            <label for="objet">Objet :</label>
                            <input type="text" name="objet" id="objet">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col-s6">
                            <label for="corps">Corps :</label>
                            <textarea name="corps" id="corps" class="materialize-textarea"></textarea>
                        <div>
                    </div>
                    <div class="row">
                        <div class="input-field col-s6">
                            <select name="venteId">
                                <%
                                    ArrayList<Vente> lesVentes = (ArrayList)request.getAttribute("pLesVentes");
                                    for (int i=0; i < lesVentes.size(); i++){
                                        Vente vente = lesVentes.get(i);
                                        out.println("<option value ='" + vente.getId() + "'>" + vente.getNom() + "</option>"); 

                                    }
                                %>
                            </select>
                            <label>Vente :</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="file-field input-field">
                            <div class="btn">
                              <span>File</span>
                              <input type="file" name="file" multiple>
                            </div>
                            <div class="file-path-wrapper">
                              <input class="file-path validate" type="text" placeholder="Upload one or more files">
                            </div>
                          </div>
                    </div>
                    <div class="row">
                       <div class="input-field col-s6">
                             <button class="btn waves-effect waves-light" type="submit" name="action">Créer le mail</button>
                       </div>       
                    </div>   
                </form>
            </div>
        </div>
    </body>
</html>

