import 'package:flutter/material.dart';
import 'package:mimix_app/utils/view/widgets/texts/card_title_text.dart';

class HomePageCard extends StatelessWidget {
  final String title;
  final Widget image;
  final VoidCallback onTap;

  const HomePageCard({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20), // Add horizontal margin to the card

      // GestureDetector is a fundamental tool for making widgets interactive and responding to gestures without
      // using predefined widgets such as buttons.
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: const Color(0xFFEAFAFE),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spazio tra le due colonne
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardTitleText(text: title, size: CardTitleText.H5),
                    ],
                  ),
                ),
                Container(
                    width: 70,
                    height: 80,
                    child: image
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  CREATION EXAMPLE
//  HomePageCard(
//               title: 'Card title',
//               image: Image.asset('assets/images/image.png'),
//               onPressed: () => print('Home Card Tapped!'),
//             ),

// This snippet of code creates a home-page card with a text in the left side and an image in the right side.
// When the card is pressed, a message is printed.
// In this case, you can provide at the class different type of image source (also by network) because
// the variable that manages the image is Widget type.