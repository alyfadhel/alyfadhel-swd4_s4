class OnBoardingModel
{
  final String images;
  final String title;
  final String body;

  OnBoardingModel({
    required this.images,
    required this.title,
    required this.body,
  });
}

List<OnBoardingModel>boarding = [
  OnBoardingModel(
      images: 'assets/images/on_boarding.jpg',
      title: 'OnBoarding Title 1',
      body: 'OnBoarding Body 1',
  ),
  OnBoardingModel(
      images: 'assets/images/on_boarding.jpg',
      title: 'OnBoarding Title 2',
      body: 'OnBoarding Body 2',
  ),
  OnBoardingModel(
      images: 'assets/images/on_boarding.jpg',
      title: 'OnBoarding Title 3',
      body: 'OnBoarding Body 3',
  ),
];