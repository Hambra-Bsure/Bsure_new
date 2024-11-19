abstract class WillEvent {}

// 1
class ManualDistribution extends WillEvent {
  final AssetState asset;

  ManualDistribution({required this.asset});
}

// 2
class EqualDistribute extends WillEvent {
  final int assetId;

  EqualDistribute({required this.assetId});
}

// 3
class UndoEqualDistribute extends WillEvent {
  final int assetId;

  UndoEqualDistribute({required this.assetId});
}

// 4
class EqualDistributeAllAssets extends WillEvent {}

// 5
class UndoEqualDistributeAllAssets extends WillEvent {}

// 6
class ManualDistributionAllAssets extends WillEvent {
  final AssetState manualState;

  ManualDistributionAllAssets({required this.manualState});
}

// 7
class UndoAllAssetsManualDistribution extends WillEvent {}

// 8
class UndoAllAssetsEqualDistribute extends WillEvent {}

// 9
class UpdateSameDistributionCheckbox extends WillEvent {
  final bool value;

  UpdateSameDistributionCheckbox(this.value);
}

/* 

Events {
    
    // no checkbox is true
    manualDistribution
 
    // checkbox1 is true
    equalDistribute
 
    // checkbox1 become false
    undoEqualDistribute

    // checkbox2 is true and checkbox1 become true
    equalDistributeAllAssets
    
    // checkbox2 is true and checkbox1 become false
    undoEqualDistributeAllAssets
    
    // checkbox1 is false and checkbox1 become true
    manualDistributionAllAssets
    
    // checkbox1 is false and checkbox2 become false
    undoAllAssetsManualDistribution

    // checkbox1 is true and checkbox2 become false
    undoAllAssetsEqualDistribute
}

 */

class AssetState {
  final int assetId;
  final bool equalDistributionCheckbox;
  final Map<int, double> nomineeShares;

  AssetState({
    required this.equalDistributionCheckbox,
    required this.assetId,
    required this.nomineeShares,
  });
}
