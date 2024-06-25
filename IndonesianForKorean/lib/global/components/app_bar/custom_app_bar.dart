import 'package:inde/domain/model/enum/view_enum.dart';

import '../../../domain/screen/main/s_main.dart';
import '../../common/data/index/index.dart';
import '../../global_provider/page_index_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.isBack = false,
      this.isCenter = false,
      });
  final String title;
  final bool isBack;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBack
          ? Consumer(builder: (context, ref, child) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  final pageIndex = ref.read(pageIndexProvider);
                  switch (pageIndex) {
                    case 0:
                      break;
                    case 1:
                      ref.read(selectedChapterProvider.notifier).update((value) => null);
                      ref.read(pageIndexProvider.notifier).update((value) => 0);
                      break;
                    case 2:
                      ref.read(selectedChapterProvider.notifier).update((value) => null);
                      ref.read(pageIndexProvider.notifier).update((value) => 1);
                      break;
                    default:
                      ref.read(pageIndexProvider.notifier).update((value) => 0);
                  }
                                  }
              );
            })
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
      ).pOnly(left: 8.w),
      centerTitle: isCenter,
      automaticallyImplyLeading: isBack,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
