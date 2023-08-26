






import 'package:courier_management_system/repository/quoteRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../data/response/api_response.dart';
import '../model/ImageModel.dart';
import '../model/QuoteModel.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class QuoteViewViewModel with ChangeNotifier{

  QuoteViewViewModel(){
    fetchQuotesApi();
  }
  // List<QuoteModel> quoteList = [];
  bool _Loading = false;
  bool get Loading => _Loading;


  ApiResponse<QuoteModel> quoteData = ApiResponse.loading();

  ApiResponse<ImageModel> ImagesData = ApiResponse.loading();
  final _myRepo = QuoteRepository();


  setLoading(bool value){
    _Loading = value;
    notifyListeners();
  }


  setQuotesList(ApiResponse<QuoteModel> response) async {
    quoteData = await response;
    notifyListeners();
  }

  setImageList(ApiResponse<ImageModel> response) async {
    ImagesData = await response;
    notifyListeners();
  }

  Future <void> fetchQuotesApi()async {
    setLoading(true);
    setQuotesList(ApiResponse.loading());
   Utils.toastMessage('Loading');
   await _myRepo.fetchQuotes().then((value) {
     Utils.toastMessage('Completed');
      setQuotesList(ApiResponse.completed(value));
      setLoading(false);
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);

      setQuotesList(ApiResponse.error(error.toString()));
    });
  }

Future <void> fetchImageApi()async{
    setLoading(true);
    setImageList(ApiResponse.loading());
    Utils.toastMessage('Loading');
    await _myRepo.fetchPixabayImages().then((value) {
      setLoading(false);
      Utils.toastMessage('Completed');
      setImageList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setImageList(ApiResponse.error(error.toString()));
    });






}
}