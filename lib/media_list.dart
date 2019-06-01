import 'package:flutter/material.dart';
import 'package:movie_app/common/HttpHandler.dart';
import 'package:movie_app/model/media.model.dart';
import 'package:movie_app/mediaListItem.dart';

class MediaList extends StatefulWidget {
	@override
	_MediaListState createState() => new _MediaListState();
}
class _MediaListState extends State<MediaList> {

	List<MediaModel> _media = new List();

	@override
	void initState(){
		super.initState();
		loadMovies();
	}

	void loadMovies() async {
		var movies = await HttpHandler().fetchMovies();
		setState((){
			_media.addAll(movies);
		});
	}

	@override
	Widget build(BuildContext context) {
	 	return new Container(
	 		child: new ListView.builder(
	 			itemCount: _media.length,
	 			itemBuilder: (BuildContext context, int i){
	 				return new MediaListItem(_media[i]);
	 			}
	 		),
	 	);			
	}
}