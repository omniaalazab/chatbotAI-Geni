import 'package:aichatbot/helper/dio_helper.dart';
import 'package:dio/dio.dart';

class ChatService {


  Future<String> sendMessage(String message) async {
    try {
      final response = await DioHelper.dio.post(
        baseUrl,
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
        data: {
          "contents": [
            {
              "role": "user",
              "parts": [
                {"text": message}
              ]
            }
          ]
        },
      );

      return response.data["candidates"][0]["content"]["parts"][0]["text"];
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        return "Error: Too many requests. Try again later.";
      } else {
        return "Error: ${e.message}";
      }
    }
  }
}
