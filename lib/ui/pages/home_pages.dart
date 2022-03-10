part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Search Film Page'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: search,
                )),
          ),
          Center(
            child: RaisedButton(onPressed: () async {
              await context.read<MovieCubit>().getMovies(search.text);

              MovieState state = context.read<MovieCubit>().state;

              if (state is MovieLoaded) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoviePages()),
                );
              } else {
                Fluttertoast.showToast(
                    msg: "Unloaded", gravity: ToastGravity.CENTER);
              }
            }),
          ),
        ],
      ),
    );
  }
}
