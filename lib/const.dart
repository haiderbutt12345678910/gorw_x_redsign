import 'package:flutter_application_growx_new_design/consts/SubsCriptionsConsts/subscription_const.dart';
import 'package:flutter_application_growx_new_design/consts/SubsCriptionsConsts/subscription_features.dart';

const subscriptionDataList = [
  SubscriptionList(
      planName: "Basic",
      planPrice: "Free",
      btnText: "Start Growing",
      subscriptionFeatures: [
        SubsCriptionFeatures(
          feature: "Free Trial",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "All vedios",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Plant Log",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Plant Care",
          isAvailaible: false,
        ),
        SubsCriptionFeatures(
          feature: "Tech Care",
          isAvailaible: false,
        ),
        SubsCriptionFeatures(
          feature: "Scheduling",
          isAvailaible: false,
        ),
        SubsCriptionFeatures(
          feature: "Email",
          isAvailaible: false,
        ),
        SubsCriptionFeatures(
          feature: "Live Chat",
          isAvailaible: false,
        ),
        SubsCriptionFeatures(
          feature: "Video Consultancy",
          isAvailaible: false,
        ),
      ]),
  SubscriptionList(
      btnText: "Buy Now",
      planName: "Standard",
      planPrice: "\$199/Year",
      subscriptionFeatures: [
        SubsCriptionFeatures(
          feature: "All Vedios",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Plant Log",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Plant Care",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Tech Care",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Scheduling",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Email",
          isAvailaible: false,
        ),
        SubsCriptionFeatures(
          feature: "Live Chat",
          isAvailaible: false,
        ),
        SubsCriptionFeatures(
          feature: "Video Consultancy",
          isAvailaible: false,
        ),
      ]),
  SubscriptionList(
      btnText: "Buy Now",
      planName: "Premium",
      planPrice: "\$299/Year",
      subscriptionFeatures: [
        SubsCriptionFeatures(
          feature: "All Vedios",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Plant Log",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Technician On Demand",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "4 Calls",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Emails",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Live Chats",
          isAvailaible: true,
        ),
        SubsCriptionFeatures(
          feature: "Video Consultancy",
          isAvailaible: true,
        ),
      ]),
];
