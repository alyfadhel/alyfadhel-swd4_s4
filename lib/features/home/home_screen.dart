import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: Text(
          'First App',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: clickSearch,
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Edit');
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(
          20.0,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                   Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0,),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/on_boarding.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 10.0
                      ),
                      child: Text(
                        'Flowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0,),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/on_boarding.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0
                      ),
                      child: Text(
                        'Flowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0,),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/on_boarding.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0
                      ),
                      child: Text(
                        'Flowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0,),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/on_boarding.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0
                      ),
                      child: Text(
                        'Flowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0,),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/on_boarding.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0
                      ),
                      child: Text(
                        'Flowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0,),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/on_boarding.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0
                      ),
                      child: Text(
                        'Flowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0,),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Image(
                      height: 300.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/on_boarding.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .6,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0
                      ),
                      child: Text(
                        'Flowers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void clickSearch() {
  print('Click Search');
}
