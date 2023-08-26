import 'package:amasearch/pages/settings/faq_page/default_detail_page.dart';
import 'package:amasearch/pages/settings/faq_page/faq.dart';
import 'package:amasearch/widgets/theme_divider.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});
  static const String routeName = "/settings/faq";

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const FaqPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("よくあるご質問"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: questions.length,
      separatorBuilder: (context, index) => const ThemeDivider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(questions[index].title),
          onTap: () {
            Navigator.push(
              context,
              DefaultDetailPage.route(questions[index]),
            );
          },
        );
      },
    );
  }
}
