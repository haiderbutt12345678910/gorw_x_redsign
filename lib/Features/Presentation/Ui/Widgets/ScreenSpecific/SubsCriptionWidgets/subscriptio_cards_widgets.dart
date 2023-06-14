import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Home/home.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/SubsCritionScreens/payment_success.dart';
import 'package:flutter_application_growx_new_design/const.dart';

class SubsCriptionCardsWidgets extends StatelessWidget {
  const SubsCriptionCardsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    const list = subscriptionDataList;
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .77,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (ctx, index) {
            return SizedBox(
              width: size.width,
              height: size.height * .77,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          title: Text(
                            list[index].planName as String,
                            style: TextStyle(
                              fontSize: 22,
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            list[index].planPrice as String,
                            style: TextStyle(
                              fontSize: 36,
                              color: blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (int i = 0;
                            i < list[index].subscriptionFeatures!.length;
                            i++)
                          Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: CircleAvatar(
                                      radius: 11,
                                      backgroundColor: list[index]
                                              .subscriptionFeatures![i]
                                              .isAvailaible as bool
                                          ? blue
                                          : Colors.grey[600],
                                      child: Icon(
                                        list[index]
                                                .subscriptionFeatures![i]
                                                .isAvailaible as bool
                                            ? Icons.check
                                            : Icons.close,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    )),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                        flex: 10,
                                        child: Text(
                                          list[index]
                                              .subscriptionFeatures![i]
                                              .feature as String,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(blue)),
                              onPressed: () {
                                if (index == 0) {


                                  
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()),
                                  );
                                } else if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentSuccess()),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentSuccess()),
                                  );
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      list[index].btnText as String,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
