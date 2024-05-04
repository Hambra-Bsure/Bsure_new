
import 'package:flutter/material.dart';

import '../widget/will_response.dart';

class NomineeController {
  final int nomineeId;
  final TextEditingController controller;

  NomineeController({
    required this.nomineeId,
  }) : controller = TextEditingController();
}

class AssetControllers {
  final List<NomineeControllers> assetTextControllers;

  const AssetControllers._({required this.assetTextControllers});

  factory AssetControllers(List<Asset> assets) {
    final List<NomineeControllers> assetControllers = [];

    for (var asset in assets) {
      List<NomineeController> nomineeControllers = [];
      for (var nominee in asset.nominees) {
        var controller = NomineeController(nomineeId: nominee.id);
        nomineeControllers.add(controller);
      }
      assetControllers.add(NomineeControllers(controllers: nomineeControllers));
    }

    return AssetControllers._(assetTextControllers: assetControllers);
  }
}

class NomineeControllers {
  final List<NomineeController> controllers;

  const NomineeControllers({required this.controllers});
}
