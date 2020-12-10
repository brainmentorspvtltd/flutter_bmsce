import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Razorpay _razorpay;
  _showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue);
  }

  setupRazorPay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse res) {
      _showToastMessage(
          tr('msg') + " " + tr('msg2') + 'Payment Success ${res.paymentId}');
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse res) {
      _showToastMessage(tr('msg') + 'Payment Fail ${res.message}');
    });
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (ExternalWalletResponse res) {
      _showToastMessage('External Wallet ${res.walletName}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupRazorPay();
  }

  bool flag = false;
  _changeLang() {
    if (flag) {
      EasyLocalization.of(context).locale = Locale('en', 'US');
    } else {
      EasyLocalization.of(context).locale = Locale('hi', 'IN');
    }
    flag = !flag;
  }

  _payNow(double amount) {
    Map<String, dynamic> map = {
      'key': 'urkey',
      'amount': amount,
      'name': 'Amit',
      'description': 'Payment for Testing Purpose',
      'prefill': {'contact': '5454353', 'email': 'example@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(map);
    } catch (e) {
      print("Exception in Razor Pay $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment' + tr('msg') + " " + (tr('msg2'))),
      ),
      body: Column(
        children: [
          Text(
            'Payment Demo',
            style: TextStyle(fontSize: 32),
          ),
          RaisedButton(
            onPressed: () {
              _payNow(1000);
            },
            child: Text('Pay Now'),
          ),
          RaisedButton(
            onPressed: () {
              _changeLang();
            },
            child: Text('Change lang'),
          )
        ],
      ),
    );
  }
}
