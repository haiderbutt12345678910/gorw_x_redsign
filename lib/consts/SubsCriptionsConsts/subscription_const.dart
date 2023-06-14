import 'package:flutter_application_growx_new_design/consts/SubsCriptionsConsts/subscription_features.dart';

class SubscriptionList {
  final String? planName;
  final String? planPrice;
  final String? btnText;
  final List<SubsCriptionFeatures>? subscriptionFeatures;

  const SubscriptionList(
      {this.planName, this.planPrice, this.subscriptionFeatures, this.btnText});
}
