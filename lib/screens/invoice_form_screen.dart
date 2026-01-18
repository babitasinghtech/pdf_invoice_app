// SIMPLE TEST VERSION - Replace invoice_form_screen.dart with this to test
// This version has only 4 REQUIRED fields on ONE screen for easy testing

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/invoice_provider.dart';
import '../services/pdf_service.dart';

class InvoiceFormScreen extends ConsumerWidget {
  const InvoiceFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceData = ref.watch(invoiceProvider);
    final notifier = ref.read(invoiceProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tax Invoice - SIMPLE TEST'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Debug Card - Shows validation status
            Card(
              color: invoiceData.isValid
                  ? Colors.green.shade50
                  : Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      invoiceData.isValid ? Icons.check_circle : Icons.error,
                      color: invoiceData.isValid ? Colors.green : Colors.red,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      invoiceData.isValid
                          ? 'READY TO GENERATE!'
                          : 'FILL ALL FIELDS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: invoiceData.isValid ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Required Fields Status:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    _buildStatusRow(
                      'Invoice Number',
                      invoiceData.invoiceNumber.isNotEmpty,
                    ),
                    _buildStatusRow(
                      'Consignor Name',
                      invoiceData.consignorName.isNotEmpty,
                    ),
                    _buildStatusRow(
                      'Consignee Name',
                      invoiceData.consigneeName.isNotEmpty,
                    ),
                    _buildStatusRow(
                      'Vehicle No',
                      invoiceData.motorVehicleNo.isNotEmpty,
                    ),
                    _buildStatusRow(
                      'Description',
                      invoiceData.description.isNotEmpty,
                    ),
                    _buildStatusRow(
                      'Quantity',
                      invoiceData.quantity.isNotEmpty,
                    ),
                    _buildStatusRow('Rate', invoiceData.rate.isNotEmpty),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // INVOICE DETAILS
            Text(
              'INVOICE DETAILS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Invoice Number (Required)',
              'e.g., INV001',
              invoiceData.invoiceNumber,
              notifier.updateInvoiceNumber,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Date',
              'e.g., 18/01/2026',
              invoiceData.date,
              notifier.updateDate,
            ),
            const SizedBox(height: 30),

            // CONSIGNOR (SELLER)
            Text(
              'CONSIGNOR (SELLER)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Consignor Name (Required)',
              'e.g., ABC Trading Company',
              invoiceData.consignorName,
              notifier.updateConsignorName,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Address',
              'e.g., 123 Main Street',
              invoiceData.consignorAddress,
              notifier.updateConsignorAddress,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'City',
              'e.g., Mumbai',
              invoiceData.consignorCity,
              notifier.updateConsignorCity,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'GSTIN',
              'e.g., 27AABCU9603R1ZX',
              invoiceData.consignorGSTIN,
              notifier.updateConsignorGSTIN,
            ),
            const SizedBox(height: 30),

            // CONSIGNEE (BUYER)
            Text(
              'CONSIGNEE (BUYER)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Consignee Name (Required)',
              'e.g., XYZ Solutions',
              invoiceData.consigneeName,
              notifier.updateConsigneeName,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Address',
              'e.g., 456 Park Avenue',
              invoiceData.consigneeAddress,
              notifier.updateConsigneeAddress,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'City',
              'e.g., Delhi',
              invoiceData.consigneeCity,
              notifier.updateConsigneeCity,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'GSTIN',
              'e.g., 07AABCU9603R1ZX',
              invoiceData.consigneeGSTIN,
              notifier.updateConsigneeGSTIN,
            ),
            const SizedBox(height: 30),

            // TRANSPORT
            Text(
              'TRANSPORT DETAILS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Motor Vehicle Number (Required)',
              'e.g., MH01AB1234',
              invoiceData.motorVehicleNo,
              notifier.updateMotorVehicleNo,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Loading From',
              'e.g., Warehouse A',
              invoiceData.loadingFrom,
              notifier.updateLoadingFrom,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Delivery Point',
              'e.g., Store B',
              invoiceData.deliveryPoint,
              notifier.updateDeliveryPoint,
            ),
            const SizedBox(height: 30),

            // GOODS
            Text(
              'GOODS DETAILS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'Description (Required)',
              'e.g., Cotton Fabric',
              invoiceData.description,
              notifier.updateDescription,
            ),
            const SizedBox(height: 16),

            _buildSimpleField(
              'HSN/SAC Code',
              'e.g., 52081000',
              invoiceData.hsnSac,
              notifier.updateHsnSac,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _buildSimpleField(
                    'Quantity (Required)',
                    'e.g., 100',
                    invoiceData.quantity,
                    notifier.updateQuantity,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSimpleField(
                    'Rate (Required)',
                    'e.g., 50.00',
                    invoiceData.rate,
                    notifier.updateRate,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Amount Preview
            if (invoiceData.quantity.isNotEmpty && invoiceData.rate.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Column(
                  children: [
                    Text(
                      'CALCULATED AMOUNT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹${invoiceData.formatAmount(invoiceData.subTotal)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 100), // Space for button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: invoiceData.isValid
            ? () => _generatePdf(context, invoiceData)
            : null,
        backgroundColor: invoiceData.isValid ? Colors.blue : Colors.grey,
        icon: const Icon(Icons.picture_as_pdf),
        label: const Text('GENERATE PDF'),
      ),
    );
  }

  Widget _buildStatusRow(String label, bool isComplete) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            isComplete ? Icons.check_circle : Icons.cancel,
            color: isComplete ? Colors.green : Colors.red,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSimpleField(
    String label,
    String hint,
    String value,
    Function(String) onChanged, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: value)
            ..selection = TextSelection.fromPosition(
              TextPosition(offset: value.length),
            ),
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _generatePdf(BuildContext context, invoiceData) async {
    print('🚀 GENERATE PDF CALLED!');
    print('Invoice Number: ${invoiceData.invoiceNumber}');
    print('Consignor: ${invoiceData.consignorName}');
    print('Consignee: ${invoiceData.consigneeName}');
    print('Vehicle: ${invoiceData.motorVehicleNo}');

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Generating PDF...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      print('📄 Calling PdfService.generateInvoice...');
      final pdfDoc = await PdfService.generateInvoice(invoiceData);
      print('✅ PDF Generated successfully!');

      if (context.mounted) Navigator.of(context).pop();

      print('👀 Opening PDF preview...');
      await PdfService.showPdfPreview(pdfDoc);
      print('✅ PDF Preview shown!');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ PDF generated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e, stackTrace) {
      print('❌ ERROR: $e');
      print('Stack trace: $stackTrace');

      if (context.mounted) Navigator.of(context).pop();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }
}
