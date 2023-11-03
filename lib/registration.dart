import 'package:image_picker_web/image_picker_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  ImagePickerWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
