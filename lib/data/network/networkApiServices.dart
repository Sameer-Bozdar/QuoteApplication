


import 'dart:convert';
import 'dart:io';

import 'package:courier_management_system/data/app_exceptions.dart';
import 'package:courier_management_system/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../model/QuoteModel.dart';


class NetworkApiServices extends BaseApiServices{
  List<QuoteModel> quoteList = [];


  
  
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url) ).timeout(Duration(seconds: 10));
      print(url.toString());
      print(response.toString());
       responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // Fetching Api with header X ApI KEY
  @override
  Future getGetApiResponsewithheader(String url ,String headers ) async {
  List<QuoteModel> quoteList = [];
  try {
  final response = await http.get(Uri.parse(url),headers: {'X-Api-Key':headers}).timeout(Duration(seconds: 10));
  // responseJson = returnResponse(response);
  print('url ${url}    ${'X-Api-Key'+headers}');
  print('response ${response.body.toString()}');
  if(response.statusCode == 200){
    var listdata = jsonDecode(response.body.toString());
    for(Map i in listdata){
      quoteList.add(QuoteModel.fromJson(i));

    }

    print('asjdy  ${quoteList[0].quote}');
    return quoteList;
  }else{
  return quoteList;
  }
   } on SocketException {
   throw FetchDataException('No Internet Connection');
   }
   // return responseJson;
   }


  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try {
     Response response =await post(
       Uri.parse(url),
       body: data
     ).timeout(Duration(seconds: 20));


      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }



    dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedtException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with server'+ 'with status code'+
            response.statusCode.toString());
    }

    }

  }



