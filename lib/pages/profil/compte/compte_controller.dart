import 'package:aya/pages/application.dart';
import 'package:aya/utils/requetes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CompteController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Future<Map> verification(String telephone, String code) async {
    //
    Response response =
        await requete.getE("utilisateur/verification/$telephone/$code");
    //
    if (response.isOk) {
      //
      print("ok: ${response.body}");
      //
      Get.back();
      return response.body;
    } else {
      //
      print("Erreur: ${response.body}");
      //
      Get.back();
      return {"serveurerreur": "oui"};
    }
  }

  Future<void> creer(Map utilisateur) async {
    //
    Response response = await requete.postE("utilisateur", utilisateur);
    //
    if (response.isOk) {
      //
      box.write("profil", response.body);
      //
      Get.back();
      Get.offAll(Application());
      Get.snackbar(
          "Succes", "Bienvenu voyagez en toute sécurité et simplicité !");

      //
    } else {
      //
      Get.back();
      Get.snackbar(
          "Erreur", "Un problème est survenu lors de l'enregistrement");
      //
    }
  }

  Future<void> mettreAjour(Map utilisateur) async {
    //
    Response response = await requete.putE("utilisateur", utilisateur);
    //
    if (response.isOk) {
      box.write("profil", response.body);
      //
      Get.back();
      Get.offAll(Application());
      Get.snackbar("Bienvenu", "Voyagez en toute sécurité et simplicité !");

      //
    } else {
      //
      Get.back();
      Get.snackbar(
          "Erreur", "Un problème est survenu lors de l'enregistrement");
      //
      //
    }
  }
}
