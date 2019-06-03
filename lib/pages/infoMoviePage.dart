import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/media.model.dart';

class MovieScreen extends StatefulWidget {
	final MediaModel media;
	MovieScreen(this.media);

	@override
	_MovieScreenState createState() => new _MovieScreenState();
}
class _MovieScreenState extends State<MovieScreen> {
	@override
	void initState(){
		super.initState();
		initializeDateFormatting("es_ES", null);
	}

	@override
	Widget build(BuildContext context) {
	 	return new Scaffold(
	 		appBar: new AppBar(
	 			title: new Text(widget.media.title),
	 		),
	 		body: new ListView(
 				children: <Widget>[
 					new FadeInImage.assetNetwork(
						placeholder: 'assets/placeholder.jpg',
						image: widget.media.getPosterLargeUrl(),
						fit: BoxFit.cover,
						width: double.maxFinite,
						height: 500.0,
						fadeInDuration: new Duration(milliseconds: 40),
					),
					new Padding(
						padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
						child: new Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								new Expanded(
									child: new Text(
										'Título: '+widget.media.title,
										textAlign: TextAlign.left,
										style: new TextStyle(
											fontWeight: FontWeight.bold,
											fontSize: 23.0,
										),
										maxLines: 2,
										overflow: TextOverflow.ellipsis,
									)
								),
								new Container(
									child: new Row(
										children: <Widget>[
											new Container(
												padding: const EdgeInsets.only(right: 1.0),
												child: new Text(
													new DateFormat('yyyy')
	                  				.format(DateTime.parse(widget.media.releaseDate)),
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
								)
							],
						),
					),
					new Padding(
						padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
						child: new Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								new Container(
									padding: const EdgeInsets.only(bottom: 7.0),
									child: new Text(
										'Descripción:',
										style: new TextStyle(
											fontWeight: FontWeight.bold,
											fontSize: 18.0,
											color: Colors.white,
										),
									),
								),
								new Container(
									child: new Text(
										widget.media.overview,
										textAlign: TextAlign.justify,
									)
								),
								new Container(
									padding: const EdgeInsets.symmetric(vertical: 10.0),
									child: new Text(
										'Calificación Promedio: '+widget.media.voteAverage.toString(),
										style: new TextStyle(
											fontWeight: FontWeight.bold,
											fontSize: 18.0,
											color: Colors.white,
										),
									),
								),
								new Container(
									padding: const EdgeInsets.symmetric(vertical: 10.0),
									child: new Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											new Container(
												padding: const EdgeInsets.only(bottom: 4.0),
												child: new Text(
													'Fecha de lanzamiento: ',
													style: new TextStyle(
														fontWeight: FontWeight.bold,
														fontSize: 18.0,
														color: Colors.white,
													),
												),
											),
											new Container(
												child: new Text(
													new DateFormat.yMMMMd("es_ES")
				            				.format(DateTime.parse(widget.media.releaseDate)),
													style: new TextStyle(
														fontSize: 15.0,
														color: Colors.white,
													),
												),
											)
										],
									)
								)
							],
						),
					),
 				],
	 		),
	 	);			
	}
}