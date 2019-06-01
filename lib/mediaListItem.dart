import 'package:flutter/material.dart';
import 'package:movie_app/model/media.model.dart';

class MediaListItem extends StatelessWidget {
	
	final MediaModel media;

	MediaListItem(this.media);

	@override
	Widget build(BuildContext context) {
		return new Card(
			child: new Column(
				children: <Widget>[
					new FadeInImage.assetNetwork(
						placeholder: 'assets/placeholder.jpg',
						image: media.getBackdropPathUrl(),
						fit: BoxFit.cover,
						width: double.infinity,
						height: 200.0,
						fadeInDuration: new Duration(milliseconds: 40),
					)
				],
			),
		);
	}
}