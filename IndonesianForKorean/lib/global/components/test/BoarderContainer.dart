import '../../common/data/index/index.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  const BorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.red,
        ),
      ),
      child: child,
    );
  }
}
