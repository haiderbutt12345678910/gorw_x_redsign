import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/ScreenSpecific/SubsCriptionWidgets/subscriptio_cards_widgets.dart';

class SubscriptionOverviewScreen extends StatelessWidget {
  const SubscriptionOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Asset/Images/b_4.png'), fit: BoxFit.cover),),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    height: 25,
                    width: 25,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                Image.asset(
                  'Asset/Images/logo-min.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 25,
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Choose Your Plan",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 25,
            ),
            const SubsCriptionCardsWidgets(),
          ],
        ),
      ),
    );
  }
}
