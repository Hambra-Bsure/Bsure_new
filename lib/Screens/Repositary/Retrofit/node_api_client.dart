// ignore_for_file: non_constant_identifier_names

import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/BankAccountRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/BankAccountResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/BondRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/CryptoExchangeRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/CryptoExchangeResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/EsopRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/EsopResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/GetCategoryResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/GoldRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/GoldResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LifeInsuranceRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LifeInsuranceResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LoanGivenRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/LoanGivenResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/MutualFundRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/MutualFundResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/NpsRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/NpsResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/OtherAssetRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/OtherAssetResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PfRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PfResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PostOfficeAccountRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PostOfficeAccountResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PpfRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/PpfResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/RealEstateRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/RealEstateResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/StockBrokerRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/StockBrokerResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/VehicleRequest.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/VehicleResponse.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/GetAssetResponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../DigitalWill/Digitalwill_screens/utils/assets2_response_model.dart';
import '../../DigitalWill/widget/will_save_request.dart';
import '../Models/AssetModels/BondResponse.dart';
import '../Models/AssetModels/NonLifeInsuranceRequest.dart';
import '../Models/AssetModels/NonLifeInsuranceResponse.dart';
import '../Models/AssetModels/GetbankResponse.dart';
import '../Models/Digital_will/Confirmation_otp_res.dart';
import '../Models/Digital_will/digitalwill_get_res.dart';
import '../Models/Digital_will/Digitalwill_save_res.dart';
import '../Models/Digital_will/Digitalwill_verifyotp_req.dart';
import '../Models/Digital_will/Digitalwill_verifyotp_res.dart';
import '../Models/Digital_will/Digitalwill_video_req.dart';
import '../Models/Digital_will/Digitalwill_video_res.dart';
import '../Models/LoginRequest.dart';
import '../Models/LoginResponse.dart';
import '../Models/OtpVerifyRequest.dart';
import '../Models/OtpVerifyResponse.dart';
import '../Models/Share_assets/Delete_share_res.dart';
import '../Models/Share_assets/my_share_asset_res.dart';
import '../Models/Share_assets/Share_asset_req.dart';
import '../Models/Share_assets/Share_asset_res.dart';
part 'node_api_client.g.dart';

//@RestApi(baseUrl: 'https://api.bsure.live')
//@RestApi(baseUrl: 'https://wgflssl8-8080.inc1.devtunnels.ms')
@RestApi(baseUrl: 'http://43.205.12.154:8080')
abstract class NodeClient {
  factory NodeClient(Dio dio) = _NodeClient;

  //authentication

  @POST("/v2/auth/login")
  Future<LoginResponse2> login(@Body() LoginRequest2 Request);

  @POST("/v2/auth/verify")
  Future<VerifyResponse> verifyotp(@Body() VerifyRequest req);

  // @POST("/login2")
  // Future<LoginResponse2> login2(@Body() LoginRequest2 Request);

  // @POST("/verify")
  // Future<VerifyResponse> verify(@Body() VerifyRequest req);

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
  Future<BankAccountResponse> CreateBankAccount(
      @Header('Authorization') String token, @Body() BankAccountRequest req);

  @POST("/v2/asset")
  Future<MutualFundResponse> CreateMutualFund(
      @Header('Authorization') String token, @Body() MutualFundRequest req);

  @POST("/v2/asset")
  Future<StockBrokerResponse> CreateStockBroker(
      @Header('Authorization') String token, @Body() StockBrokerRequest req);

  @POST("/v2/asset")
  Future<LifeInsuranceResponse> CreateLifeInsurance(
      @Header('Authorization') String token, @Body() LifeInsuranceRequest req);

  @POST("/v2/asset")
  Future<NonLifeInsuranceResponse> CreateNonLifeInsurance(
      @Header('Authorization') String token,
      @Body() NonLifeInsuranceRequest req);

  @POST("/v2/asset")
  Future<PostOfficeAccountResponse> CreatePostOfficeAccount(
      @Header('Authorization') String token,
      @Body() PostOfficeAccountRequest req);

  @POST("/v2/asset")
  Future<CryptoExchangeResponse> CreateCryptoExchange(
      @Header('Authorization') String token, @Body() CryptoExchangeRequest req);

  @POST("/v2/asset")
  Future<NpsResponse> CreateNps(
      @Header('Authorization') String token, @Body() NpsRequest req);

  @POST("/v2/asset")
  Future<PpfResponse> CreatePpf(
      @Header('Authorization') String token, @Body() PpfRequest req);

  @POST("/v2/asset")
  Future<PfResponse> CreatePf(
      @Header('Authorization') String token, @Body() PfRequest req);

  @POST("/v2/asset")
  Future<RealEstateResponse> CreateRealEstate(
      @Header('Authorization') String token, @Body() RealEstateRequest req);

  @POST("/v2/asset")
  Future<OtherAssetResponse> CreateOtherAsset(
      @Header('Authorization') String token, @Body() OtherAssetRequest req);

  @POST("/v2/asset")
  Future<LoanGivenResponse> CreateLoanGiven(
      @Header('Authorization') String token, @Body() LoanGivenRequest req);

  @POST("/v2/asset")
  Future<VehicleResponse> CreateVehicle(
      @Header('Authorization') String token, @Body() VehicleRequest req);

  @POST("/v2/asset")
  Future<GoldResponse> CreateGold(
      @Header('Authorization') String token, @Body() GoldRequest req);

  @POST("/v2/asset")
  Future<BondResponse> CreateBond(
      @Header('Authorization') String token, @Body() BondRequest req);

  @POST("/v2/asset")
  Future<EsopResponse> CreateEsop(
      @Header('Authorization') String token, @Body() EsopRequest req);

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
