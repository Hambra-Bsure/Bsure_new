import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final bool isEditable;

  // final void Function(List<Asset> newAssets) updateWill;

  const AssetItem({
    super.key,
    required this.asset,
    required this.pageNumber,
    required this.isEditable,
  });

  @override
  State<AssetItem> createState() => AssetItemState();
}

class AssetItemState extends State<AssetItem> {
  late Asset asset;
  final _formKey = GlobalKey<FormState>();
  late final List<NomineeController> nomineeControllers;
  bool equalShareCheckBox = false;
  bool isEditing = false;

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
          text: nominee.share.toStringAsFixed(
              2)); // Initialize share value to two decimal places
      nomineeControllers.add(NomineeController(
        nomineeId: nominee.id,
        controller: controller,
      ));
    }
  }

  String formatDetails(Asset asset) {
    if (asset.category == 'BankAccount') {
      String bankName = asset.details
              .firstWhere((detail) => detail.fieldName == 'bankName')
              .fieldValue ??
          'N/A';
      String accountNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'accountNumber')
              .fieldValue ??
          'N/A';
      return 'Bank Name: $bankName\nAccount Number: $accountNumber';
    } else if (asset.category == 'MutualFund') {
      String amcName = asset.details
              .firstWhere((detail) => detail.fieldName == 'amcName')
              .fieldValue ??
          'N/A';
      String folioNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'folioNumber')
              .fieldValue ??
          'N/A';
      return 'AMC Name: $amcName\nFolio Number: $folioNumber';
    } else if (asset.category == 'StockBroker') {
      String brokerName = asset.details
              .firstWhere((detail) => detail.fieldName == 'brokerName')
              .fieldValue ??
          'N/A';
      String dematAccountNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'dematAccountNumber')
              .fieldValue ??
          'N/A';
      return 'Broker Name: $brokerName\nDemat Account Number: $dematAccountNumber';
    } else if (asset.category == 'LifeInsurance') {
      String insuranceCompanyName = asset.details
              .firstWhere(
                  (detail) => detail.fieldName == 'insuranceCompanyName')
              .fieldValue ??
          'N/A';
      String policyNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'policyNumber')
              .fieldValue ??
          'N/A';
      return 'Insurance CompanyName: $insuranceCompanyName\nPolicy Number: $policyNumber';
    } else if (asset.category == 'NonLifeInsurance') {
      String insuranceCompanyName = asset.details
              .firstWhere(
                  (detail) => detail.fieldName == 'insuranceCompanyName')
              .fieldValue ??
          'N/A';
      String policyNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'policyNumber')
              .fieldValue ??
          'N/A';
      return 'Insurance Company Name: $insuranceCompanyName\nPolicy Number: $policyNumber';
    } else if (asset.category == 'PostOfficeAccount') {
      String branchName = asset.details
              .firstWhere((detail) => detail.fieldName == 'branchName')
              .fieldValue ??
          'N/A';
      String accountNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'accountNumber')
              .fieldValue ??
          'N/A';
      return 'Branch Name: $branchName\nAccount Number: $accountNumber';
    } else if (asset.category == 'CryptoExchange') {
      String exchangeName = asset.details
              .firstWhere((detail) => detail.fieldName == 'exchangeName')
              .fieldValue ??
          'N/A';
      String accountNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'accountNumber')
              .fieldValue ??
          'N/A';
      return 'Exchange Name: $exchangeName\nAccount Number: $accountNumber';
    } else if (asset.category == 'Nps') {
      String pranNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'pranNumber')
              .fieldValue ??
          'N/A';
      return 'Pran Number: $pranNumber';
    } else if (asset.category == 'Ppf') {
      String ppfAccountNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'ppfAccountNumber')
              .fieldValue ??
          'N/A';
      String institutionName = asset.details
              .firstWhere((detail) => detail.fieldName == 'institutionName')
              .fieldValue ??
          'N/A';
      return 'PPF AccountNumber: $ppfAccountNumber\nInstitution Name: $institutionName';
    } else if (asset.category == 'Pf') {
      String uanNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'uanNumber')
              .fieldValue ??
          'N/A';
      return 'Uan Number: $uanNumber';
    } else if (asset.category == 'RealEstate') {
      String address = asset.details
              .firstWhere((detail) => detail.fieldName == 'address')
              .fieldValue ??
          'N/A';
      String khataNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'khataNumber')
              .fieldValue ??
          'N/A';
      return 'Address: $address\nKhata Number: $khataNumber';
    } else if (asset.category == 'Other') {
      String assetName = asset.details
              .firstWhere((detail) => detail.fieldName == 'assetName',
                  orElse: () => const Detail(fieldName: '', fieldValue: 'N/A'))
              .fieldValue ??
          'N/A';
      return 'Asset Name: $assetName';
    }
    if (asset.category == 'LoanGiven') {
      String borrowerName = asset.details
              .firstWhere((detail) => detail.fieldName == 'borrowerName',
                  orElse: () => const Detail(fieldName: '', fieldValue: 'N/A'))
              .fieldValue ??
          'N/A';
      String loanAmountStr = asset.details
              .firstWhere((detail) => detail.fieldName == 'loanAmount',
                  orElse: () => const Detail(fieldName: '', fieldValue: '0'))
              .fieldValue ??
          '0';
      int loanAmount = int.tryParse(loanAmountStr) ??
          0; // Safely parse the loanAmount string to an int, defaulting to 0 if parsing fails
      return 'Borrower Name: $borrowerName\nLoan Amount: $loanAmount';
    } else if (asset.category == 'Vehicle') {
      String brandName = asset.details
              .firstWhere((detail) => detail.fieldName == 'brandName')
              .fieldValue ??
          'N/A';
      String registrationNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'registrationNumber')
              .fieldValue ??
          'N/A';
      return 'Brand Name: $brandName\n Registration Number: $registrationNumber';
    } else if (asset.category == 'Gold') {
      String metalType = asset.details
              .firstWhere((detail) => detail.fieldName == 'metalType')
              .fieldValue ??
          'N/A';

      String weightInGramsStr = asset.details
              .firstWhere((detail) => detail.fieldName == 'weightInGrams',
                  orElse: () => const Detail(fieldName: '', fieldValue: '0'))
              .fieldValue ??
          '0';
      int weight = int.tryParse(weightInGramsStr) ??
          0; // Safely parse the loanAmount string to an int, defaulting to 0 if parsing fails
      return 'Metal Type: $metalType\nWeight: $weight';
    } else if (asset.category == 'Bond') {
      String bondName = asset.details
              .firstWhere((detail) => detail.fieldName == 'bondName')
              .fieldValue ??
          'N/A';
      String bondNumber = asset.details
              .firstWhere((detail) => detail.fieldName == 'bondNumber')
              .fieldValue ??
          'N/A';
      return 'Bond Name: $bondName\nBond Number: $bondNumber';
    } else if (asset.category == 'Esop') {
      String companyName = asset.details
              .firstWhere((detail) => detail.fieldName == 'companyName')
              .fieldValue ??
          'N/A';
      String? numberOfStocksStr = asset.details
              .firstWhere((detail) => detail.fieldName == 'numberOfStocks',
                  orElse: () =>
                      const Detail(fieldName: 'numberOfStocks', fieldValue: ''))
              .fieldValue ??
          ''; // Provide a default value of '' if fieldValue is null

      int numberOfStocks = int.tryParse(numberOfStocksStr) ??
          0; // Safely parse thcks string to an int, defaulting to 0 if parsing fails

      return 'Company Name: $companyName\n Number of stocks: $numberOfStocks';
    }
    return asset.details
        .map((detail) => '${detail.fieldName}: ${detail.fieldValue ?? 'N/A'}')
        .join('\n');
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
                backgroundColor: Colors.white,
                title: Container(
                  color: const Color(0xff429bb8),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          formatDetails(asset),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          // Ensure text color is set to white for better visibility
                          //textAlign: TextAlign.left, // Align text to the left
                        ),
                      ],
                    ),
                  ),
                ),
                // floating: true,
                pinned: true,
                stretch: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton.extended(
                      heroTag: 'checkbox1',
                      onPressed: () {
                        double totalShares =
                            100.0; // Assuming total shares to distribute is 100
                        double equalShare = totalShares / asset.nominees.length;

                        for (var controller in nomineeControllers) {
                          double roundedShare =
                              double.parse(equalShare.toStringAsFixed(2));
                          controller.controller.text =
                              roundedShare.toStringAsFixed(2);

                          // Update the underlying asset data
                          asset = asset.copyWith(
                            nominees: asset.nominees.map((nominee) {
                              if (nominee.id == controller.nomineeId) {
                                return nominee.copyWith(share: roundedShare);
                              }
                              return nominee;
                            }).toList(),
                          );
                        }
                      },
                      label: Row(
                        children: [
                          Checkbox(
                            value: asset.equalDistributionCheckbox,
                            onChanged: (value) {
                              setState(() {
                                asset = asset.copyWith(
                                    equalDistributionCheckbox: value ??
                                        false); // Default to false if null
                              });
                              if (value == true) {
                                double totalShares =
                                    100.0; // Assuming total shares to distribute is 100
                                double equalShare =
                                    totalShares / asset.nominees.length;

                                for (var controller in nomineeControllers) {
                                  double roundedShare = double.parse(
                                      equalShare.toStringAsFixed(2));
                                  controller.controller.text =
                                      roundedShare.toStringAsFixed(2);

                                  // Update the underlying asset data
                                  asset = asset.copyWith(
                                    nominees: asset.nominees.map((nominee) {
                                      if (nominee.id == controller.nomineeId) {
                                        return nominee.copyWith(
                                            share: roundedShare);
                                      }
                                      return nominee;
                                    }).toList(),
                                  );
                                }
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
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      backgroundColor: const Color(0xff429bb8),
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
                    cb(controller, nominee.share.toStringAsFixed(2));

                    return Column(
                      children: [
                        ListTile(
                          leading: Text('${index + 1}',
                              style: const TextStyle(color: Colors.black)),
                          title: Text(nominee.name,
                              style: const TextStyle(color: Colors.black)),
                          subtitle: Row(
                            children: [
                              Expanded(
                                  child: Text(nominee.relation,
                                      style: const TextStyle(
                                          color: Colors.black))),
                              Expanded(
                                child: TextFormField(
                                  enabled: widget.isEditable && !isEditing,
                                  controller: controller,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    DecimalTextInputFormatter(decimalRange: 2),
                                    // Use the formatter
                                  ],
                                  decoration: const InputDecoration(
                                    hintText: "Nominee Share",
                                    suffixText: '%',
                                    hintStyle: TextStyle(color: Colors.black),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter a value';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Enter a number';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        isEditing = true; // Mark as editing
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('You have edited this. This will disable the "Distribute Equally" checkbox.'),
                                        ),
                                      );
                                    }
                                  },
                                  onSaved: (value) {
                                    // Parse the value as a double
                                    double parsedValue =
                                        double.tryParse(value ?? '0') ?? 0;

                                    // Round the parsed value to two decimal places
                                    double roundedValue = double.parse(
                                        parsedValue.toStringAsFixed(2));

                                    // Update the asset nominees with the rounded value
                                    asset = asset.copyWith(
                                      nominees: [
                                        ...asset.nominees.map((e) {
                                          if (e.id != nominee.id) {
                                            return e;
                                          }
                                          return nominee.copyWith(
                                            share: roundedValue,
                                          );
                                        }),
                                      ],
                                    );

                                    // Update the controller text to reflect the rounded value
                                    controller.text =
                                        roundedValue.toStringAsFixed(2);
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

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({this.decimalRange = 2});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final RegExp regex = RegExp(r'^\d+\.?\d{0,$decimalRange}');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
