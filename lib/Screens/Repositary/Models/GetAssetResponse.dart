class GetAssetResponse {
  Assets? assets;
  bool? success;
  String? message;

  GetAssetResponse({this.assets, this.success, this.message});

  GetAssetResponse.fromJson(Map<String, dynamic> json) {
    assets =
    json['assets'] != null ? new Assets.fromJson(json['assets']) : null;
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assets != null) {
      data['assets'] = this.assets!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Assets {
  List<BankAccount>? bankAccount;
  List<MutualFund>? mutualFund;
  List<StockBroker>? stockBroker;
  List<LifeInsurance>? lifeInsurance;
  List<PostOfficeAccount>? postOfficeAccount;
  List<NonLifeInsurance>? nonLifeInsurance;
  List<CryptoExchange>? cryptoExchange;
  List<Nps>? nps;
  List<Pf>? pf;
  List<Ppf>? ppf;
  List<RealEstate>? realEstate;
  List<OtherAssets>? otherAssets;
  List<LoanGiven>? loanGiven;
  List<Vehicle>? vehicle;
  List<Gold>? gold;

  Assets(
      {this.bankAccount,
        this.mutualFund,
        this.stockBroker,
        this.lifeInsurance,
        this.postOfficeAccount,
        this.nonLifeInsurance,
        this.cryptoExchange,
        this.nps,
        this.pf,
        this.ppf,
        this.realEstate,
        this.otherAssets,
        this.loanGiven,
        this.vehicle,
        this.gold});

  Assets.fromJson(Map<String, dynamic> json) {
    if (json['bankAccount'] != null) {
      bankAccount = <BankAccount>[];
      json['bankAccount'].forEach((v) {
        bankAccount!.add(new BankAccount.fromJson(v));
      });
    }
    if (json['mutualFund'] != null) {
      mutualFund = <MutualFund>[];
      json['mutualFund'].forEach((v) {
        mutualFund!.add(new MutualFund.fromJson(v));
      });
    }
    if (json['stockBroker'] != null) {
      stockBroker = <StockBroker>[];
      json['stockBroker'].forEach((v) {
        stockBroker!.add(new StockBroker.fromJson(v));
      });
    }
    if (json['lifeInsurance'] != null) {
      lifeInsurance = <LifeInsurance>[];
      json['lifeInsurance'].forEach((v) {
        lifeInsurance!.add(new LifeInsurance.fromJson(v));
      });
    }
    if (json['postOfficeAccount'] != null) {
      postOfficeAccount = <PostOfficeAccount>[];
      json['postOfficeAccount'].forEach((v) {
        postOfficeAccount!.add(new PostOfficeAccount.fromJson(v));
      });
    }
    if (json['nonLifeInsurance'] != null) {
      nonLifeInsurance = <NonLifeInsurance>[];
      json['nonLifeInsurance'].forEach((v) {
        nonLifeInsurance!.add(new NonLifeInsurance.fromJson(v));
      });
    }
    if (json['cryptoExchange'] != null) {
      cryptoExchange = <CryptoExchange>[];
      json['cryptoExchange'].forEach((v) {
        cryptoExchange!.add(new CryptoExchange.fromJson(v));
      });
    }
    if (json['nps'] != null) {
      nps = <Nps>[];
      json['nps'].forEach((v) {
        nps!.add(new Nps.fromJson(v));
      });
    }
    if (json['pf'] != null) {
      pf = <Pf>[];
      json['pf'].forEach((v) {
        pf!.add(new Pf.fromJson(v));
      });
    }
    if (json['ppf'] != null) {
      ppf = <Ppf>[];
      json['ppf'].forEach((v) {
        ppf!.add(new Ppf.fromJson(v));
      });
    }
    if (json['realEstate'] != null) {
      realEstate = <RealEstate>[];
      json['realEstate'].forEach((v) {
        realEstate!.add(new RealEstate.fromJson(v));
      });
    }
    if (json['otherAssets'] != null) {
      otherAssets = <OtherAssets>[];
      json['otherAssets'].forEach((v) {
        otherAssets!.add(new OtherAssets.fromJson(v));
      });
    }
    if (json['loanGiven'] != null) {
      loanGiven = <LoanGiven>[];
      json['loanGiven'].forEach((v) {
        loanGiven!.add(new LoanGiven.fromJson(v));
      });
    }
    if (json['vehicle'] != null) {
      vehicle = <Vehicle>[];
      json['vehicle'].forEach((v) {
        vehicle!.add(new Vehicle.fromJson(v));
      });
    }
    if (json['gold'] != null) {
      gold = <Gold>[];
      json['gold'].forEach((v) {
        gold!.add(new Gold.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bankAccount != null) {
      data['bankAccount'] = this.bankAccount!.map((v) => v.toJson()).toList();
    }
    if (this.mutualFund != null) {
      data['mutualFund'] = this.mutualFund!.map((v) => v.toJson()).toList();
    }
    if (this.stockBroker != null) {
      data['stockBroker'] = this.stockBroker!.map((v) => v.toJson()).toList();
    }
    if (this.lifeInsurance != null) {
      data['lifeInsurance'] =
          this.lifeInsurance!.map((v) => v.toJson()).toList();
    }
    if (this.postOfficeAccount != null) {
      data['postOfficeAccount'] =
          this.postOfficeAccount!.map((v) => v.toJson()).toList();
    }
    if (this.nonLifeInsurance != null) {
      data['nonLifeInsurance'] =
          this.nonLifeInsurance!.map((v) => v.toJson()).toList();
    }
    if (this.cryptoExchange != null) {
      data['cryptoExchange'] =
          this.cryptoExchange!.map((v) => v.toJson()).toList();
    }
    if (this.nps != null) {
      data['nps'] = this.nps!.map((v) => v.toJson()).toList();
    }
    if (this.pf != null) {
      data['pf'] = this.pf!.map((v) => v.toJson()).toList();
    }
    if (this.ppf != null) {
      data['ppf'] = this.ppf!.map((v) => v.toJson()).toList();
    }
    if (this.realEstate != null) {
      data['realEstate'] = this.realEstate!.map((v) => v.toJson()).toList();
    }
    if (this.otherAssets != null) {
      data['otherAssets'] = this.otherAssets!.map((v) => v.toJson()).toList();
    }
    if (this.loanGiven != null) {
      data['loanGiven'] = this.loanGiven!.map((v) => v.toJson()).toList();
    }
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.map((v) => v.toJson()).toList();
    }
    if (this.gold != null) {
      data['gold'] = this.gold!.map((v) => v.toJson()).toList();
    }
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

  BankAccount(
      {this.id,
        this.bankName,
        this.accountNumber,
        this.ifscCode,
        this.branchName,
        this.accountType,
        this.comments,
        this.attachment,
        this.assetId});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankName'] = this.bankName;
    data['accountNumber'] = this.accountNumber;
    data['ifscCode'] = this.ifscCode;
    data['branchName'] = this.branchName;
    data['accountType'] = this.accountType;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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

  MutualFund(
      {this.id,
        this.amcName,
        this.schemeName,
        this.folioNumber,
        this.fundType,
        this.comments,
        this.attachment,
        this.assetId});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amcName'] = this.amcName;
    data['schemeName'] = this.schemeName;
    data['folioNumber'] = this.folioNumber;
    data['fundType'] = this.fundType;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brokerName'] = this.brokerName;
    data['dematAccountNumber'] = this.dematAccountNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}

class LifeInsurance {
  int? id;
  String? insuranceCompanyName;
  String? policyName;
  String? policyNumber;
  int? coverageAmount;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['policyName'] = this.policyName;
    data['policyNumber'] = this.policyNumber;
    data['coverageAmount'] = this.coverageAmount;
    data['maturityDate'] = this.maturityDate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branchName'] = this.branchName;
    data['accountNumber'] = this.accountNumber;
    data['accountType'] = this.accountType;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['typeOfInsurance'] = this.typeOfInsurance;
    data['policyName'] = this.policyName;
    data['policyNumber'] = this.policyNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exchangeName'] = this.exchangeName;
    data['accountNumber'] = this.accountNumber;
    data['walletAddress'] = this.walletAddress;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pranNumber'] = this.pranNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uanNumber'] = this.uanNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ppfAccountNumber'] = this.ppfAccountNumber;
    data['institutionName'] = this.institutionName;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['typeOfProperty'] = this.typeOfProperty;
    data['address'] = this.address;
    data['khataNumber'] = this.khataNumber;
    data['northOfProperty'] = this.northOfProperty;
    data['southOfProperty'] = this.southOfProperty;
    data['eastOfProperty'] = this.eastOfProperty;
    data['westOfProperty'] = this.westOfProperty;
    data['image'] = this.image;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['assetName'] = this.assetName;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}

class LoanGiven {
  int? id;
  String? borrowerName;
  int? loanAmount;
  String? loanGivenDate;
  int? interestRate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['borrowerName'] = this.borrowerName;
    data['loanAmount'] = this.loanAmount;
    data['loanGivenDate'] = this.loanGivenDate;
    data['interestRate'] = this.interestRate;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicleType'] = this.vehicleType;
    data['brandName'] = this.brandName;
    data['modelName'] = this.modelName;
    data['registrationNumber'] = this.registrationNumber;
    data['chassisNumber'] = this.chassisNumber;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}

class Gold {
  int? id;
  String? metalType;
  String? type;
  int? weightInGrams;
  String? whereItIsKept;
  String? comments;
  String? attachment;
  int? assetId;

  Gold(
      {this.id,
        this.metalType,
        this.type,
        this.weightInGrams,
        this.whereItIsKept,
        this.comments,
        this.attachment,
        this.assetId});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['metalType'] = this.metalType;
    data['type'] = this.type;
    data['weightInGrams'] = this.weightInGrams;
    data['whereItIsKept'] = this.whereItIsKept;
    data['comments'] = this.comments;
    data['attachment'] = this.attachment;
    data['assetId'] = this.assetId;
    return data;
  }
}
