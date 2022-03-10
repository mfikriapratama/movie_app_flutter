import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:example1/model/models.dart';
import 'package:http/http.dart' as http;

part 'movie_service.dart';

String baseURL = 'http://www.omdbapi.com/?apikey=cfbcde80&';
