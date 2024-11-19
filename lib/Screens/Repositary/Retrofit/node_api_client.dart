// ignore_for_file: non_constant_identifier_names

import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/BankAccountRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/BondRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/CryptoExchangeRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/EsopRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/GetCategoryResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/GoldRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LifeInsuranceRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LoanGivenRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/MutualFundRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/NpsRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/OtherAssetRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PfRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PostOfficeAccountRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PpfRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/RealEstateRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/StockBrokerRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/VehicleRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/Digital_will/witness_get_res.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/GetAssetResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../DigitalWill/Digitalwill_screens/utils/assets2_response_model.dart';
import '../../DigitalWill/widget/will_save_request.dart';
import '../Models/AssetModels/GetBankResponse.dart';
import '../Models/AssetModels/NonLifeInsuranceRequest.dart';
import '../Models/AssetModels/PostAssetResponse.dart';
import '../Models/Digital_will/Confirmation_otp_res.dart';
import '../Models/Digital_will/digitalwill_get_res.dart';
import '../Models/Digital_will/Digitalwill_save_res.dart';
import '../Models/Digital_will/Digitalwill_verifyotp_req.dart';
import '../Models/Digital_will/Digitalwill_verifyotp_res.dart';
import '../Models/Digital_will/Digitalwill_video_req.dart';
import '../Models/Digital_will/Digitalwill_video_res.dart';
import '../Models/LoginRequest.dart';
import '../Models/LoginResponse.dart';
import '../Models/Nudge/Coupon/Coupon_response.dart';
import '../Models/Nudge/Coupon/Nudge_coupon_request.dart';
import '../Models/Nudge/Get_plan_res.dart';
import '../Models/OtpVerifyRequest.dart';
import '../Models/OtpVerifyResponse.dart';
import '../Models/Share_assets/Delete_share_res.dart';
import '../Models/Share_assets/my_share_asset_res.dart';
import '../Models/Share_assets/Share_asset_req.dart';
import '../Models/Share_assets/Share_asset_res.dart';
import '../Models/User_models/Account_delete_res.dart';
part 'node_api_client.g.dart';

//@RestApi(baseUrl: 'http://13.234.213.250:8080')
//@RestApi(baseUrl: 'https://wgflssl8-8080.inc1.devtunnels.ms')
//http://43.205.12.154:8080
@RestApi(baseUrl: 'https://dev.bsure.live')
abstract class NodeClient {
  factory NodeClient(Dio dio) = _NodeClient;

  //authentication

  @POST("/v2/auth/login")
  Future<LoginResponse2> login(@Body() LoginRequest2 Request);

  @POST("/v2/auth/verify")
  Future<VerifyResponse> verifyotp(@Body() VerifyRequest req);

  //user account deletion
  //
  @DELETE("/v2/users")
  Future<userAccountDeleteResponse> deleteAccount(
      @Header('Authorization') String token);

  //get all Categorys

  @GET("/v2/asset/categories")
  Future<GetCategoryresponse> GetCategoryList(
      @Header('Authorization') String token);

//get all Assets

  @GET("/v2/asset")
  Future<GetAssetResponse> getAssetList(
    @Header('Authorization') String token,
    @Query('assetType') String assetType,
  );

  @GET("/v2/asset/category/{assetType}")
  Future<GetBankResponse> getAssetsByCategory(
    @Header('Authorization') String token,
    @Path('assetType') String assetType,
  );

  //Categories

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateBankAccount(
      @Header('Authorization') String token, @Body() BankAccountRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateMutualFund(
      @Header('Authorization') String token, @Body() MutualFundRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateStockBroker(
      @Header('Authorization') String token, @Body() StockBrokerRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateLifeInsurance(
      @Header('Authorization') String token, @Body() LifeInsuranceRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateNonLifeInsurance(
      @Header('Authorization') String token,
      @Body() NonLifeInsuranceRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreatePostOfficeAccount(
      @Header('Authorization') String token,
      @Body() PostOfficeAccountRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateCryptoExchange(
      @Header('Authorization') String token, @Body() CryptoExchangeRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateNps(
      @Header('Authorization') String token, @Body() NpsRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreatePpf(
      @Header('Authorization') String token, @Body() PpfRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreatePf(
      @Header('Authorization') String token, @Body() PfRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateRealEstate(
      @Header('Authorization') String token, @Body() RealEstateRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateOtherAsset(
      @Header('Authorization') String token, @Body() OtherAssetRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateLoanGiven(
      @Header('Authorization') String token, @Body() LoanGivenRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateVehicle(
      @Header('Authorization') String token, @Body() VehicleRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateGold(
      @Header('Authorization') String token, @Body() GoldRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateBond(
      @Header('Authorization') String token, @Body() BondRequest req);

  @POST("/v2/asset")
  Future<PostAssetResponse> CreateEsop(
      @Header('Authorization') String token, @Body() EsopRequest req);

  //Nudge

  @POST("/payment/nudge-plans")
  Future<PlanDetailsResponseBean> getPlanDetails();

  @POST("/account/user/redeemCode")
  Future<UserdiscountResponsebean> userdiscount(
      @Body() UserDiscountRequest request);

  //Digitalwil

  // @GET("/v2/asset")
  // Future<GetAllCategoryResponse> getAllCategoryAssets(
  //     @Header('Authorization') String token);

  @GET("/asset/category/all2")
  Future<AssetsResponse2> getAllCategoryAssets2(
      @Header('Authorization') String token);

  // @GET("/v2/asset/all")
  // Future<Response> fetchGetAllAssets(
  //     @Header('Authorization') String token);

  @POST("/v2/will/assets")
  Future<Digitalwillsaveresponse> digitalWillSave({
    @Header('Authorization') String? token,
    @Body() List<AssetReq>? request,
  });

  @GET("/v2/will/assets")
  Future<DigitalwillgetResponse> digitalWillGetData(
      @Header('Authorization') String token);

  @GET("/v2/will/witness")
  Future<WitnessgetResponse> getWitnessData(
      @Header('Authorization') String token);

  @POST("/v2/will/confirmation")
  Future<confirmationotpresponse> confirmOtp(
      @Header('Authorization') String token);

  @POST("/v2/will/verify")
  Future<digitalwillverifyotpresponse> digitalwillVerifyOtp(
      @Header('Authorization') String token,
      @Body() digitalverifyotprequest req);

  @POST("/v2/will/video")
  Future<Digitalwill_video_request> digitalwillVideo(
      @Header('Authorization') String token,
      @Body() Digitalwillvideo_response req);

  //share assets

  @POST("/shareAsset/share")
  Future<ShareAssetResponse> ShareAssets(@Header('Authorization') String token,
      @Body() ShareAssetRequest shareAssetRequest);

  @GET("/shareAsset/share-by-me")
  Future<MyShareAssetsResponse> getSharedAssets(
      @Header('Authorization') String token);

  // @GET("/shareAsset/share-with-me")
  // Future<ShareAssetswithmeResponse> getSharedAssetswithme(
  //     @Header('Authorization') String token);

  @DELETE("/v2/share/{id}") // Assuming 'id' is a path parameter
  Future<Deleteshareresponse> deleteShareAsset(
      @Header('Authorization') String token,
      @Path('id') int id // Specify the type of 'id'
      );
}
