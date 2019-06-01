import 'package:flutter/material.dart';
import 'package:movie_app/common/HttpHandler.dart';

class Home extends StatefulWidget {
	@override
	_HomeState createState() => new _HomeState();
}
class _HomeState extends State<Home> {

	@override
	void initState(){
		super.initState();
		_loadJson();
	}

	_loadJson() async {
		String data = await HttpHandler().fetchMovies();
		print(data);
	}

	@override
	Widget build(BuildContext context) {
	 	return new Scaffold(
	 		appBar: new AppBar(
	 			title: new Text("FlutterMovie"),
	 			actions: <Widget>[
	 				new IconButton(
	 					icon: new Icon(
	 						Icons.search,
	 						color: Colors.white,
	 					),
	 					onPressed: (){},
	 				)
	 			],
	 		),
	 		drawer: _getDrawer(context),
	 		bottomNavigationBar: new BottomNavigationBar(
	 			items: _getFooterItems(),
	 		),
	 	);			
	}

	Drawer _getDrawer(BuildContext context){
		var header = new DrawerHeader(child: new Material(),);

		ListTile _getItem(Icon icon, String description, String route){
			return new ListTile(
				trailing: icon,
				title: new Text(description),
				onTap: () {
					setState((){
						if(route == "/close"){
							Navigator.of(context).pop();							
						}
					});
				}
			);
		}

		ListView listView = new ListView(
			children: <Widget>[
				header,
				_getItem(
					new Icon(
						Icons.movie
					),
					"Peliculas",
					"/movies"
				),
				new Divider(
					height: 5.0,
				),
				_getItem(
					new Icon(
						Icons.live_tv
					),
					"Televisión",
					"/live_tv"
				),
				new Divider(
					height: 5.0,
				),
				_getItem(
					new Icon(
						Icons.close
					),
					"Cerrar",
					"/close"
				),
				
			],
		);

		return new Drawer(
			child: listView,
		);

	}

	List<BottomNavigationBarItem> _getFooterItems(){
		return [
			new BottomNavigationBarItem(
				icon: new Icon(
					Icons.thumb_up
				),
				title: new Text('Populares'),
			),
			new BottomNavigationBarItem(
				icon: new Icon(
					Icons.update
				),
				title: new Text('Próximamente'),
			),
			new BottomNavigationBarItem(
				icon: new Icon(
					Icons.star
				),
				title: new Text('Mejor valoradas'),
			)
		];
	}
}