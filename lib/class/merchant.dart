class FeatureMerchant {
  final int id;
  final String storeName;
  final String image;

  FeatureMerchant({this.id, this.storeName, this.image});

  factory FeatureMerchant.fromJson(Map<String, dynamic> json) {
    return FeatureMerchant(
        id: json['user_id'],
        storeName: json['store_name'],
        image: json['image']);
  }
}
