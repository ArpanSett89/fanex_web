class ChakraEndDateListResponseModel {
  String? ack;
  String? details;
  List<Data>? data;

  ChakraEndDateListResponseModel({this.ack, this.details, this.data});

  ChakraEndDateListResponseModel.fromJson(Map<String, dynamic> json) {
    ack = json['ack'];
    details = json['details'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data?.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ack'] = this.ack;
    data['details'] = this.details;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? date;

  Data({this.id, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    return data;
  }
}