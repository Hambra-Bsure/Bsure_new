
import 'package:flutter_bloc/flutter_bloc.dart';

import 'will_events.dart';
import 'will_state.dart';


class WillBloc extends Bloc<WillEvent, WillState> {
  WillBloc(super.state) {
    on<ManualDistribution>(_onManualDistribution);
    on<EqualDistribute>(_onEqualDistribute);
    on<UndoAllAssetsEqualDistribute>(_onUndoAllAssetsEqualDistribute);
    on<UndoAllAssetsManualDistribution>(_onUndoAllAssetsManualDistribution);
    on<UndoEqualDistribute>(_onUndoEqualDistribute);
    on<ManualDistributionAllAssets>(_onManualDistributionAllAssets);
    on<EqualDistributeAllAssets>(_onEqualDistributeAllAssets);
    on<UndoEqualDistributeAllAssets>(_onUndoEqualDistributeAllAssets);
  }

  @override
  void onChange(Change<WillState> change) {
    // var assets = change.nextState.assets;
    // for (final asset in assets) {
    //   print("~" * 100);
    //   print(asset.assetId);
    // }
    super.onChange(change);
  }

  @override
  void onEvent(WillEvent event) {
    print(event);
    super.onEvent(event);
  }

  void _onManualDistribution(
    ManualDistribution event,
    Emitter<WillState> emit,
  ) {
    emit(
      state.copyWith(
        assets: [
          ...state.assets.map(
            (asset) {
              if (asset.assetId != event.asset.assetId) {
                return asset.copyWith();
              }
              return asset.copyWith(
                nominees: [
                  ...asset.nominees.map(
                    (nominee) => nominee.copyWith(
                      share: event.asset.nomineeShares[nominee.id] ??
                          nominee.share,
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _onEqualDistribute(
    EqualDistribute event,
    Emitter<WillState> emit,
  ) {
    emit(
      state.copyWith(
        assets: [
          ...state.assets.map(
            (asset) {
              if (asset.assetId != event.assetId) {
                return asset.copyWith();
              }
              final double equalShare = 100 / asset.nominees.length;
              var x = asset.copyWith(
                equalDistributionCheckbox: true,
                nominees: [
                  ...asset.nominees.map(
                    (nominee) => nominee.copyWith(
                      share: equalShare,
                    ),
                  )
                ],
              );
              // print(x);
              return x;
            },
          )
        ],
      ),
    );
  }

  void _onUndoEqualDistribute(
    UndoEqualDistribute event,
    Emitter<WillState> emit,
  ) {
    emit(
      state.copyWith(
        assets: [
          ...state.assets.map(
            (asset) {
              if (asset.assetId != event.assetId) {
                return asset.copyWith();
              }
              return asset.copyWith(
                equalDistributionCheckbox: false,
              );
            },
          )
        ],
      ),
    );
  }

  void _onEqualDistributeAllAssets(
    EqualDistributeAllAssets event,
    Emitter<WillState> emit,
  ) {
    final double equalShare = 100 / state.assets[0].nominees.length;
    emit(
      state.copyWith(
        sameDistributionCheckbox: true,
        assets: [
          ...state.assets.map(
            (asset) => asset.copyWith(
              equalDistributionCheckbox: true,
              nominees: [
                ...asset.nominees.map(
                  (nominee) => nominee.copyWith(
                    share: equalShare,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onUndoEqualDistributeAllAssets(
    UndoEqualDistributeAllAssets event,
    Emitter<WillState> emit,
  ) {
    emit(
      state.copyWith(
        sameDistributionCheckbox: true,
        assets: [
          ...state.assets.map(
            (asset) => asset.copyWith(
              equalDistributionCheckbox: false,
              nominees: [
                ...asset.nominees.map(
                  (nominee) => nominee.copyWith(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onManualDistributionAllAssets(
    ManualDistributionAllAssets event,
    Emitter<WillState> emit,
  ) {
    emit(
      state.copyWith(
        sameDistributionCheckbox: true,
        assets: [
          ...state.assets.map(
            (asset) => asset.copyWith(
              equalDistributionCheckbox: false,
              nominees: [
                ...asset.nominees.map(
                  (nominee) => nominee.copyWith(
                    share: event.manualState.nomineeShares[nominee.id] ??
                        nominee.share,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onUndoAllAssetsManualDistribution(
    UndoAllAssetsManualDistribution event,
    Emitter<WillState> emit,
  ) {
    emit(state.copyWith(sameDistributionCheckbox: false));
  }

  void _onUndoAllAssetsEqualDistribute(
    UndoAllAssetsEqualDistribute event,
    Emitter<WillState> emit,
  ) {
    emit(state.copyWith(sameDistributionCheckbox: false));
  }
}
