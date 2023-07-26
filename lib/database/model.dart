// ignore: camel_case_types
// ignore_for_file: non_constant_identifier_names

// ignore: camel_case_types
class userModel {
  late String ClientName;
  late String Address;
  late int Orderid;

  userModel({
    required this.ClientName,
    required this.Address,
    required this.Orderid,
  });

  toJason() {
    return {
      'ClientName': ClientName,
      'Address': Address,
      'Orderid': Orderid,
    };
  }
}