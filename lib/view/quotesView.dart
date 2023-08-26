import 'package:courier_management_system/model/ImageModel.dart';
import 'package:courier_management_system/view_model/quoteView_ViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../data/response/api_response.dart';
import '../data/response/status.dart';
import '../model/QuoteModel.dart';

class QuotesHome extends StatefulWidget {
  const QuotesHome({super.key});

  @override
  State<QuotesHome> createState() => _QuotesHomeState();
}

class _QuotesHomeState extends State<QuotesHome> {
  ApiResponse<QuoteModel> quotesData = ApiResponse.loading();

  List<QuoteViewViewModel> quoteList = [];
  List<Hits>? hits;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getGetApiResponsewithheader('/H1rWHk83PHQdRuy1kM+iA==2tSdODS7qOLGW6Z0');
  }

  // Future<List<QuoteModel>> getGetApiResponsewithheader(String headers) async {
  //   dynamic responseJson;
  //   try {
  //     final response = await http.get(
  //         Uri.parse('https://api.api-ninjas.com/v1/quotes?'),
  //         headers: {'X-Api-Key': headers}).timeout(Duration(seconds: 10));
  //     var listdata = jsonDecode(response.body.toString());
  //     if (response.statusCode == 200) {
  //       for (Map i in listdata) {
  //         quoteList.add(QuoteModel.fromJson(i));
  //       }
  //       return quoteList;
  //     } else {
  //       return quoteList;
  //     }
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //   // return responseJson;
  // }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<QuoteViewViewModel>(context);
    final quotesViewModel = Provider.of<QuoteViewViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Quote Home'),
        ),
        body: Stack(children: [
          Consumer<QuoteViewViewModel>(builder: (context, value, _) {
            if (kDebugMode) {
              print(value.ImagesData.status);
            }
            switch (value.ImagesData.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                    child: Text(value.ImagesData.message.toString()));
              case Status.COMPLETED:
                return Column(
                  children: [
                    Image.network(
                      value.ImagesData.data!.hits![0].largeImageURL.toString(),
                      // height: double.infinity,
                      // fit: BoxFit.fill,
                    ),
                    Text(value.ImagesData.data!.hits![0].imageHeight.toString())
                  ],
                );

              default:
                const Text('');
            }
            return Container(
              child: Text('no data '),
            );
          }),

          // Consumer<QuoteViewViewModel>(
          //     builder: (context, value, _){
          //   return Text(value.quoteData.data!.quote.toString());
          //
          // })

          // Container(
          //   child: FutureBuilder(
          //       future: getGetApiResponsewithheader(
          //           '/H1rWHk83PHQdRuy1kM+iA==2tSdODS7qOLGW6Z0'),
          //       builder: (context, snapshot) {
          //         if (!snapshot.hasData) {
          //           return CircularProgressIndicator();
          //         } else {
          //           return SizedBox(
          //             height: 150,
          //             child: ListView.builder(
          //                 itemCount: 1,
          //                 itemBuilder: (context, index) {
          //                   return Container(
          //                     child: Card(
          //                       child: Text(quoteList[index].quote!),
          //                     ),
          //                   );
          //                 }),
          //           );
          //         }
          //
          //         // return Text(snapshot.data!.quoteList[0].quote.toString());
          //       }),
          // ),
          // Positioned(
          //   top: 400,
          //   child: Container(
          //     child: FutureBuilder(
          //         future: getGetApiResponsewithheader(
          //             '/H1rWHk83PHQdRuy1kM+iA==2tSdODS7qOLGW6Z0'),
          //         builder: (context, snapshot) {
          //           if (!snapshot.hasData) {
          //             return CircularProgressIndicator();
          //           } else {
          //             return RoundButton(
          //                 title: quoteList[0].category.toString(),
          //                 onPress: () {
          //
          //                 });
          //           }
          //         }),
          //   ),
          // )
        ]));
  }
}
