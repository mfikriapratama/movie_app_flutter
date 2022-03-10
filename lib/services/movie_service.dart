part of 'services.dart';

class MovieServices {
  static Future<ApiReturnValue<List<Movie>>> getAllMovie(String film,
      {http.Client client}) async {
    String url = baseURL + "s=" + film;
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    _mapHeader['Content-Type'] = "application/json";
    _mapHeader['Accept'] = "application/json";

    http.Response response;

    try {
      response = await client
          .get(url, headers: _mapHeader)
          .timeout(Duration(seconds: 5));
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed get Response');
    }

    var data = jsonDecode(response.body);

    String message = data['Response'];

    if (message == "False") {
      return ApiReturnValue(message: data['Error']);
    }

    List<Movie> movies =
        (data['Search'] as Iterable).map((e) => Movie.fromJson(e)).toList();

    return ApiReturnValue(value: movies);
  }
}
