import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inde/global/common/data/index/index.dart';
import 'package:inde/global/components/utill/w_height_and_width.dart';
import '../screen/content/s_content.dart';

class TtsControls extends ConsumerWidget {
  const TtsControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speechRate = ref.watch(speechRateProvider);
    final pitch = ref.watch(pitchProvider);
    final isSpeaking = ref.watch(speakingStateProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '말하기 속도',
                    style: TextStyle(fontSize: 16.sp, color: AppColor.white),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Slider(
                  value: speechRate,
                  min: 0.1,
                  max: 0.7, // 최대값을 0.7로 설정
                  inactiveColor: AppColor.white.withOpacity(0.5),
                  activeColor: AppColor.hufsGreen,
                  divisions: 6, // 0.1 단위로 조절 가능
                  label: speechRate.toStringAsFixed(1),
                  onChanged: (value) {
                    ref.read(speechRateProvider.notifier).update((state) => value);
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '음성 높이',
                    style: TextStyle(fontSize: 16.sp, color: AppColor.white),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Slider(
                  value: pitch,
                  min: 0.5,
                  max: 1.6, // 최대값을 1.6으로 설정
                  inactiveColor: AppColor.white.withOpacity(0.5),
                  activeColor: AppColor.hufsSilver,
                  divisions: 11, // 0.1 단위로 조절 가능
                  label: pitch.toStringAsFixed(2),
                  onChanged: (value) {
                    ref.read(pitchProvider.notifier).update((state) => value);
                  },
                ),
              ),
            ],
          ),
          Height(10.h),
        ],
      ),
    );
  }
}
