import 'dart:convert';


ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? status;
  List<Leads>? leads;
  int? leadCount;
  int? pageCount;

  ProductModel({this.status, this.leads, this.leadCount, this.pageCount});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['leads'] != null) {
      leads = <Leads>[];
      json['leads'].forEach((v) {
        leads!.add(new Leads.fromJson(v));
      });
    }
    leadCount = json['leadCount'];
    pageCount = json['pageCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.leads != null) {
      data['leads'] = this.leads!.map((v) => v.toJson()).toList();
    }
    data['leadCount'] = this.leadCount;
    data['pageCount'] = this.pageCount;
    return data;
  }
}

class Leads {
  CustomerRates? customerRates;
  String? imageURL;
  List<String>? labels;
  String? createdAt;
  Null? invoiceAddress;
  int? totalAppts;
  int? completedAppts;
  int? totalInvoice;
  int? invoiceCollectedThisMonth;
  int? invoiceCollectedSoFar;
  int? invoiceDueCount;
  String? sId;
  String? notaryId;
  String? email;
  String? bio;
  String? firstName;
  String? lastName;
  String? type;
  int? phoneNumber;
  String? city;
  int? zipCode;
  String? state;
  String? source;
  List<dynamic>? notes;
  List<dynamic>? knownContacts;
  int? iV;

  Leads(
      {this.customerRates,
      this.imageURL,
      this.labels,
      this.createdAt,
      this.invoiceAddress,
      this.totalAppts,
      this.completedAppts,
      this.totalInvoice,
      this.invoiceCollectedThisMonth,
      this.invoiceCollectedSoFar,
      this.invoiceDueCount,
      this.sId,
      this.notaryId,
      this.email,
      this.bio,
      this.firstName,
      this.lastName,
      this.type,
      this.phoneNumber,
      this.city,
      this.zipCode,
      this.state,
      this.source,
      this.notes,
      this.knownContacts,
      this.iV});

  Leads.fromJson(Map<String, dynamic> json) {
    customerRates = json['customerRates'] != null
        ? new CustomerRates.fromJson(json['customerRates'])
        : null;
    imageURL = json['imageURL'];
    labels = json['labels'].cast<String>();
    createdAt = json['createdAt'];
    invoiceAddress = json['invoiceAddress'];
    totalAppts = json['totalAppts'];
    completedAppts = json['completedAppts'];
    totalInvoice = json['totalInvoice'];
    invoiceCollectedThisMonth = json['invoiceCollectedThisMonth'];
    invoiceCollectedSoFar = json['invoiceCollectedSoFar'];
    invoiceDueCount = json['invoiceDueCount'];
    sId = json['_id'];
    notaryId = json['notaryId'];
    email = json['email'];
    bio = json['bio'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    zipCode = json['zipCode'];
    state = json['state'];
    source = json['source'];
    if (json['notes'] != null) {
      notes = <String>[];
      json['notes'].forEach((v) {
        notes!.add(v);
      });
    }
    if (json['knownContacts'] != null) {
      knownContacts = <Null>[];
      json['knownContacts'].forEach((v) {
        knownContacts!.add(v);
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerRates != null) {
      data['customerRates'] = this.customerRates!.toJson();
    }
    data['imageURL'] = this.imageURL;
    data['labels'] = this.labels;
    data['createdAt'] = this.createdAt;
    data['invoiceAddress'] = this.invoiceAddress;
    data['totalAppts'] = this.totalAppts;
    data['completedAppts'] = this.completedAppts;
    data['totalInvoice'] = this.totalInvoice;
    data['invoiceCollectedThisMonth'] = this.invoiceCollectedThisMonth;
    data['invoiceCollectedSoFar'] = this.invoiceCollectedSoFar;
    data['invoiceDueCount'] = this.invoiceDueCount;
    data['_id'] = this.sId;
    data['notaryId'] = this.notaryId;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['type'] = this.type;
    data['phoneNumber'] = this.phoneNumber;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;
    data['state'] = this.state;
    data['source'] = this.source;
    if (this.notes != null) {
      data['notes'] = this.notes!.map((v) => v.toJson()).toList();
    }
    if (this.knownContacts != null) {
      data['knownContacts'] =
          this.knownContacts!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class CustomerRates {
  List<dynamic>? others;

  CustomerRates({this.others});

  CustomerRates.fromJson(Map<String, dynamic> json) {
    if (json['others'] != null) {
      others = <Null>[];
      json['others'].forEach((v) {
        others!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.others != null) {
      data['others'] = this.others!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
