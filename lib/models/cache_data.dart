import 'package:equatable/equatable.dart';

class CacheData extends Equatable {
  final String now;
  final bool isSwitch;

  CacheData({
    required this.now,
    required this.isSwitch,
  });

  factory CacheData.initial(String now, bool isSwitch) {
    return CacheData(now: now, isSwitch: isSwitch);
  }

  @override
  List<Object> get props => [now, isSwitch];

  CacheData copyWith({
    String? now,
    bool? isSwitch,
  }) {
    return CacheData(
      now: now ?? this.now,
      isSwitch: isSwitch ?? this.isSwitch,
    );
  }
}
