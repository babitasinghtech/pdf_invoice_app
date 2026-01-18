// lib/models/invoice_data.dart

/// Complete invoice data model matching the tax invoice design
class InvoiceData {
  // Invoice Metadata
  final String invoiceNumber;
  final String date;
  final String buyerOrderNo;
  final String buyerOrderDate;

  // Consignor (Seller) Details
  final String consignorName;
  final String consignorAddress;
  final String consignorCity;
  final String consignorGSTIN;

  // Consignee (Buyer) Details
  final String consigneeName;
  final String consigneeAddress;
  final String consigneeCity;
  final String consigneeGSTIN;

  // Transport Details
  final String billOfLadingNo;
  final String motorVehicleNo;
  final String loadingFrom;
  final String deliveryPoint;
  final String specialNote;

  // Goods Details (simplified - single item for assignment)
  final String description;
  final String hsnSac;
  final String quantity;
  final String rate;
  final String per;

  // Tax Details
  final String igst;
  final String cgst;
  final String sgst;

  // Bank Details
  final String bankName;
  final String accountNo;
  final String branch;
  final String ifscCode;

  const InvoiceData({
    required this.invoiceNumber,
    required this.date,
    this.buyerOrderNo = '',
    this.buyerOrderDate = '',
    required this.consignorName,
    required this.consignorAddress,
    required this.consignorCity,
    required this.consignorGSTIN,
    required this.consigneeName,
    required this.consigneeAddress,
    required this.consigneeCity,
    required this.consigneeGSTIN,
    required this.billOfLadingNo,
    required this.motorVehicleNo,
    required this.loadingFrom,
    required this.deliveryPoint,
    this.specialNote = '',
    required this.description,
    required this.hsnSac,
    required this.quantity,
    required this.rate,
    this.per = 'LOOSE',
    this.igst = '0',
    this.cgst = '0',
    this.sgst = '0',
    this.bankName = '',
    this.accountNo = '',
    this.branch = '',
    this.ifscCode = '',
  });

  /// Calculate subtotal (quantity * rate)
  double get subTotal {
    final qty = double.tryParse(quantity) ?? 0;
    final rateVal = double.tryParse(rate) ?? 0;
    return qty * rateVal;
  }

  /// Calculate IGST amount
  double get igstAmount {
    final igstRate = double.tryParse(igst) ?? 0;
    return subTotal * (igstRate / 100);
  }

  /// Calculate CGST amount
  double get cgstAmount {
    final cgstRate = double.tryParse(cgst) ?? 0;
    return subTotal * (cgstRate / 100);
  }

  /// Calculate SGST amount
  double get sgstAmount {
    final sgstRate = double.tryParse(sgst) ?? 0;
    return subTotal * (sgstRate / 100);
  }

  /// Calculate grand total
  double get grandTotal {
    return subTotal + igstAmount + cgstAmount + sgstAmount;
  }

  /// Format currency for display
  String formatAmount(double amount) {
    return amount.toStringAsFixed(2);
  }

  /// Validates if minimum required fields are filled
  bool get isValid {
    return invoiceNumber.isNotEmpty &&
        consignorName.isNotEmpty &&
        consigneeName.isNotEmpty &&
        motorVehicleNo.isNotEmpty &&
        description.isNotEmpty &&
        quantity.isNotEmpty &&
        rate.isNotEmpty;
  }

  /// Empty initial state
  static const empty = InvoiceData(
    invoiceNumber: '',
    date: '',
    consignorName: '',
    consignorAddress: '',
    consignorCity: '',
    consignorGSTIN: '',
    consigneeName: '',
    consigneeAddress: '',
    consigneeCity: '',
    consigneeGSTIN: '',
    billOfLadingNo: '',
    motorVehicleNo: '',
    loadingFrom: '',
    deliveryPoint: '',
    description: '',
    hsnSac: '',
    quantity: '',
    rate: '',
  );

  /// Create copy with updated fields
  InvoiceData copyWith({
    String? invoiceNumber,
    String? date,
    String? buyerOrderNo,
    String? buyerOrderDate,
    String? consignorName,
    String? consignorAddress,
    String? consignorCity,
    String? consignorGSTIN,
    String? consigneeName,
    String? consigneeAddress,
    String? consigneeCity,
    String? consigneeGSTIN,
    String? billOfLadingNo,
    String? motorVehicleNo,
    String? loadingFrom,
    String? deliveryPoint,
    String? specialNote,
    String? description,
    String? hsnSac,
    String? quantity,
    String? rate,
    String? per,
    String? igst,
    String? cgst,
    String? sgst,
    String? bankName,
    String? accountNo,
    String? branch,
    String? ifscCode,
  }) {
    return InvoiceData(
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      date: date ?? this.date,
      buyerOrderNo: buyerOrderNo ?? this.buyerOrderNo,
      buyerOrderDate: buyerOrderDate ?? this.buyerOrderDate,
      consignorName: consignorName ?? this.consignorName,
      consignorAddress: consignorAddress ?? this.consignorAddress,
      consignorCity: consignorCity ?? this.consignorCity,
      consignorGSTIN: consignorGSTIN ?? this.consignorGSTIN,
      consigneeName: consigneeName ?? this.consigneeName,
      consigneeAddress: consigneeAddress ?? this.consigneeAddress,
      consigneeCity: consigneeCity ?? this.consigneeCity,
      consigneeGSTIN: consigneeGSTIN ?? this.consigneeGSTIN,
      billOfLadingNo: billOfLadingNo ?? this.billOfLadingNo,
      motorVehicleNo: motorVehicleNo ?? this.motorVehicleNo,
      loadingFrom: loadingFrom ?? this.loadingFrom,
      deliveryPoint: deliveryPoint ?? this.deliveryPoint,
      specialNote: specialNote ?? this.specialNote,
      description: description ?? this.description,
      hsnSac: hsnSac ?? this.hsnSac,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      per: per ?? this.per,
      igst: igst ?? this.igst,
      cgst: cgst ?? this.cgst,
      sgst: sgst ?? this.sgst,
      bankName: bankName ?? this.bankName,
      accountNo: accountNo ?? this.accountNo,
      branch: branch ?? this.branch,
      ifscCode: ifscCode ?? this.ifscCode,
    );
  }
}
