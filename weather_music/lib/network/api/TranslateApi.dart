

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

String weatherUrl = "http://api.fanyi.baidu.com/api/trans/vip/translate?";

String searchUrl = "q=";

String formatName = "&from=zh&to=en";

String appIdUrl = "&appid=";

String saltUrl = "&salt=";

String appId = "20240430002039144";

String secret = "wiPG0dN6qHAFTxLQsUuG";

String sign = "&sign=";

String generateSalt(int length) {
  const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random.secure();

  return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
}

String generateSaltedMD5(String password) {
  var bytes = utf8.encode(password); // 将密码和盐转换为字节数组
  var digest = md5.convert(bytes); // 计算MD5哈希值
  return digest.toString(); // 返回哈希值的字符串表示
}

Future getStartInfoToEn(String input) async {

  var dio = Dio();

  var salt = "1435660288";

  var str = "$appId$input$salt$secret";

  var signStr = generateSaltedMD5(str);

  var url = "$weatherUrl$searchUrl$input$formatName$appIdUrl$appId$saltUrl$salt$sign$signStr"; // 替换为您的 API URL

  try {
    var response = await dio.get(url);

    // 请求成功
    if (response.statusCode == 200) {
      var responseData = response.data;
      var res = responseData["trans_result"];
      var str = res[0]["dst"];
      if(str.runtimeType == String){
        return str;
      }else{
        print('request error，status：$responseData["code"]');
        return null;
      }
      // 处理响应数据
    } else {
      // 请求失败
      print('request error，status：${response.statusCode}');
    }
  } catch (error) {
    // 发生错误
    print('request error：$error');
  }
}