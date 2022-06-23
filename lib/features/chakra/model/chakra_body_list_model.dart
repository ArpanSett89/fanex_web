class ChakraBodyListModel {
  String? ack;
  String? details;
  int? count;
  List<Data>? data;
  String? start;
  String? end;

  ChakraBodyListModel(
      {this.ack, this.details, this.count, this.data, this.start, this.end});

  ChakraBodyListModel.fromJson(Map<String, dynamic> json) {
    ack = json['ack'];
    details = json['details'];
    count = json['count'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =Map<String, dynamic>();
    data['ack'] = this.ack;
    data['details'] = this.details;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

class Data {
  String? userUsername;
  int? userId;
  int? cash;
  int? coins;
  int? percentFinish;
  int? promotionCoins;
  int? followers;
  int? ranking;
  String? imageUrl;

  Data(
      {this.userUsername,
        this.userId,
        this.cash,
        this.coins,
        this.percentFinish,
        this.promotionCoins,
        this.followers,
        this.ranking,
        this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    userUsername = json['user__username'];
    userId = json['user__id'];
    cash = json['cash'];
    coins = json['coins'];
    percentFinish = json['percentFinish'];
    promotionCoins = json['promotionCoins'];
    followers = json['followers'];
    ranking = json['ranking'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =Map<String, dynamic>();
    data['user__username'] = this.userUsername;
    data['user__id'] = this.userId;
    data['cash'] = this.cash;
    data['coins'] = this.coins;
    data['percentFinish'] = this.percentFinish;
    data['promotionCoins'] = this.promotionCoins;
    data['followers'] = this.followers;
    data['ranking'] = this.ranking;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}