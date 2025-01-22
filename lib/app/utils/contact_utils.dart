import 'package:mysite/app/utils/image_urls.dart';
import 'package:mysite/changes/links.dart';

class ContactUtils {
  final String url;
  final String icon;

  ContactUtils({required this.url, required this.icon});
}

List<ContactUtils> contactUtils = [
  ContactUtils(url: email, icon: ImageUrls.email),
  ContactUtils(url: gitHub, icon: ImageUrls.github),
  ContactUtils(url: linkedin, icon: ImageUrls.linkedin),
  ContactUtils(url: whatsapp, icon: ImageUrls.whatsApp),
  ContactUtils(url: instagram, icon: ImageUrls.instagram),
];
