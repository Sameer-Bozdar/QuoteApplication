class QuoteModel {

  String? quote;
  String? author;
  String? category;
  QuoteModel({
      this.quote,
      this.author, 
      this.category,});

  QuoteModel.fromJson(dynamic json) {
    quote = json['quote'];
    author = json['author'];
    category = json['category'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quote'] = quote;
    map['author'] = author;
    map['category'] = category;
    return map;
  }

}