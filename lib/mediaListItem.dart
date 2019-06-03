import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/media.model.dart';
import 'package:movie_app/pages/infoMoviePage.dart';

class MediaListItem extends StatelessWidget {
	
	final MediaModel media;
	MediaListItem(this.media);

	@override
	Widget build(BuildContext context) {
		return new Card(
			child: new InkWell(
				child: new Column(
					children: <Widget>[
						Container(
							child: new Stack(
								children: <Widget>[
									new FadeInImage.assetNetwork(
										placeholder: 'assets/placeholder.jpg',
										image: media.getBackdropPathUrl(),
										fit: BoxFit.cover,
										width: double.infinity,
										height: 200.0,
										fadeInDuration: new Duration(milliseconds: 40),
									),
									new Positioned(
										left: 0.0,
										bottom: 0.0,
										right: 0.0,
										child: new Container(
											decoration: new BoxDecoration(
												color: Colors.grey[900].withOpacity(0.5),
											),
											constraints: new BoxConstraints.expand(
												height: 55.0,
											),
										),
									),
									new Positioned(
										left: 10.0,
										bottom: 10.0,
										right: 60.0,
										child: new Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												new Container(
													child: new Text(
														media.title,
														style: new TextStyle(
															fontWeight: FontWeight.bold,
															color: Colors.white,
														),
													),
												),
												new Container(
													padding: const EdgeInsets.only(top: 4.0),
													child: new Text(
														media.getGenres(),
														style: new TextStyle(
															color: Colors.white,
														),
														maxLines: 1,
														overflow: TextOverflow.ellipsis,
													),
												)
											],
										),
									),
									new Positioned(
										bottom: 10.0,
										right: 10.0,
										child: new Row(
											crossAxisAlignment: CrossAxisAlignment.center,
											children: <Widget>[
												new Container(
													child: new Text(
														new DateFormat('yyyy')
	                    				.format(DateTime.parse(media.releaseDate)),
	                    				style: new TextStyle(
	                    					color: Colors.white.withOpacity(0.7),
	                    				),
													),
												),
												new Container(
													child: new Icon(
														Icons.date_range,
														size: 18.0,
														color: Colors.white.withOpacity(0.7)
													),
												)
											],
										),
									),
								]
							),
						)
					],
				),
				onTap: () {
          var route = new MaterialPageRoute(
          	builder: (BuildContext context) => new MovieScreen(media),
          );
          Navigator.of(context).push(route);
        },
			),
		);
	}
}