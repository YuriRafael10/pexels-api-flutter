import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'cUzMHx9MQddox97hvea9dXiPj8JkZzRbT9pUae48QCUa2cRc3UF4tG3q';

Future<List> fetchImages(String query) async {
  final url = 'https://api.pexels.com/v1/search?query=$query&per_page=15';

  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': apiKey},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['photos'];
  } else {
    throw Exception('Falha ao carregar imagens');
  }
}
