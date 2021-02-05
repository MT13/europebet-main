import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:eurpebet_main/serializables/game_unit.dart';

class Api {
  final HttpClient _httpClient = HttpClient();

  final String _urlContent =
      'https://api.europebet.com/api/content/initData/GetInitData?IncludedDocumentTypeNames=navigationLink';
  final String _urlGames =
      'https://api.europebet.com/api/games/game/GetGames?Limit=10&Offset=0&WithPromotedGames=true';
  final String _urlPopular =
      'https://api.europebet.com/api/games/game/GetGames?Limit=10&SortByPopularity=true&Offset=0';
  final String _urlLiveCasino =
      'https://api.europebet.com/api/games/game/GetGames?Limit=10&Offset=0&PageId=2';
  final String _urlJackpot =
      'https://api.europebet.com/api/games/game/GetGames?Limit=10&Offset=0&PageId=1&JackpotIds=20005';

  Future<List<GameUnit>> getGamesData(String category) async {
    final jsonData = rootBundle.loadString("assets/json/games/$category.json");
    final jsonResponse = JsonDecoder().convert(await jsonData);
    if (jsonResponse == null || jsonResponse['games'] == null ||
        jsonResponse is! Map) {
      throw('Error retrieving json');
    }

      final List<GameUnit> units = jsonResponse['games'].map<GameUnit>((
          dynamic data) => GameUnit.fromJson(data)).toList();

      return units;
    }

        // In case urls will work again
        Future<Map<String, dynamic>> _getJsonFromUri(Uri uri)
    async {
      try {
        final httpRequest = await _httpClient.getUrl(uri);
        final httpResponse = await httpRequest.close();
        if (httpResponse.statusCode != HttpStatus.OK) {
          return null;
        }

        final responseBody = await httpResponse.transform(utf8.decoder).join();
        return json.decode(responseBody);
      } on Exception catch (e) {
        print('$e');
        return null;
      }
    }
  }
