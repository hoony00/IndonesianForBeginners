import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchDropDown extends StatelessWidget {
  final List<dynamic> items;
  final String hintText;
  final void Function(String)? onChanged; // 새로운 onChanged 콜백 추가

  const CustomSearchDropDown({
    super.key,
    required this.items,
    required this.hintText,
    this.onChanged, // 새로운 onChanged 매개변수 추가
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<dynamic>.search(
      decoration: CustomDropdownDecoration(
        hintStyle: TextStyle(
          fontSize: 15.sp,
        ),
      ),
      noResultFoundText: '검색 결과가 없습니다.',
      hintText: hintText,
      items: [...items],
      excludeSelected: false,
      hideSelectedFieldWhenExpanded: true,
      onChanged: (value) {
        onChanged!(value); // 새로운 onChanged 콜백 호출
      },
    );
  }
}
