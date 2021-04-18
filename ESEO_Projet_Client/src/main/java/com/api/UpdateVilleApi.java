package com.api;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import com.beans.Ville;

public class UpdateVilleApi {

	public static void UpdateVille2(Ville ville) {
		URL url;
		try {
			url = new URL("http://localhost:8181/villeUpdate");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestProperty("Content-Type", "application/json; utf-8");
			con.setRequestProperty("Accept", "application/json");
			con.setDoOutput(true);

			String jsonInputString = "{\"codeCommune\": \"" + ville.getCodeCommune() + "\", \"nomCommune\":\""
					+ ville.getNomCommune() + "\", \"codePostal\":\"" + ville.getCodePostal() + "\", "
					+ "\"libelle\":\"" + ville.getLibelle() + "\", \"latitude\":\"" + ville.getLatitude()
					+ "\", \"longitude\":\"" + ville.getLongitude() + "\"  }";

			try (OutputStream os = con.getOutputStream()) {
				byte[] input = jsonInputString.getBytes("utf-8");
				os.write(input, 0, input.length);
			}
			try (BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine = null;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}
				System.out.println(response.toString());
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void UpdateVille(Ville ville) {

		try {
			String query = "http://localhost:8181/villeUpdate?"+ ville.getCodeCommune();
			String json = "{\"codeCommune\": \"" + ville.getCodeCommune() + "\", \"nomCommune\":\""
					+ ville.getNomCommune() + "\", \"codePostal\":\"" + ville.getCodePostal() + "\", "
					+ "\"libelle\":\"" + ville.getLibelle() + "\", \"latitude\":\"" + ville.getLatitude()
					+ "\", \"longitude\":\"" + ville.getLongitude() + "\"  }";

			URL url = new URL(query);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestMethod("POST");

			OutputStream os = conn.getOutputStream();
			os.write(json.getBytes("UTF-8"));
			os.close();

			// read the response
			InputStream in = new BufferedInputStream(conn.getInputStream());
			String result = org.apache.commons.io.IOUtils.toString(in, "UTF-8");
			//JSONObject jsonObject = new JSONObject(result);

			in.close();
			conn.disconnect();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
