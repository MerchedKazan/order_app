class OrderModel {
  String? id;
  String? total;
  String? createdAt;
  String? image;
  String? currency;
  Address? address;
  List<Items>? items;

  OrderModel();

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    createdAt = json['created_at'];
    image = json['image'];
    currency = json['currency'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['total'] = this.total;
  //   data['created_at'] = this.createdAt;
  //   data['image'] = this.image;
  //   data['currency'] = this.currency;
  //   if (this.address != null) {
  //     data['address'] = this.address!.toJson();
  //   }
  //   if (this.items != null) {
  //     data['items'] = this.items!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Address {
  String? lat;
  String? lng;

  Address({this.lat, this.lng});

  Address.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['lat'] = this.lat;
  //   data['lng'] = this.lng;
  //   return data;
  // }
}

class Items {
  int? id;
  String? name;
  String? price;

  Items({this.id, this.name, this.price});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['price'] = this.price;
  //   return data;
  // }
}