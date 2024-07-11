import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/Nudge/Get_plan_res.dart';
import '../Repositary/Retrofit/node_api_client.dart';
import '../Utils/DisplayUtils.dart';
import 'Nudge_payment.dart';

class NudgeScreen extends StatefulWidget {
  const NudgeScreen({Key? key}) : super(key: key);

  @override
  State<NudgeScreen> createState() => _NudgeScreenState();
}

class _NudgeScreenState extends State<NudgeScreen> {
  late ScrollController _scrollController;

  bool isLoaded = false;
  String selectedValue = '';
  late List<Plans>? plans;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    fetchPlanDetails();
  }

  Future<void> fetchPlanDetails() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token") ?? "";

      Dio dio = Dio();
      dio.options.headers = {'Authorization': token};

      final client = NodeClient(dio);
      final response = await client.getPlanDetails();

      processResponse(response);
    } catch (e) {
      print("Error fetching plan details: $e");
      DisplayUtils.showToast("Error fetching plan details");
    }
  }

  void processResponse(PlanDetailsResponseBean response) {
    if (response.plans != null && response.plans!.isNotEmpty) {
      setState(() {
        plans = response.plans;
        isLoaded = true;
      });
    } else if (response.plans != null) {
      DisplayUtils.showToast(response.plans.toString());
    } else {
      DisplayUtils.showToast("No plans available");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text("Nudge", style: TextStyle(color: Colors.white)),
      ),
      body: isLoaded
          ? SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: [
                    const Text(
                      "Nudge",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff429bb8),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Lottie.asset(
                        'assets/animations/nudge_anim.json',
                        repeat: true,
                        fit: BoxFit.fitWidth,
                        errorBuilder: (_, __, ___) => const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "What is Nudge?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Bsure tracks the status of the user on time to time.\n",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "2. Notifies the family members when no input received from the user.\n",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "3. In case of any untoward incident, shares the asset information with nominees.\n",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: plans!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (plans![index].label != "Monthly Plan") {
                    return buildPlanTile(plans![index]);
                  } else {
                    return const SizedBox(); // Handle if needed
                  }
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "*Coupons If any can be applied next page",
                style: TextStyle(
                  color: Color(0xff429bb8),
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: selectedValue.isNotEmpty
                    ? () {
                  Plans selectedPlan = plans!.firstWhere(
                        (plan) => plan.id.toString() == selectedValue,
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlanSelectedDetails(
                        selectedValue: selectedValue,
                        selectedPlan: selectedPlan,
                      ),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xff429bb8),
                  minimumSize: const Size(double.infinity, 50),
                  elevation: 4,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      )
          : const Center(
        child: Text("This screen is work in progress please wait for sometime", style: TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget buildPlanTile(Plans plan) {
    String title = plan.label ?? "Plan ${plan.id}";
    int priceInPaisa = plan.price ?? 0;
    double priceInRupees = priceInPaisa / 100.0;

    String priceWithText = title == "Annual Plan"
        ? "$priceInRupees per year"
        : title == "Lifetime Plan"
        ? "$priceInRupees for lifetime coverage"
        : "$priceInRupees";

    return ListTile(
      leading: Radio(
        value: plan.id.toString(),
        groupValue: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value.toString();
          });
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        priceWithText,
        style: const TextStyle(
          fontSize: 16,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      tileColor: selectedValue == plan.id.toString()
          ? const Color(0xff429bb8)
          : Colors.transparent,
      onTap: () {
        setState(() {
          selectedValue = plan.id.toString();
        });
      },
    );
  }
}
