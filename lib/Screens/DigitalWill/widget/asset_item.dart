import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/will_bloc.dart';
import '../bloc/will_events.dart';
import '../bloc/will_state.dart';

class NomineeController {
  final int nomineeId;
  final TextEditingController controller;

  NomineeController({
    required this.nomineeId,
    required this.controller,
  });
}

class AssetItem extends StatefulWidget {
  final Asset asset;
  final int pageNumber;

  // final void Function(List<Asset> newAssets) updateWill;

  const AssetItem({
    super.key,
    required this.asset,
    required this.pageNumber,
  });

  @override
  State<AssetItem> createState() => AssetItemState();
}

class AssetItemState extends State<AssetItem> {
  late Asset asset;
  final _formKey = GlobalKey<FormState>();
  late final List<NomineeController> nomineeControllers;
  bool equalShareCheckBox = false;

  void printState() {
    for (var controller in nomineeControllers) {
      //
    }
  }

  AssetState getAssetState() {
    Map<int, double> nomineeShares = {};
    for (var controller in nomineeControllers) {
      nomineeShares[controller.nomineeId] =
          double.tryParse(controller.controller.text) ?? 0;
    }
    return AssetState(
        assetId: asset.assetId,
        nomineeShares: nomineeShares,
        equalDistributionCheckbox: equalShareCheckBox);
  }

  bool validateForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();

      List<double> values = nomineeControllers
          .map((controller) => double.parse(controller.controller.text))
          .toList();

      double sum = values.fold(0, (a, b) => a + b);
      return sum.round() == 100 ? true : false;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    asset = widget.asset.copyWith();
    nomineeControllers = [];
    for (var nominee in asset.nominees) {
      var controller = TextEditingController(
          text: nominee.share.toStringAsFixed(2)); // Initialize share value
      nomineeControllers.add(NomineeController(
        nomineeId: nominee.id,
        controller: controller,
      ));
    }
  }

  void cb(TextEditingController controller, String text) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.text = text;
    });
  }

  @override
  void dispose() {
    for (var controller in nomineeControllers) {
      controller.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WillBloc, WillState>(
      builder: (context, state) {
        var asset = state.assets[widget.pageNumber];
        for (var nominee in asset.nominees) {}
        return Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Center(
                  child: Column(
                    children: [
                      Text(asset.assetName),
                      Text(asset.assetIdentity.toString()),
                    ],
                  ),
                ),
                // floating: true,
                pinned: true,
                stretch: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: Container(
                    height: 80,
                    color: const Color(0xFF00436A),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton.extended(
                        heroTag: 'checkbox1',
                        onPressed: () {},
                        label: Row(
                          children: [
                            Checkbox(
                              value: asset.equalDistributionCheckbox,
                              onChanged: (value) {
                                if (value == true) {
                                  if (context
                                      .read<WillBloc>()
                                      .state
                                      .sameDistributionCheckbox) {
                                    context
                                        .read<WillBloc>()
                                        .add(EqualDistributeAllAssets());
                                  }
                                  context.read<WillBloc>().add(
                                        EqualDistribute(
                                          assetId: asset.assetId,
                                        ),
                                      );
                                } else if (value == false) {
                                  //
                                  if (context
                                      .read<WillBloc>()
                                      .state
                                      .sameDistributionCheckbox) {
                                    context
                                        .read<WillBloc>()
                                        .add(UndoEqualDistributeAllAssets());
                                  } else {
                                    context.read<WillBloc>().add(
                                          UndoEqualDistribute(
                                            assetId: asset.assetId,
                                          ),
                                        );
                                  }
                                }
                              },
                            ),
                            const Text(
                              'Distribute Equally',
                            ),
                          ],
                        ),
                        backgroundColor: const Color(0xff429bb8),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final Nominee nominee = asset.nominees[index];
                    final controller = nomineeControllers
                        .firstWhere(
                            (element) => element.nomineeId == nominee.id)
                        .controller;
                    cb(controller, nominee.share.toString());

                    return Column(
                      children: [
                        ListTile(
                          leading: Text('${index + 1}',
                              style: const TextStyle(color: Colors.white)),
                          title: Text(nominee.name,
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Row(
                            children: [
                              Expanded(
                                  child: Text(nominee.relation,
                                      style: const TextStyle(
                                          color: Colors.white))),
                              Expanded(
                                child: TextFormField(
                                  controller: controller,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  decoration: const InputDecoration(
                                    hintText: "Nominee Share",
                                    suffixText: '%',
                                    hintStyle: TextStyle(color: Colors.white),
                                    // Color of the hint text
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .white), // Color of the border when not focused
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .white), // Color of the border when focused
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .red), // Color of the border when there's an error
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors
                                              .red), // Color of the border when focused and there's an error
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.white),
                                  // Color of the entered text
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter a value';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Enter a number';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    // Parse the value as a double
                                    double parsedValue =
                                        double.tryParse(value ?? '0') ?? 0;

                                    // Round the parsed value to two decimal places
                                    double roundedValue = double.parse(
                                        parsedValue.toStringAsFixed(2));

                                    asset = asset.copyWith(
                                      nominees: [
                                        ...asset.nominees.map(
                                          (e) {
                                            if (e.id != nominee.id) {
                                              return e;
                                            }
                                            return nominee.copyWith(
                                              share: roundedValue,
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        if (index >= asset.nominees.length)
                          const SizedBox(height: 20),
                      ],
                    );
                  },
                  childCount: asset.nominees.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NomineeItem extends StatefulWidget {
  final int index;
  final Nominee nominee;
  final double share;

  const NomineeItem({
    super.key,
    required this.index,
    required this.nominee,
    required this.share,
  });

  @override
  State<NomineeItem> createState() => _NomineeItemState();
}

class _NomineeItemState extends State<NomineeItem> {
  late double share;

  Map<String, dynamic> getNomineeState() {
    return {
      "nomineeId": widget.nominee.id,
      "share": share,
    };
  }

  @override
  void initState() {
    super.initState();
    share = widget.share;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text('${widget.index + 1}'),
          title: Text(widget.nominee.name),
          subtitle: Row(
            children: [
              Expanded(child: Text(widget.nominee.relation)),
              Expanded(
                child: TextFormField(
                  initialValue: widget.share.toStringAsFixed(2),
                  decoration: const InputDecoration(
                    hintText: "Nominee Share",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a value';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Enter a number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    share = double.tryParse(value!) ?? 0;
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
