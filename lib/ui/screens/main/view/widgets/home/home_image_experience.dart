part of home_pages;

class _ImageExperience extends StatelessWidget {
  final String pictureLink;
  _ImageExperience({
    required this.pictureLink,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 600,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 550,
              child: CachedNetworkImage(
                imageUrl: pictureLink,
                placeholder: (_, __) {
                  return Container();
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Spacer(),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55),
                  ),
                  // color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Experience(
                          path: AppImages.mobileDevelopment,
                          title: S.current.mobile_development,
                          padding: 10,
                        ),
                        SizedBox(width: 30),
                        _Experience(
                          path: AppImages.algorithms,
                          title: S.current.algorithms_cc,
                        ),
                        SizedBox(width: 30),
                        _Experience(
                          path: AppImages.webDevelopment,
                          title: S.current.web_development,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
