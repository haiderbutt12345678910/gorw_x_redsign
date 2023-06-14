import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/usersubscription_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/updateuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/SubsCritionScreens/payment_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatefulWidget {
  final int id;
  const PaymentScreen({super.key, required this.id});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final emailController =
      TextEditingController(text: "dodosofttech123@gmail.com");
  final cardNumberController = TextEditingController(text: "4032030345318399");
  final cvvController = TextEditingController(text: "142");
  final expiryController = TextEditingController(text: "09/2027");
  final holderNameController = TextEditingController(text: "hAIDER aLI");
  var formKey = GlobalKey<FormState>();
  double? price;
  @override
  void dispose() {
    emailController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    holderNameController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    if (widget.id == 1) {
      price = 199.00;
    } else {
      price = 299.00;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
            child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: BlocConsumer<UpdateUserCubit, BlocStates>(
              builder: ((context, state) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('Asset/Images/b_1.jpg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(color: bluleDark.withOpacity(0.6)),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                        height: 30,
                      ),
                      Image.asset(
                        "Asset/Images/shopIcon.png",
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "PayPal is the safer,\neasier way to pay",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "No matter where you shop, we keep\nyour financial information secure",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the border radius as needed
                            border: Border.all(
                              color: Colors.white.withOpacity(
                                  .6), // Adjust the border color and opacity as needed
                              width: 2.0, // Adjust the border width as needed
                            ),
                            color: Colors.white
                                .withOpacity(0.2), // Transparent interior color
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Image.asset(
                                            "Asset/Images/paypal.png",
                                            fit: BoxFit.contain,
                                            height: 40,
                                          ),
                                        )),
                                        Expanded(
                                            child: Container(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            '\$${price?.toStringAsFixed(0)} USD',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                      height: 15,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: cardNumberController,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.credit_card,
                                      color: Colors.white,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintStyle: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    hintText: "Enter Card Number"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    controller: expiryController,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.date_range,
                                          color: Colors.white,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        hintStyle: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                        hintText: "Enter Expiry Date"),
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    controller: cvvController,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.password,
                                          color: Colors.white,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 1, color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        hintStyle: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                        hintText: "Enter CVV"),
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: holderNameController,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintStyle: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    hintText: "Enter Cardholder Name"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
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
                                    submit(context);
                                  },
                                  child: const Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Pay Now',
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
                      Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom + 20),
                        child: const Text(
                          'Powered By GrowX A.I',
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }), listener: (ctx, state) {
            if (state is Sucessfull) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 1),
                content: Text("Operation Sucess"),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PaymentSuccess()),
              );
            }

            if (state is Failure) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 2),
                content: Text("Some Error Occured! Try Again"),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }),
        )));
  }

  void submit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      UserEntity userEntity = UserEntity(
          usersubscriptionEntity: UsersubscriptionEntity(
              exprityDate: "22", planId: "23", planName: "B"));
      BlocProvider.of<UpdateUserCubit>(context)
          .updateUserEntity(userEntity, null);
    } else {
      return;
    }
  }
}
