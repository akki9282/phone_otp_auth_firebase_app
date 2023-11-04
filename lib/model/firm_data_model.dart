import 'dart:convert';

List<FirmDataModel> firmDataModelFromJson(String str) =>
    List<FirmDataModel>.from(
        json.decode(str).map((x) => FirmDataModel.fromJson(x)));

String firmDataModelToJson(List<FirmDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FirmDataModel {
  String? firmId;
  String? firmOwnId;
  String? firmName;
  String? firmRegNo;
  String? firmType;
  String? firmOwner;
  String? firmLongName;
  String? firmDesc;
  String? firmAddress;
  String? firmCity;
  String? firmPhoneDetails;
  String? firmEmail;
  String? firmWebsite;
  String? firmComments;
  String? firmSmtpEmail;
  String? firmSmtpPass;
  String? firmFormN;
  String? firmFormR;
  String? firmFormHeader;
  String? firmFormFooter;
  String? firmOpCashBal;
  String? firmOpCashBalCrdr;
  String? firmOpCashDate;
  String? firmOpGoldBal;
  String? firmOpGoldBalWtype;
  String? firmOpGoldBalCrdr;
  String? firmOpSilvBal;
  String? firmOpSilvBalWtype;
  String? firmOpSilvBalCrdr;
  String? firmCapitalAccId;
  String? firmPanNo;
  String? firmTinNo;
  String? firmSince;
  String? firmPrincipalAmtLimit;
  String? firmLeftThumb;
  String? firmLeftThumbFtype;
  String? firmRightThumb;
  String? firmRightThumbFtype;
  String? firmOtherInfo;
  String? firmBankDetails;
  String? firmBankAccNo;
  String? firmBankIfscCode;
  String? firmBankDeclaration;
  String? firmOwnerSign;
  String? firmOwnerSignFtype;
  String? firmLeftLogoId;
  String? firmRightLogoId;
  String? firmUserSignId;
  String? firmCountry;
  String? firmState;
  String? firmCurrency;
  String? firmCurrencyOptionType;
  String? firmSmtpServer;
  String? firmSmtpPort;
  String? firmSmtpCcEmail;
  String? firmOtp;
  String? firmStaffId;

  FirmDataModel(
      {this.firmId,
      this.firmOwnId,
      this.firmName,
      this.firmRegNo,
      this.firmType,
      this.firmOwner,
      this.firmLongName,
      this.firmDesc,
      this.firmAddress,
      this.firmCity,
      this.firmPhoneDetails,
      this.firmEmail,
      this.firmWebsite,
      this.firmComments,
      this.firmSmtpEmail,
      this.firmSmtpPass,
      this.firmFormN,
      this.firmFormR,
      this.firmFormHeader,
      this.firmFormFooter,
      this.firmOpCashBal,
      this.firmOpCashBalCrdr,
      this.firmOpCashDate,
      this.firmOpGoldBal,
      this.firmOpGoldBalWtype,
      this.firmOpGoldBalCrdr,
      this.firmOpSilvBal,
      this.firmOpSilvBalWtype,
      this.firmOpSilvBalCrdr,
      this.firmCapitalAccId,
      this.firmPanNo,
      this.firmTinNo,
      this.firmSince,
      this.firmPrincipalAmtLimit,
      this.firmLeftThumb,
      this.firmLeftThumbFtype,
      this.firmRightThumb,
      this.firmRightThumbFtype,
      this.firmOtherInfo,
      this.firmBankDetails,
      this.firmBankAccNo,
      this.firmBankIfscCode,
      this.firmBankDeclaration,
      this.firmOwnerSign,
      this.firmOwnerSignFtype,
      this.firmLeftLogoId,
      this.firmRightLogoId,
      this.firmUserSignId,
      this.firmCountry,
      this.firmState,
      this.firmCurrency,
      this.firmCurrencyOptionType,
      this.firmSmtpServer,
      this.firmSmtpPort,
      this.firmSmtpCcEmail,
      this.firmOtp,
      this.firmStaffId});

  FirmDataModel.fromJson(Map<String, dynamic> json) {
    firmId = json['firm_id'];
    firmOwnId = json['firm_own_id'];
    firmName = json['firm_name'];
    firmRegNo = json['firm_reg_no'];
    firmType = json['firm_type'];
    firmOwner = json['firm_owner'];
    firmLongName = json['firm_long_name'];
    firmDesc = json['firm_desc'];
    firmAddress = json['firm_address'];
    firmCity = json['firm_city'];
    firmPhoneDetails = json['firm_phone_details'];
    firmEmail = json['firm_email'];
    firmWebsite = json['firm_website'];
    firmComments = json['firm_comments'];
    firmSmtpEmail = json['firm_smtp_email'];
    firmSmtpPass = json['firm_smtp_pass'];
    firmFormN = json['firm_formN'];
    firmFormR = json['firm_formR'];
    firmFormHeader = json['firm_form_header'];
    firmFormFooter = json['firm_form_footer'];
    firmOpCashBal = json['firm_op_cash_bal'];
    firmOpCashBalCrdr = json['firm_op_cash_bal_crdr'];
    firmOpCashDate = json['firm_op_cash_date'];
    firmOpGoldBal = json['firm_op_gold_bal'];
    firmOpGoldBalWtype = json['firm_op_gold_bal_wtype'];
    firmOpGoldBalCrdr = json['firm_op_gold_bal_crdr'];
    firmOpSilvBal = json['firm_op_silv_bal'];
    firmOpSilvBalWtype = json['firm_op_silv_bal_wtype'];
    firmOpSilvBalCrdr = json['firm_op_silv_bal_crdr'];
    firmCapitalAccId = json['firm_capital_acc_id'];
    firmPanNo = json['firm_pan_no'];
    firmTinNo = json['firm_tin_no'];
    firmSince = json['firm_since'];
    firmPrincipalAmtLimit = json['firm_principal_amt_limit'];
    firmLeftThumb = json['firm_left_thumb'];
    firmLeftThumbFtype = json['firm_left_thumb_ftype'];
    firmRightThumb = json['firm_right_thumb'];
    firmRightThumbFtype = json['firm_right_thumb_ftype'];
    firmOtherInfo = json['firm_other_info'];
    firmBankDetails = json['firm_bank_details'];
    firmBankAccNo = json['firm_bank_acc_no'];
    firmBankIfscCode = json['firm_bank_ifsc_code'];
    firmBankDeclaration = json['firm_bank_declaration'];
    firmOwnerSign = json['firm_owner_sign'];
    firmOwnerSignFtype = json['firm_owner_sign_ftype'];
    firmLeftLogoId = json['firm_left_logo_id'];
    firmRightLogoId = json['firm_right_logo_id'];
    firmUserSignId = json['firm_user_sign_id'];
    firmCountry = json['firm_country'];
    firmState = json['firm_state'];
    firmCurrency = json['firm_currency'];
    firmCurrencyOptionType = json['firm_currency_option_type'];
    firmSmtpServer = json['firm_smtp_server'];
    firmSmtpPort = json['firm_smtp_port'];
    firmSmtpCcEmail = json['firm_smtp_cc_email'];
    firmOtp = json['firm_otp'];
    firmStaffId = json['firm_staff_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firm_id'] = this.firmId;
    data['firm_own_id'] = this.firmOwnId;
    data['firm_name'] = this.firmName;
    data['firm_reg_no'] = this.firmRegNo;
    data['firm_type'] = this.firmType;
    data['firm_owner'] = this.firmOwner;
    data['firm_long_name'] = this.firmLongName;
    data['firm_desc'] = this.firmDesc;
    data['firm_address'] = this.firmAddress;
    data['firm_city'] = this.firmCity;
    data['firm_phone_details'] = this.firmPhoneDetails;
    data['firm_email'] = this.firmEmail;
    data['firm_website'] = this.firmWebsite;
    data['firm_comments'] = this.firmComments;
    data['firm_smtp_email'] = this.firmSmtpEmail;
    data['firm_smtp_pass'] = this.firmSmtpPass;
    data['firm_formN'] = this.firmFormN;
    data['firm_formR'] = this.firmFormR;
    data['firm_form_header'] = this.firmFormHeader;
    data['firm_form_footer'] = this.firmFormFooter;
    data['firm_op_cash_bal'] = this.firmOpCashBal;
    data['firm_op_cash_bal_crdr'] = this.firmOpCashBalCrdr;
    data['firm_op_cash_date'] = this.firmOpCashDate;
    data['firm_op_gold_bal'] = this.firmOpGoldBal;
    data['firm_op_gold_bal_wtype'] = this.firmOpGoldBalWtype;
    data['firm_op_gold_bal_crdr'] = this.firmOpGoldBalCrdr;
    data['firm_op_silv_bal'] = this.firmOpSilvBal;
    data['firm_op_silv_bal_wtype'] = this.firmOpSilvBalWtype;
    data['firm_op_silv_bal_crdr'] = this.firmOpSilvBalCrdr;
    data['firm_capital_acc_id'] = this.firmCapitalAccId;
    data['firm_pan_no'] = this.firmPanNo;
    data['firm_tin_no'] = this.firmTinNo;
    data['firm_since'] = this.firmSince;
    data['firm_principal_amt_limit'] = this.firmPrincipalAmtLimit;
    data['firm_left_thumb'] = this.firmLeftThumb;
    data['firm_left_thumb_ftype'] = this.firmLeftThumbFtype;
    data['firm_right_thumb'] = this.firmRightThumb;
    data['firm_right_thumb_ftype'] = this.firmRightThumbFtype;
    data['firm_other_info'] = this.firmOtherInfo;
    data['firm_bank_details'] = this.firmBankDetails;
    data['firm_bank_acc_no'] = this.firmBankAccNo;
    data['firm_bank_ifsc_code'] = this.firmBankIfscCode;
    data['firm_bank_declaration'] = this.firmBankDeclaration;
    data['firm_owner_sign'] = this.firmOwnerSign;
    data['firm_owner_sign_ftype'] = this.firmOwnerSignFtype;
    data['firm_left_logo_id'] = this.firmLeftLogoId;
    data['firm_right_logo_id'] = this.firmRightLogoId;
    data['firm_user_sign_id'] = this.firmUserSignId;
    data['firm_country'] = this.firmCountry;
    data['firm_state'] = this.firmState;
    data['firm_currency'] = this.firmCurrency;
    data['firm_currency_option_type'] = this.firmCurrencyOptionType;
    data['firm_smtp_server'] = this.firmSmtpServer;
    data['firm_smtp_port'] = this.firmSmtpPort;
    data['firm_smtp_cc_email'] = this.firmSmtpCcEmail;
    data['firm_otp'] = this.firmOtp;
    data['firm_staff_id'] = this.firmStaffId;
    return data;
  }
}
