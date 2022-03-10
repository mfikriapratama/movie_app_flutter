part of 'pages.dart';

class MoviePages extends StatefulWidget {
  @override
  _MoviePagesState createState() => _MoviePagesState();
}

class _MoviePagesState extends State<MoviePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "List Movie",
          ),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.white,
          ),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          color: Colors.blueAccent,
          height: double.infinity,
          width: double.infinity,
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (_, state) => (state is MovieLoaded)
                ? (state.movie.isEmpty)
                    ? Center(
                        child: Text('Data Kosong'),
                      )
                    : ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                            children: state.movie
                                .map(
                                  (e) => Padding(
                                    padding: EdgeInsets.only(
                                        top: (e == state.movie.first) ? 8 : 0,
                                        bottom: 0),
                                    child: MovieCardWidget(
                                      movie: e,
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      )
                : (state is MovieLoadingFailed)
                    ? Center(
                        child: Text("TERJADI KESALAHAN SILAKAN LOGIN KEMBALI"),
                      )
                    : Center(child: Text('Loading...')),
          ),
        ));
  }
}
