import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/emailverified_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/isloggedin_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/login_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/logout_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/reserpassword_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/signup_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/verifyemail_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/DailyPlant/readweeklyplantdata_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/DailyPlant/updateweeklyplantdata_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/emails_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/readuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/updateuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Supporting/custom_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependecy_inection.dart' as di;
import 'firebase_options.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();

  const String clientId =
      "AVnz1ib9_LKKrRNxK0yv7Puk9KnicHjmVuvT8TrwCKh6E2Gf24ivfxh_Wq6e8coq7P5y6TPPR0orPFqv";
  const String secret =
      "ENX6gTQe-fXmam7HOVav0INWFgD_6VrGRqzu7Aj-3HRuYvl_oPfBx80WEU4qcGcQ9tmHjffmFWCBGq65";

  final String basicAuth =
      'Basic ${base64Encode(utf8.encode('$clientId:$secret'))}';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': basicAuth,
  };

  const String createPlanUrl = 'https://api.paypal.com/v1/billing/plans';

  final Map<String, dynamic> requestBodyStandard = {
    'product_id': 'STANDARD_PRODUCT_ID',
    'name': 'Standard Plan',
    'description': 'Standard Subscription Plan',
    'billing_cycles': [
      {
        'frequency': {'interval_unit': 'YEAR', 'interval_count': 1},
        'tenure_type': 'REGULAR',
        'sequence': 1,
        'total_cycles': 0,
        'pricing_scheme': {
          'fixed_price': {'value': '299', 'currency_code': 'USD'}
        }
      }
    ],
    'payment_preferences': {'auto_bill_outstanding': true}
  };

  final http.Response responseStandard = await http.post(
    Uri.parse(createPlanUrl),
    headers: headers,
    body: jsonEncode(requestBodyStandard),
  );

  print(responseStandard.body);
  print(responseStandard.statusCode);

  if (responseStandard.statusCode == 201) {
    // Standard plan created successfully
    for (int i = 0; i < 20; i++) {
      print("Sucess");
    }
    final Map<String, dynamic> responseData = jsonDecode(responseStandard.body);
    // Process the response data as needed
  } else {
    for (int i = 0; i < 20; i++) {
      print("failure");
    }
    // Handle the error
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
//UserCubits

        BlocProvider<EmailsCubit>(create: (_) => di.sl<EmailsCubit>()),

        BlocProvider<UpdateDailyPlantDataCubit>(
            create: (_) => di.sl<UpdateDailyPlantDataCubit>()),

        BlocProvider<ReadWeeklyPlantDataCubit>(
            create: (_) => di.sl<ReadWeeklyPlantDataCubit>()),

        BlocProvider<ResetPasswordCubit>(
            create: (_) => di.sl<ResetPasswordCubit>()),

        BlocProvider<ResetPasswordCubit>(
            create: (_) => di.sl<ResetPasswordCubit>()),

        BlocProvider<ReadUserCubit>(create: (_) => di.sl<ReadUserCubit>()),
        BlocProvider<UpdateUserCubit>(create: (_) => di.sl<UpdateUserCubit>()),

        //AuthCubits

        BlocProvider<VerifyEmailCubit>(
            create: (_) => di.sl<VerifyEmailCubit>()),

        BlocProvider<EmailVerifiiedCubit>(
            create: (_) => di.sl<EmailVerifiiedCubit>()),

        BlocProvider<LogInCubit>(create: (_) => di.sl<LogInCubit>()),

        BlocProvider<SignUpCubit>(create: (_) => di.sl<SignUpCubit>()),

        BlocProvider<IsLoggedInCubit>(create: (_) => di.sl<IsLoggedInCubit>()),

        BlocProvider<LogOutCubit>(create: (_) => di.sl<LogOutCubit>()),
      ],
      child: MaterialApp(
        title: 'GrowX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme:
              InputDecorationTheme(errorStyle: TextStyle(color: blue)),
          primarySwatch: themeBlue,
        ),
        home: const ImageSplashScreen(),
      ),
    );
  }
}
