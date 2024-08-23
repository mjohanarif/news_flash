import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  final String apiKey = dotenv.get('API_KEY');
  final String newsHeadlineKey = 'NewsHeadlineKey';
}
