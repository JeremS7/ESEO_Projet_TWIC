package com.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;

import com.beans.Ville;

public class JSONReader {

	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONObject json = new JSONObject(jsonText);
			return json;
		} finally {
			is.close();
		}
	}
	
	public static Ville getVilleByCode(String code) throws JSONException, IOException {
		JSONObject json = readJsonFromUrl("http://localhost:8181/ville?codeCommune="+code);
		return new Ville(json.get("codeCommune").toString(),json.get("nomCommune").toString(),json.get("codePostal").toString(),json.get("libelle").toString(), json.get("latitude").toString(),json.get("longitude").toString());
	}

}