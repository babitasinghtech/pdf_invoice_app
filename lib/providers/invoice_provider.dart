// lib/providers/invoice_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/invoice_data.dart';

/// StateNotifier for managing invoice data with all fields
class InvoiceNotifier extends StateNotifier<InvoiceData> {
  InvoiceNotifier() : super(InvoiceData.empty);

  // Invoice Metadata Updates
  void updateInvoiceNumber(String value) =>
      state = state.copyWith(invoiceNumber: value);

  void updateDate(String value) => state = state.copyWith(date: value);

  void updateBuyerOrderNo(String value) =>
      state = state.copyWith(buyerOrderNo: value);

  void updateBuyerOrderDate(String value) =>
      state = state.copyWith(buyerOrderDate: value);

  // Consignor Updates
  void updateConsignorName(String value) =>
      state = state.copyWith(consignorName: value);

  void updateConsignorAddress(String value) =>
      state = state.copyWith(consignorAddress: value);

  void updateConsignorCity(String value) =>
      state = state.copyWith(consignorCity: value);

  void updateConsignorGSTIN(String value) =>
      state = state.copyWith(consignorGSTIN: value);

  // Consignee Updates
  void updateConsigneeName(String value) =>
      state = state.copyWith(consigneeName: value);

  void updateConsigneeAddress(String value) =>
      state = state.copyWith(consigneeAddress: value);

  void updateConsigneeCity(String value) =>
      state = state.copyWith(consigneeCity: value);

  void updateConsigneeGSTIN(String value) =>
      state = state.copyWith(consigneeGSTIN: value);

  // Transport Details Updates
  void updateBillOfLadingNo(String value) =>
      state = state.copyWith(billOfLadingNo: value);

  void updateMotorVehicleNo(String value) =>
      state = state.copyWith(motorVehicleNo: value);

  void updateLoadingFrom(String value) =>
      state = state.copyWith(loadingFrom: value);

  void updateDeliveryPoint(String value) =>
      state = state.copyWith(deliveryPoint: value);

  void updateSpecialNote(String value) =>
      state = state.copyWith(specialNote: value);

  // Goods Details Updates
  void updateDescription(String value) =>
      state = state.copyWith(description: value);

  void updateHsnSac(String value) => state = state.copyWith(hsnSac: value);

  void updateQuantity(String value) => state = state.copyWith(quantity: value);

  void updateRate(String value) => state = state.copyWith(rate: value);

  void updatePer(String value) => state = state.copyWith(per: value);

  // Tax Updates
  void updateIGST(String value) => state = state.copyWith(igst: value);

  void updateCGST(String value) => state = state.copyWith(cgst: value);

  void updateSGST(String value) => state = state.copyWith(sgst: value);

  // Bank Details Updates
  void updateBankName(String value) => state = state.copyWith(bankName: value);

  void updateAccountNo(String value) =>
      state = state.copyWith(accountNo: value);

  void updateBranch(String value) => state = state.copyWith(branch: value);

  void updateIFSCCode(String value) => state = state.copyWith(ifscCode: value);

  /// Reset all fields
  void reset() => state = InvoiceData.empty;
}

/// Provider for invoice state management
final invoiceProvider =
    StateNotifierProvider.autoDispose<InvoiceNotifier, InvoiceData>(
      (ref) => InvoiceNotifier(),
    );
