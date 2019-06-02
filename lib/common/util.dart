final String _imageUrlMedium = 'https://image.tmdb.org/t/p/w300/';
final String _imageUrlLarge = 'https://image.tmdb.org/t/p/w780/';

String getMediumPictureUrl(String path) => _imageUrlMedium+path;
String getLargePictureUrl(String path) => _imageUrlLarge+path;

Map<int, String> _genreMap = {
	28: "Acción",
  12: "Aventura",
  16: "Animación",
  35: "Comedia",
  80: "Crimen",
  99: "Documental",
  18: "Drama",
  10751: "Familia",
  14: "Fantasía",
  36: "Historia",
  27: "Terror",
  10402: "Música",
  9648: "Misterio",
  10749: "Romance",
  878: "Ciencia ficción",
  10770: "Película de TV",
  53: "Suspense",
  10752: "Bélica",
  37: "Western"
};

List<String> genresToList(List<dynamic> genreIds) => 
	genreIds.map((id) => _genreMap[id]).toList();

String getGenreValues(List<dynamic> genreIds){
	StringBuffer buffer = new StringBuffer();
	buffer.writeAll(genresToList(genreIds), ', ');
	return buffer.toString();
}