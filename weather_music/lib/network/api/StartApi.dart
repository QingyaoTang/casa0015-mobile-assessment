
import 'package:weather_music/bean/start_info.dart';
import 'package:dio/dio.dart';
import 'package:weather_music/network/api/TranslateApi.dart';

String weatherUrl = "https://apis.tianapi.com/star/index?";

String searchUrl = "&astro=";

String startName = "taurus";

String appId = "key=b7856825400dd575886649aa84327434";


Future getStartInfo(startNa) async {

  var dio = Dio();

  var url = "$weatherUrl$appId$searchUrl$startNa"; // 替换为您的 API URL

  try {
    var response = await dio.get(url);

    // 请求成功
    if (response.statusCode == 200) {
      var responseData = response.data;
      var type = responseData.runtimeType;
      if(responseData.runtimeType != String){
        var res = responseData["result"]["list"];
        StartInfo startInfo = StartInfo();
        startInfo.startName = startNa;
        startInfo.health = res[4]["content"];
        startInfo.luckyColor = await getStartInfoToEn(res[5]["content"]);
        startInfo.luckyNumber = res[6]["content"];
        startInfo.info = await getStartInfoToEn(res[8]["content"]);
        print(startInfo.toString());
        return startInfo;
      }else{
        print('request error：$responseData["code"]');
        return null;
      }
      // 处理响应数据
    } else {
      // 请求失败
      print('request error：${response.statusCode}');
    }
  } catch (error) {
    // 发生错误
    print('request error：$error');
  }
}

