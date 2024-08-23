import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  final String apiKey = dotenv.get('API_KEY');
  final String newsHeadlineKey = 'NewsHeadlineKey';
  final String newsKey = 'NewsKey';
  final String imagePlaceholderUrl =
      'https://diony.co.uk/wp-content/themes/diony/assets/images/placeholder-news.jpeg';
}
