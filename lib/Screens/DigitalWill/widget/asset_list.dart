import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Homepage.dart';
import '../bloc/will_bloc.dart';
import '../bloc/will_events.dart';
import '../bloc/will_state.dart';
import 'asset_item.dart';
import 'preview_screen.dart';

class AssetList extends StatefulWidget {
  final List<Asset> assets;

  const AssetList({
    Key? key,
    required this.assets,
  }) : super(key: key);

  @override
  State<AssetList> createState() => _AssetListState();
}

class _AssetListState extends State<AssetList>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;
  final List<GlobalKey<AssetItemState>> childKeys = [];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true, initialPage: currentPage);
    childKeys.addAll(List.generate(
        widget.assets.length, (_) => GlobalKey<AssetItemState>()));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<WillBloc, WillState>(
      builder: (context, state) {
        final assets = state.assets;
        final sameDistributionCheckbox = state.sameDistributionCheckbox;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Set to false to remove the debug banner
          home: Scaffold(
            backgroundColor: const Color(0xFF00436A),
            appBar: AppBar(
              //debugShowCheckedModeBanner: false,
              backgroundColor: const Color(0xff429bb8),
              title: const Text('Digital will',
                  style: TextStyle(color: Colors.white)),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("Nominee for all your assets",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis)),
                  const SizedBox(height: 5),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: assets.length,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return AssetItem(
                          key: childKeys[index],
                          asset: assets[index],
                          pageNumber: index,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: currentPage == 0
                        ? null
                        : () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      final bool equalDistributionCheckbox = context
                          .read<WillBloc>()
                          .state
                          .assets[currentPage]
                          .equalDistributionCheckbox;

                      final sameDistributionCheckbox = context
                          .read<WillBloc>()
                          .state
                          .sameDistributionCheckbox;

                      if (childKeys[currentPage].currentState!.validateForm()) {
                        if (equalDistributionCheckbox) {
                          if (currentPage == assets.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) =>
                                      WillBloc(WillState(assets: assets)),
                                  child: const PreviewScreen(),
                                ),
                              ),
                            );
                            return;
                          } else {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        } else {
                          final childState = childKeys[currentPage]
                              .currentState!
                              .getAssetState();

                          if (sameDistributionCheckbox) {
                            context.read<WillBloc>().add(
                                  ManualDistributionAllAssets(
                                    manualState: childState,
                                  ),
                                );
                          } else {
                            context
                                .read<WillBloc>()
                                .add(ManualDistribution(asset: childState));
                          }
                          if (currentPage == assets.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) =>
                                      WillBloc(WillState(assets: assets)),
                                  child: const PreviewScreen(),
                                ),
                              ),
                            );
                            return;
                          } else {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        }
                      } else {
                        const snackbar = SnackBar(
                          backgroundColor: Colors.red,
                          content:
                              Text("Total of nominees share should be 100"),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                      return;
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              heroTag: 'checkbox2',
              onPressed: () {
                // context.read<WillBloc>().add(ManualDistributionAllAssets(nomineeStates: childKeys[currentPage].currentState ));
              },
              label: Row(
                children: <Widget>[
                  Checkbox(
                    value: sameDistributionCheckbox,
                    onChanged: (value) {
                      final bool equalDistributionCheckbox = context
                          .read<WillBloc>()
                          .state
                          .assets[currentPage]
                          .equalDistributionCheckbox;
                      if (value == true) {
                        if (equalDistributionCheckbox) {
                          context
                              .read<WillBloc>()
                              .add(EqualDistributeAllAssets());
                        } else {
                          final manualState = childKeys[currentPage]
                              .currentState!
                              .getAssetState();
                          context.read<WillBloc>().add(
                                ManualDistributionAllAssets(
                                  manualState: manualState,
                                ),
                              );
                        }
                      } else if (value == false) {
                        if (equalDistributionCheckbox) {
                          // Please confirm
                          context
                              .read<WillBloc>()
                              .add(UndoAllAssetsEqualDistribute());
                        } else {
                          context
                              .read<WillBloc>()
                              .add(UndoAllAssetsManualDistribution());
                        }
                      }
                    },
                  ),
                  const Text('Use same distribution for all assets '),
                ],
              ),
              // icon: Icon(Icons.add),
              backgroundColor: const Color(0xff429bb8),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
