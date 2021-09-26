import 'package:generator/data/models/Video.dart';
import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/pages/start_page.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'AdmobController.dart';

class SplashController extends GetxController {
  final admob = Get.find<AdmobController>();
  Logger log = Logger();
  String igUrl =
      'https://www.instagram.com/reel/CSnEXZGDcJ1/?utm_source=ig_web_copy_link';
  String apiEnding = '__a=1';
  List<Videos> lista = [];

  bool showInterstitial = false;

  @override
  void onReady() async {
    log.i("onReady of splash controller");
    await admob.loadOpenad();
    super.onReady();
    // await getIgVideo(igUrl);
    await Future.delayed(Duration(seconds: 3), () {
      admob.showAppOpen();
      Get.off(() => StartPage(), transition: Transition.zoom);
    });
  }

  void onInit() async {
    super.onInit();
    log.i("Init of splash controller");
    // await prepareApi();
    // await admob.loadInterstitial();
  }

  prepareApi() async {
    // final response =await http.get("https://twitter-fleets.herokuapp.com/");
  }

  Future<List<Videos>> getIgVideo(String igUrl) async {
    log.d("sending http for ig");

    //build the url to get the json data

    var position = igUrl.indexOf('?');
    log.v(position);
    igUrl = igUrl.substring(0, position + 1);
    igUrl = '$igUrl$apiEnding';
    log.v(igUrl);

    Uri uri = Uri.parse(igUrl);
    final response = await http.get(uri);
    final data = videosFromJson(response.body);

    lista.add(data);
    log.v(lista[0].graphql.shortcodeMedia.videoUrl);
    return lista;
  }
}
