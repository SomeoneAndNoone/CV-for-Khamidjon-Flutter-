part of home_pages;

class _SkillDescription extends StatelessWidget {
  final String description;

  _SkillDescription({
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 24.h),
        Text(
          S.current.flutter_developer,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          width: 450.w,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
