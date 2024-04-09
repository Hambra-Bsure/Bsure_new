import 'package:Bsure_devapp/Screens/Assets/Bond.dart';
import 'package:Bsure_devapp/Screens/Assets/CryptoExchange.dart';
import 'package:Bsure_devapp/Screens/Assets/Esop.dart';
import 'package:Bsure_devapp/Screens/Assets/Gold.dart';
import 'package:Bsure_devapp/Screens/Assets/LifeInsurance.dart';
import 'package:Bsure_devapp/Screens/Assets/LoanGiven.dart';
import 'package:Bsure_devapp/Screens/Assets/Nps.dart';
import 'package:Bsure_devapp/Screens/Assets/OtherAssets.dart';
import 'package:Bsure_devapp/Screens/Assets/PF.dart';
import 'package:Bsure_devapp/Screens/Assets/PPF.dart';
import 'package:Bsure_devapp/Screens/Assets/Realestate.dart';
import 'package:Bsure_devapp/Screens/Assets/StockBrokers.dart';
import 'package:Bsure_devapp/Screens/Assets/VehicleScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Repositary/Models/AssetModels/GetCategoryResponse.dart';
import '../Repositary/Retrofit/node_api_client.dart';
import 'BankAccount.dart';
import 'GetAssets.dart';
import 'MutualFund.dart';
import 'Non-LifeInsurance.dart';
import 'PostOfficeAccount.dart'; // Import your NodeClient class

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<GetCategoryresponse> _futureCategoryResponse;
  List<Categories> categories = [];
  bool isLoading = false;
  final NodeClient nodeClient = NodeClient(Dio()); // Initialize your NodeClient

  Future<GetCategoryresponse> fetchCategories() async {
    try {
      final response = await nodeClient.GetCategoryList(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzMjg1NjQ2ODMiLCJpYXQiOjE3MTI2NjIzNDIsImV4cCI6MTcxMzI2NzE0Mn0.0bfk9q8VBwAbWglJYf9aJpG0mqYNjgiEG1M8hGDzaiw"); // Pass your token here
      return response;
    } catch (e) {
      print('Error fetching categories: $e');
      throw Exception('Failed to fetch categories');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureCategoryResponse = fetchCategories();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xff429bb8),
        automaticallyImplyLeading: false,
        title: const Text(
          "Assets",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<GetCategoryresponse>(
        future: _futureCategoryResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return _buildAssetGrid(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildAssetGrid(GetCategoryresponse categoryResponse) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: categoryResponse.categories!.length,
            itemBuilder: (context, index) {
              return _buildAssetCard(categoryResponse.categories![index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAssetCard(Categories category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssetDetailsList(assetType: category.name.toString()),
          ),
        );
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white, // Set background color to pure white
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: category.image != null
                      ? NetworkImage(category.image!)
                      : null, // Set to null if no image provided
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${category.name}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CategoryScreen(),
  ));
}
