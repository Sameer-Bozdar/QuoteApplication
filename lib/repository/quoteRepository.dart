


import 'package:courier_management_system/model/ImageModel.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/QuoteModel.dart';
import '../res/app_url.dart';

class QuoteRepository{


  BaseApiServices _apiServices = NetworkApiServices();
  Future <QuoteModel> fetchQuotes() async {
    try {
      dynamic response = await _apiServices.getGetApiResponsewithheader(AppUrl.quoteBaseUrl,'/H1rWHk83PHQdRuy1kM+iA==2tSdODS7qOLGW6Z0');

      QuoteModel.fromJson(response);
      print(response);
      return response;
    } catch (e) {
      throw e;
    }
  }



  Future<ImageModel> fetchPixabayImages() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.imgendpoint);
      print(AppUrl.imgendpoint);
      return response = ImageModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

}