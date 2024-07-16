
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/Digital_will/digitalwill_get_res.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../Digitalwill_mainscreen.dart';

class DigitalWillScreen extends StatefulWidget {
  const DigitalWillScreen({Key? key}) : super(key: key);

  @override
  _DigitalWillScreenState createState() => _DigitalWillScreenState();
}

class _DigitalWillScreenState extends State<DigitalWillScreen> {
  late Future<DigitalwillgetResponse> _futureData;

  //Map<int, bool> _isEditing = {}; // Track which nominees are being edited

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<DigitalwillgetResponse> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      throw Exception('Token is not available.');
    }

    Dio dio = Dio();
    dio.options.headers["Authorization"] = 'Bearer $token'; // Ensure Bearer token format

    NodeClient nodeClient = NodeClient(dio);

    try {
      var response = await nodeClient.digitalWillGetData(token);

      print("Response received:");
      print(response);

      // Ensure response data is parsed correctly
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 403) {
          // Handle 403 error
          print("Error: User does not have permission.");
          throw Exception('User does not have permission.');
        } else if (e.response?.statusCode == 404) {
          // Handle 404 error
          print("Error: Assets not found.");
          throw Exception('Assets not found.');
        } else {
          // Handle other errors
          print(
              "Error: Failed to fetch data. Status code: ${e.response?.statusCode}");
          throw Exception('Failed to fetch data. Please try again.');
        }
      } else {
        // Handle other exceptions
        print("Error: An unexpected error occurred: $e");
        throw Exception('An unexpected error occurred. Please try again.');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Digital will screen',
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: FutureBuilder<DigitalwillgetResponse>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              var assetsByAssetId = groupAssetsByAssetId(snapshot.data!.assets);

              return ListView(
                children: assetsByAssetId.entries.map((entry) {
                  var assetId = entry.key;
                  var assets = entry.value;
                  return Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: assets.map((asset) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      formatDetails(asset),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                ...asset.nominees.map((nominee) {
                                  TextEditingController controller =
                                      TextEditingController(
                                    text: nominee.share.toString(),
                                  );
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0, vertical: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          nominee.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: TextFormField(
                                                controller: controller,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Share',
                                                  border: OutlineInputBorder(),
                                                ),
                                                enabled: false,
                                                onChanged: (value) {
                                                  setState(() {
                                                    int index = asset.nominees
                                                        .indexOf(nominee);
                                                    asset.nominees[index] =
                                                        nominee.copyWith(
                                                      share: double.tryParse(
                                                              value) ??
                                                          nominee.share,
                                                    );
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            } else {
              return const Text('No data found.');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppWidget(),
            ),
          );
        },
        label: const Text(
          'Add New',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16, // Adjust the font size as per your preference
          ),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff429bb8),
        elevation: 4.0, // Optional, sets the elevation of the button
      ),
    );
  }

  void saveNomineeShares(List<Nominee> nominees) {
    // Implement save functionality
    // This is where you would send updated nominee data to the backend
    print("Saving nominee shares:");
    for (var nominee in nominees) {
      print("${nominee.name} - ${nominee.share}");
    }
  }

  Map<String, List<Asset>> groupAssetsByAssetId(List<Asset> assets) {
    Map<String, List<Asset>> assetsByAssetId = {};

    for (var asset in assets) {
      var assetId = asset.assetId?.toString() ??
          "Unknown"; // Convert assetId to String and use a default value if assetId is null
      if (!assetsByAssetId.containsKey(assetId)) {
        assetsByAssetId[assetId] = [];
      }
      assetsByAssetId[assetId]!.add(asset);
    }

    return assetsByAssetId;
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
}
