import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injection_molding_machine_application/data/models/product_model.dart';
import 'package:injection_molding_machine_application/presentation/widgets/constant.dart';

class MachineService {
  Future<ProductModel> getMachinesData() async {
    final res = await http
        .get(Uri.parse(Constants.baseUrl),
    //      headers: <String, String>{
    //   "Access-Control-Allow-Origin": "*",
    //   "Access-Control-Allow-Credentials": 'true',
    //   "Access-Control-Allow-Headers":
    //       "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    //   "Access-Control-Allow-Methods": "POST, OPTIONS"
    // }
    );
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      print('body: $body');
      ProductModel machinesData = body
          .map(
            (dynamic item) => ProductModel.fromJson(item),
          )
          .toList();
          print(machinesData);
      return machinesData;
    } else {
      print(res.statusCode);
      throw " Unable to retrieve posts.";
    }
  }
}
