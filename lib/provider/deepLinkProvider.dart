import 'package:project/helper/utils/generalImports.dart';

class DeepLinkProvider extends ChangeNotifier {
  String message = "";

  Uri? _initialUri = null;
  late AppLinks _appLinks;

  getDeepLinkProvider() async {
    print('hai brooooooooooooooooooooooo');
    try {
      await initDeepLinks();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();
    print('hai dasaaaaaaaaa');
    // Handle links
    _appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      _initialUri = uri;
    });
    print('hai dasaaaaaaaaa11111111111111 $_initialUri');
  }

  changeState() {
    notifyListeners();
  }

  getDeepLinkRedirection({required BuildContext context}) {
    if (_initialUri != null) {
      String? productSlug = _initialUri?.path.toString().split("/").last;
      print('product----------> $productSlug');
      Navigator.pushNamed(
        context,
        productDetailScreen,
        arguments: [
          productSlug.toString(),
          getTranslatedValue(Constant.navigatorKay.currentContext!, "app_name"),
          null
        ],
      );
      _initialUri = null;
    }
  }
}
