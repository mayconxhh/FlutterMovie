import 'package:movie_app/common/util.dart';

class MediaModel{
	int id;
	double voteAverage;
	String title;
	String posterPath;
	String backdropPath;
	String overview;
	String releaseDate;
	List<dynamic> genreIds;

	String getPosterMediaUrl() => getMediumPictureUrl(posterPath);
	String getBackdropPathUrl() => getLargePictureUrl(backdropPath);

	factory MediaModel(Map jsonMap){
		try{
			return new MediaModel.deserialize(jsonMap);
		} catch(ex){
			throw ex;
		}
	}

	MediaModel.deserialize(Map json) :
		id = json['id'].toInt(),
		voteAverage = json['vote_average'].toDouble(),
		title = json['title'].toString(),
		posterPath = json['poster_path'].toString() ?? "",
		backdropPath = json['backdrop_path'].toString() ?? "",
		overview = json['overview'].toString(),
		releaseDate = json['release_date'].toString(),
		genreIds = json['genre_ids'].toList();
}