class GetAllCategoryResponse {
  late Assets assets;
  late bool success;
  late String message;

  GetAllCategoryResponse({
    required this.assets,
    required this.success,
    required this.message,
  });

  GetAllCategoryResponse.fromJson(Map<String, dynamic> json) {
    assets = Assets.fromJson(json['assets']);
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assets'] = assets.toJson();
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Assets {
  late List<BankAccount> bankAccount;
  late List<MutualFund> mutualFund;
  late List<StockBroker> stockBroker;
  late List<LifeInsurance> lifeInsurance;
  late List<PostOfficeAccount> postOfficeAccount;
  late List<NonLifeInsurance> nonLifeInsurance;
  late List<CryptoExchange> cryptoExchange;
  late List<Nps> nps;
  late List<Pf> pf;
  late List<Ppf> ppf;
  late List<RealEstate> realEstate;
  late List<OtherAssets> otherAssets;
  late List<LoanGiven> loanGiven;
  late List<Vehicle> vehicle;
  late List<Gold> gold;

  Assets({
    required this.bankAccount,
    required this.mutualFund,
    required this.stockBroker,
    required this.lifeInsurance,
    required this.postOfficeAccount,
    required this.nonLifeInsurance,
    required this.cryptoExchange,
    required this.nps,
    required this.pf,
    required this.ppf,
    required this.realEstate,
    required this.otherAssets,
    required this.loanGiven,
    required this.vehicle,
    required this.gold,
  });

  Assets.fromJson(Map<String, dynamic> json) {
    bankAccount = <BankAccount>[];
    json['bankAccount'].forEach((v) {
      bankAccount.add(BankAccount.fromJson(v));
    });

    mutualFund = <MutualFund>[];
    json['mutualFund'].forEach((v) {
      mutualFund.add(MutualFund.fromJson(v));
    });

    stockBroker = <StockBroker>[];
    json['stockBroker'].forEach((v) {
      stockBroker.add(StockBroker.fromJson(v));
    });

    lifeInsurance = <LifeInsurance>[];
    json['lifeInsurance'].forEach((v) {
      lifeInsurance.add(LifeInsurance.fromJson(v));
    });
    postOfficeAccount = <PostOfficeAccount>[];
    json['postOfficeAccount'].forEach((v) {
      postOfficeAccount.add(PostOfficeAccount.fromJson(v));
    });
    nonLifeInsurance = <NonLifeInsurance>[];
    json['nonLifeInsurance'].forEach((v) {
      nonLifeInsurance.add(NonLifeInsurance.fromJson(v));
    });
    cryptoExchange = <CryptoExchange>[];
    json['cryptoExchange'].forEach((v) {
      cryptoExchange.add(CryptoExchange.fromJson(v));
    });
    nps = <Nps>[];
    json['nps'].forEach((v) {
      nps.add(Nps.fromJson(v));
    });
    pf = <Pf>[];
    json['pf'].forEach((v) {
      pf.add(Pf.fromJson(v));
    });
    ppf = <Ppf>[];
    json['ppf'].forEach((v) {
      ppf.add(Ppf.fromJson(v));
    });
    realEstate = <RealEstate>[];
    json['realEstate'].forEach((v) {
      realEstate.add(RealEstate.fromJson(v));
    });
    otherAssets = <OtherAssets>[];
    json['otherAssets'].forEach((v) {
      otherAssets.add(OtherAssets.fromJson(v));
    });
    loanGiven = <LoanGiven>[];
    json['loanGiven'].forEach((v) {
      loanGiven.add(LoanGiven.fromJson(v));
    });
    vehicle = <Vehicle>[];
    json['vehicle'].forEach((v) {
      vehicle.add(Vehicle.fromJson(v));
    });
    gold = <Gold>[];
    json['gold'].forEach((v) {
      gold.add(Gold.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankAccount'] = bankAccount.map((v) => v.toJson()).toList();
    data['mutualFund'] = mutualFund.map((v) => v.toJson()).toList();
    data['stockBroker'] = stockBroker.map((v) => v.toJson()).toList();
    data['lifeInsurance'] = lifeInsurance.map((v) => v.toJson()).toList();
    data['postOfficeAccount'] =
        postOfficeAccount.map((v) => v.toJson()).toList();
    data['nonLifeInsurance'] = nonLifeInsurance.map((v) => v.toJson()).toList();
    data['cryptoExchange'] = cryptoExchange.map((v) => v.toJson()).toList();
    data['nps'] = nps.map((v) => v.toJson()).toList();
    data['pf'] = pf.map((v) => v.toJson()).toList();
    data['ppf'] = ppf.map((v) => v.toJson()).toList();
    data['realEstate'] = realEstate.map((v) => v.toJson()).toList();
    data['otherAssets'] = otherAssets.map((v) => v.toJson()).toList();
    data['loanGiven'] = loanGiven.map((v) => v.toJson()).toList();
    data['vehicle'] = vehicle.map((v) => v.toJson()).toList();
    data['gold'] = gold.map((v) => v.toJson()).toList();
    return data;
  }
}

class BankAccount {
  int? id;
  String? bankName;
  String? accountNumber;
  String? ifscCode;
  String? branchName;
  String? accountType;
  String? comments;
  String? attachment;
  int? assetId;

  BankAccount({
    this.id,
    this.bankName,
    this.accountNumber,
    this.ifscCode,
    this.branchName,
    this.accountType,
    this.comments,
    this.attachment,
    this.assetId,
  });

  BankAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bankName'];
    accountNumber = json['accountNumber'];
    ifscCode = json['ifscCode'];
    branchName = json['branchName'];
    accountType = json['accountType'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bankName'] = bankName;
    data['accountNumber'] = accountNumber;
    data['ifscCode'] = ifscCode;
    data['branchName'] = branchName;
    data['accountType'] = accountType;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class MutualFund {
  int? id;
  String? amcName;
  String? schemeName;
  String? folioNumber;
  String? fundType;
  String? comments;
  String? attachment;
  int? assetId;

  MutualFund({
    this.id,
    this.amcName,
    this.schemeName,
    this.folioNumber,
    this.fundType,
    this.comments,
    this.attachment,
    this.assetId,
  });

  MutualFund.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amcName = json['amcName'];
    schemeName = json['schemeName'];
    folioNumber = json['folioNumber'];
    fundType = json['fundType'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amcName'] = amcName;
    data['schemeName'] = schemeName;
    data['folioNumber'] = folioNumber;
    data['fundType'] = fundType;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class StockBroker {
  int? id;
  String? brokerName;
  String? dematAccountNumber;
  String? comments;
  String? attachment;
  int? assetId;

  StockBroker(
      {this.id,
        this.brokerName,
        this.dematAccountNumber,
        this.comments,
        this.attachment,
        this.assetId});

  StockBroker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brokerName = json['brokerName'];
    dematAccountNumber = json['dematAccountNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brokerName'] = brokerName;
    data['dematAccountNumber'] = dematAccountNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class LifeInsurance {
  int? id;
  String? insuranceCompanyName;
  String? policyName;
  String? policyNumber;
  String? coverageAmount;
  String? maturityDate;
  String? comments;
  String? attachment;
  int? assetId;

  LifeInsurance(
      {this.id,
        this.insuranceCompanyName,
        this.policyName,
        this.policyNumber,
        this.coverageAmount,
        this.maturityDate,
        this.comments,
        this.attachment,
        this.assetId});

  LifeInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insuranceCompanyName = json['insuranceCompanyName'];
    policyName = json['policyName'];
    policyNumber = json['policyNumber'];
    coverageAmount = json['coverageAmount'];
    maturityDate = json['maturityDate'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['insuranceCompanyName'] = insuranceCompanyName;
    data['policyName'] = policyName;
    data['policyNumber'] = policyNumber;
    data['coverageAmount'] = coverageAmount;
    data['maturityDate'] = maturityDate;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class PostOfficeAccount {
  int? id;
  String? branchName;
  String? accountNumber;
  String? accountType;
  String? comments;
  String? attachment;
  int? assetId;

  PostOfficeAccount(
      {this.id,
        this.branchName,
        this.accountNumber,
        this.accountType,
        this.comments,
        this.attachment,
        this.assetId});

  PostOfficeAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branchName'];
    accountNumber = json['accountNumber'];
    accountType = json['accountType'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['branchName'] = branchName;
    data['accountNumber'] = accountNumber;
    data['accountType'] = accountType;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class NonLifeInsurance {
  int? id;
  String? insuranceCompanyName;
  String? typeOfInsurance;
  String? policyName;
  String? policyNumber;
  String? comments;
  String? attachment;
  int? assetId;

  NonLifeInsurance(
      {this.id,
        this.insuranceCompanyName,
        this.typeOfInsurance,
        this.policyName,
        this.policyNumber,
        this.comments,
        this.attachment,
        this.assetId});

  NonLifeInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insuranceCompanyName = json['insuranceCompanyName'];
    typeOfInsurance = json['typeOfInsurance'];
    policyName = json['policyName'];
    policyNumber = json['policyNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['insuranceCompanyName'] = insuranceCompanyName;
    data['typeOfInsurance'] = typeOfInsurance;
    data['policyName'] = policyName;
    data['policyNumber'] = policyNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class CryptoExchange {
  int? id;
  String? exchangeName;
  String? accountNumber;
  String? walletAddress;
  String? comments;
  String? attachment;
  int? assetId;

  CryptoExchange(
      {this.id,
        this.exchangeName,
        this.accountNumber,
        this.walletAddress,
        this.comments,
        this.attachment,
        this.assetId});

  CryptoExchange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exchangeName = json['exchangeName'];
    accountNumber = json['accountNumber'];
    walletAddress = json['walletAddress'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exchangeName'] = exchangeName;
    data['accountNumber'] = accountNumber;
    data['walletAddress'] = walletAddress;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class Nps {
  int? id;
  String? pranNumber;
  String? comments;
  String? attachment;
  int? assetId;

  Nps({this.id, this.pranNumber, this.comments, this.attachment, this.assetId});

  Nps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pranNumber = json['pranNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pranNumber'] = pranNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class Pf {
  int? id;
  String? uanNumber;
  String? comments;
  String? attachment;
  int? assetId;

  Pf({this.id, this.uanNumber, this.comments, this.attachment, this.assetId});

  Pf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uanNumber = json['uanNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uanNumber'] = uanNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class Ppf {
  int? id;
  String? ppfAccountNumber;
  String? institutionName;
  String? comments;
  String? attachment;
  int? assetId;

  Ppf(
      {this.id,
        this.ppfAccountNumber,
        this.institutionName,
        this.comments,
        this.attachment,
        this.assetId});

  Ppf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ppfAccountNumber = json['ppfAccountNumber'];
    institutionName = json['institutionName'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ppfAccountNumber'] = ppfAccountNumber;
    data['institutionName'] = institutionName;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class RealEstate {
  int? id;
  String? typeOfProperty;
  String? address;
  String? khataNumber;
  String? northOfProperty;
  String? southOfProperty;
  String? eastOfProperty;
  String? westOfProperty;
  String? image;
  String? comments;
  String? attachment;
  int? assetId;

  RealEstate(
      {this.id,
        this.typeOfProperty,
        this.address,
        this.khataNumber,
        this.northOfProperty,
        this.southOfProperty,
        this.eastOfProperty,
        this.westOfProperty,
        this.image,
        this.comments,
        this.attachment,
        this.assetId});

  RealEstate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeOfProperty = json['typeOfProperty'];
    address = json['address'];
    khataNumber = json['khataNumber'];
    northOfProperty = json['northOfProperty'];
    southOfProperty = json['southOfProperty'];
    eastOfProperty = json['eastOfProperty'];
    westOfProperty = json['westOfProperty'];
    image = json['image'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['typeOfProperty'] = typeOfProperty;
    data['address'] = address;
    data['khataNumber'] = khataNumber;
    data['northOfProperty'] = northOfProperty;
    data['southOfProperty'] = southOfProperty;
    data['eastOfProperty'] = eastOfProperty;
    data['westOfProperty'] = westOfProperty;
    data['image'] = image;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class OtherAssets {
  int? id;
  String? assetName;
  String? comments;
  String? attachment;
  int? assetId;

  OtherAssets(
      {this.id, this.assetName, this.comments, this.attachment, this.assetId});

  OtherAssets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetName = json['assetName'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['assetName'] = assetName;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class LoanGiven {
  int? id;
  String? borrowerName;
  int? loanAmount;
  String? loanGivenDate;
  String? interestRate;
  String? comments;
  String? attachment;
  int? assetId;

  LoanGiven(
      {this.id,
        this.borrowerName,
        this.loanAmount,
        this.loanGivenDate,
        this.interestRate,
        this.comments,
        this.attachment,
        this.assetId});

  LoanGiven.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    borrowerName = json['borrowerName'];
    loanAmount = json['loanAmount'];
    loanGivenDate = json['loanGivenDate'];
    interestRate = json['interestRate'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['borrowerName'] = borrowerName;
    data['loanAmount'] = loanAmount;
    data['loanGivenDate'] = loanGivenDate;
    data['interestRate'] = interestRate;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class Vehicle {
  int? id;
  String? vehicleType;
  String? brandName;
  String? modelName;
  String? registrationNumber;
  String? chassisNumber;
  String? comments;
  String? attachment;
  int? assetId;

  Vehicle(
      {this.id,
        this.vehicleType,
        this.brandName,
        this.modelName,
        this.registrationNumber,
        this.chassisNumber,
        this.comments,
        this.attachment,
        this.assetId});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleType = json['vehicleType'];
    brandName = json['brandName'];
    modelName = json['modelName'];
    registrationNumber = json['registrationNumber'];
    chassisNumber = json['chassisNumber'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicleType'] = vehicleType;
    data['brandName'] = brandName;
    data['modelName'] = modelName;
    data['registrationNumber'] = registrationNumber;
    data['chassisNumber'] = chassisNumber;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

class Gold extends Asset {
  late int id;
  String? metalType;
  String? type;
  int? weightInGrams;
  String? whereItIsKept;
  String? comments;
  String? attachment;
  int? assetId;

  Gold({
    required this.id,
    this.metalType,
    this.type,
    this.weightInGrams,
    this.whereItIsKept,
    this.comments,
    this.attachment,
    this.assetId,
  });

  Gold.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    metalType = json['metalType'];
    type = json['type'];
    weightInGrams = json['weightInGrams'];
    whereItIsKept = json['whereItIsKept'];
    comments = json['comments'];
    attachment = json['attachment'];
    assetId = json['assetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['metalType'] = metalType;
    data['type'] = type;
    data['weightInGrams'] = weightInGrams;
    data['whereItIsKept'] = whereItIsKept;
    data['comments'] = comments;
    data['attachment'] = attachment;
    data['assetId'] = assetId;
    return data;
  }
}

sealed class Asset {}