import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/common/constants.dart';

class HttpHandler{

	final String _baseUrl = 'api.themoviedb.org';
	final String _lenguage = 'es-ES';

	Future<dynamic> getJson(Uri uri) async {
		http.Response response = await http.get(uri);

		return json.decode(response.body).toString();
	}

	Future<String> fetchMovies(){
		var uri = new Uri.https(_baseUrl, '/3/movie/popular', {
			'api_key': API_KEY,
			'page': '1',
			'lenguage': _lenguage
		});

		return getJson(uri).then(((data)=> data.toString()));
	}

}