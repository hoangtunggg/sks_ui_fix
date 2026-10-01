import 'dart:developer';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QrShowScreen extends StatelessWidget {
  const QrShowScreen({super.key});

  Future<void> downloadQrCode() async {
    final controller = ScreenshotController();
    Uint8List bytes = await controller.captureFromWidget(
      _showQRShow(),
      pixelRatio: 2.0,
      delay: const Duration(milliseconds: 100),
    );

    try {
      await FileSaver.instance.saveFile(
        name: "image.jpeg",
        bytes: bytes,
        mimeType: MimeType.jpeg,
      );
      log('Dowload thanh cong');
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 800,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lightbulb_circle_outlined, size: 32),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        'Mở App Ngân hàng bất kỳ để quét mã VietQR hoặc chuyển khoản chính xác số tiền bên dưới',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _showQRShow(),

                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 120,
                                height: 38,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      77,
                                      157,
                                      248,
                                    ),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: downloadQrCode,
                                  child: const Text(
                                    'Tải về',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              SizedBox(
                                width: 120,
                                height: 38,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    // xử lý khi xác nhận
                                  },
                                  child: const Text(
                                    'Chia sẻ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          SizedBox(
                            height: 38,
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  138,
                                  0,
                                  0,
                                ),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                // xử lý khi xác nhận
                              },
                              child: const Text(
                                'Hủy',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Ngân hàng'),
                          const Text(
                            'Ngân hàng TMCP Quân đội',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 10),

                          const Text('Chủ tài khoản:'),
                          const Text(
                            'ABCDEFG',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 10),

                          const Text('Số tài khoản:'),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  '0123465789',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextButton(
                                  onPressed: null,
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xffedf7f3),
                                    foregroundColor: const Color.fromARGB(
                                      137,
                                      22,
                                      131,
                                      221,
                                    ),
                                  ),
                                  child: Text(
                                    'Sao chép',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          const Text('Số tiền:'),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  '100,000',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextButton(
                                  onPressed: null,
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xffedf7f3),
                                    foregroundColor: const Color.fromARGB(
                                      137,
                                      22,
                                      131,
                                      221,
                                    ),
                                  ),
                                  child: Text(
                                    'Sao chép',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          const Text('Nội dung:'),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  'Chuyển khoản tiền',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextButton(
                                  onPressed: null,
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xffedf7f3),
                                    foregroundColor: const Color.fromARGB(
                                      137,
                                      22,
                                      131,
                                      221,
                                    ),
                                  ),
                                  child: Text(
                                    'Sao chép',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showQRShow() {
    return SizedBox(
      width: 250,
      height: 250,
      child: QrImageView(data: '0123456789', size: 200),
    );
  }
}
