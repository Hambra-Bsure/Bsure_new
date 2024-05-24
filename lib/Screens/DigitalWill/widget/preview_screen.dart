import 'package:accordion/accordion.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../Digitalwill_screens/video/Digitalwill_verify_otp.dart';
import '../Digitalwill_screens/video/camera_page.dart';
import '../bloc/will_bloc.dart';
import '../bloc/will_state.dart';
import 'will_save_request.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text("Preview", style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<WillBloc, WillState>(
        builder: (context, state) {
          var assets = state.assets;
          return Accordion(
            maxOpenSections: 1,
            children: List.generate(assets.length, (index) {
              var asset = assets[index];
              var nominees = asset.nominees;
              var details = asset.details;

              String assetIdentity = details.isNotEmpty
                  ? details.map((detail) => '${detail.fieldName}: ${detail.fieldValue}').join('\n')
                  : 'No details available';

              return AccordionSection(
                isOpen: false,
                header: Container(
                  color: const Color(0xff429bb8),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    formatDetails(asset),
                    style:
                    const TextStyle(color: Colors.black, fontSize: 16),
                    // Ensure text color is set to white for better visibility
                    textAlign: TextAlign.left, // Align text to the left
                  ),
                ),
                content: Column(
                  children: [
                    Text(
                      asset.assetId.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      assetIdentity,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: nominees
                          .where((nominee) => nominee.share > 0)
                          .map(
                            (nominee) => Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${nominee.name}:',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              nominee.share.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          SubmitData(context);
        },
        label: const Text("Submit"),
        icon: const Icon(Icons.check),
        backgroundColor: const Color(0xFF00436A),
        foregroundColor: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
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
      return 'uan Number: $uanNumber';
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


  Future<void> SubmitData(BuildContext context) async {
    final dio = Dio();
    final client = NodeClient(dio);
    final sf = await SharedPreferences.getInstance();
    final token = sf.getString("token");

    if (token == null) {
      // Handle the case where the token is null
      return;
    }

    final bloc = BlocProvider.of<WillBloc>(context);
    final willState = bloc.state;

    final List<Asset> assets = willState.assets;

    final List<AssetReq> assetReqs = assets.map((asset) {
      return AssetReq(
        assetId: asset.assetId,
        nominees: asset.nominees.map((nominee) {
          return NomineeReq(
            nomineeId: nominee.id,
            share: nominee.share.toDouble(),
          );
        }).toList(),
      );
    }).toList();

    final response = await client.digitalWillSave(
      token: token,
      request: assetReqs,
    );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Choose an option",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NomineeForAllAssets(),
                        ),
                      );
                    },
                    child: const Text("Verify Otp"),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraApp(),
                        ),
                      );
                    },
                    child: const Text("Verify video"),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}
