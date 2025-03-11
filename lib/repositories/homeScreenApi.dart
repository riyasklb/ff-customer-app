import 'package:project/helper/utils/generalImports.dart';

Future getHomeScreenDataApi(
    {required BuildContext context,
    required Map<String, dynamic> params}) async {
      print('-----------------homescreeenddataapi----------------------');
  var response = await sendApiRequest(
      apiName: ApiAndParams.apiShop,
      params: params,
      isPost: false,
      context: context);

  return json.decode(response);
}
