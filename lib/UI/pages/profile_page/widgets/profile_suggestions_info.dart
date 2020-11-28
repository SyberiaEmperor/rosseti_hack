import 'package:flutter/cupertino.dart';
import 'package:rosseti/UI/app_colors.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/widgets/suggestion_item.dart';
import 'package:rosseti/models/registry_item.dart';

class ProfileSuggestionsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Container(
              color: AppColors.white,
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text("Мои предложения:",
                    style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: ResponsiveSize.width(14))),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SuggestionItem(new RegistryItem.test(1)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SuggestionItem(new RegistryItem.test(1)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SuggestionItem(new RegistryItem.test(1)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SuggestionItem(new RegistryItem.test(1)),
        ),
      ],
    );
  }
}
