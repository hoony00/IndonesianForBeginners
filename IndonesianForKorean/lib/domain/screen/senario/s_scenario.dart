import '../../../global/common/data/index/index.dart';
import '../../../global/components/app_bar/custom_app_bar.dart';
import '../../../global/global_provider/page_index_provider.dart';
import '../main/s_main.dart';

class ScenarioSelectionScreen extends ConsumerWidget {
  final scenarios = [
    {'key': 'greetings', 'title': '인사(greetings)'},
    {'key': 'food_ordering', 'title': '음식 주문(food_ordering)'},
    {'key': 'shopping', 'title': '쇼핑(shopping)'},
    {'key': 'directions', 'title': '길 찾기(directions)'},
    {'key': 'hospital', 'title': '병원 방문(hospital)'},
    {'key': 'weather', 'title': '날씨(weather)'}
  ];

  ScenarioSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'IndoKorea', isBack: false, isCenter: true),
      body: ListView.builder(
        itemCount: scenarios.length,
        itemBuilder: (context, index) {
          final scenario = scenarios[index];
          return ListTile(
            title: Text(scenario['title']!),
            onTap: () {
              ref.read(selectedScenarioProvider.notifier).update((value) => scenario['key']!);
              ref.read(pageIndexProvider.notifier).update((value) => 1);
            },
          );
        },
      ),
    );
  }
}
