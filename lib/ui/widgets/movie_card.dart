part of 'widgets.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  MovieCardWidget({this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        child: Card(
          color: Colors.grey,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 3),
                  Container(
                    child: ActivityDescription(
                        title: "Judul", content: movie.title),
                  ),
                  SizedBox(height: 3),
                  Container(
                    child: ActivityDescription(
                        title: "Tahun", content: movie.year),
                  ),
                  SizedBox(height: 3),
                  Container(
                    child: ActivityDescription(
                        title: "Kode Tiket", content: movie.imdbID),
                  ),
                  SizedBox(height: 3),
                  Container(
                    child:
                        ActivityDescription(title: "Type", content: movie.type),
                  ),
                  SizedBox(height: 3),
                  Container(
                    child: ActivityDescription(
                        title: "Poster", content: movie.poster),
                  ),
                  SizedBox(height: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityDescription extends StatelessWidget {
  const ActivityDescription({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ":",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
