package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.api.JSONReader;
import com.api.UpdateVilleApi;
import com.beans.Ville;

/**
 * Servlet implementation class DetailVille
 */
public class DetailVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailVille() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idVille =  request.getParameter("idVille");
		Ville ville = JSONReader.getVilleByCode(idVille);
		request.setAttribute("ville", ville);
		this.getServletContext().getRequestDispatcher("/WEB-INF/detailsVille.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codeCommune = request.getParameter("codeCommune");
		String nomCommune = request.getParameter("nomCommune");
		String codePostal = request.getParameter("codePostal");
		String libelle = request.getParameter("libelle");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		
		Ville ville = new Ville(codeCommune,nomCommune,codePostal,libelle,latitude,longitude);
		UpdateVilleApi.UpdateVille(ville);
	}

}
