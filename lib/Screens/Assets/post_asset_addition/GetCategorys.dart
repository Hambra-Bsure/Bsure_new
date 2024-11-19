import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/AssetModels/GetCategoryResponse.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
// Import your NodeClient class

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<GetCategoryresponse> _futureCategoryResponse;
  List<Categories> categories = [];
  bool isLoading = false;
  final NodeClient nodeClient = NodeClient(Dio()); // Initialize your NodeClient

  Future<GetCategoryresponse> fetchCategories() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    try {
      final response = await nodeClient.GetCategoryList(
          token.toString()); // Pass your token here
      return response;
    } catch (e) {
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
          color: Colors.white,
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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => AssetDetailsList(assetType: category.name.toString()),
        //   ),
        // );
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
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CategoryScreen(),
  ));
}
