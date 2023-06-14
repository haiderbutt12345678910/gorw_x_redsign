import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Home/home.dart';
import 'package:unicons/unicons.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: 1,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('Asset/Images/b_1.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: bluleDark.withOpacity(0.6)),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).size.height * 0.025),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    height: 27.5,
                    width: 27.5,
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: blue,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top +
                  MediaQuery.of(context).size.height * 0.075),
          child: Column(
            children: [
              Expanded(
                child: FractionallySizedBox(
                  alignment: Alignment.center,
                  heightFactor: 0.825,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: panelBody(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 20,
                      right: 15,
                      left: 15),
                  child: Column(
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 12.5, horizontal: 15)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              side: const MaterialStatePropertyAll(
                                  BorderSide(color: Colors.white, width: 1))),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                UniconsLine.import,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Generate PDF',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 12.5, horizontal: 15)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor: MaterialStatePropertyAll(blue)),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          },
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Back To Home',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  panelBody() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50)),
              child: Container(
                margin: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: blue, borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Payment Success!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '\$199.00 USD',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
            const Divider(
              height: 25,
              thickness: 1,
            ),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.285),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildItem('Ref Number', '000085752257'),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildItem('Payment Time', '25-02-2023, 13:22:16'),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildItem('Payment Method', 'Bank Transfer'),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildItem('Sender Name', 'Antonio Roberto'),
                  const Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  _buildItem('Amount', '\$199.00 USD'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }
}
