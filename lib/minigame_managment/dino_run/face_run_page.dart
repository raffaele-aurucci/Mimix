import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mimix_app/minigame_managment/dino_run/face_run_game_page.dart';
import 'package:mimix_app/minigame_managment/dino_run/src/dino_run.dart';
import 'package:mimix_app/utils/view/widgets/buttons/primary_button.dart';

import 'package:mimix_app/utils/view/app_palette.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/view/app_theme.dart';
import '../../utils/view/widgets/buttons/icon_button.dart';
import '../../utils/view/widgets/texts/description_text.dart';
import '../../utils/view/widgets/texts/header_text.dart';
import '../../utils/view/widgets/alert_dialog.dart';

class FaceRunPage extends StatefulWidget {
  const FaceRunPage({super.key});

  @override
  State<FaceRunPage> createState() => _FaceBreakoutOverviewPageState();
}

class _FaceBreakoutOverviewPageState extends State<FaceRunPage> {

  // static game for adding scene
  late final DinoRun game;

  @override
  void initState() {
    super.initState();
    game = DinoRun(handleGameOver: () => {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
        appBar: AppBar(
          leading: IconButtonWidget(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 0, bottom: 40, left: 20, right: 20),
            child: Column(
                children: [
                  const HeaderText(text: 'Face Run', size: HeaderText.H3),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/emoticons/mouth_smile.png', width: 30, height: 30),
                              const SizedBox(width: 6),
                              Image.asset('assets/images/icons/up-arrow.png', width: 20, height: 20),
                              const HeaderText(text: ' Jump', size: 20.0),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Image.asset('assets/images/emoticons/mouth_open.png', width: 30, height: 30),
                              const SizedBox(width: 6),
                              Image.asset('assets/images/icons/sx-arrow.png', width: 20, height: 20),
                              const HeaderText(text: ' Super Jump', size: 20.0),
                            ],
                          )
                        ],
                      ),
                      // Right side
                      const Column(
                        children: [
                          HeaderText(text: '00000', size: HeaderText.H4),
                          DescriptionText(text: 'HI 00000', size: DescriptionText.P2)
                        ],
                      )
                    ],
                  ),

                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: PaletteColor.darkBlue, width: 2)
                      ),
                      child: GameWidget.controlled(
                        gameFactory: () => game,
                      ),
                  )),


                  const DescriptionText(
                    text: 'Face Run is a classic game where players control a character that must navigate through an endless obstacle course.',
                    size: DescriptionText.P1,
                    alignment: DescriptionText.Center,
                  ),

                  const SizedBox(height: 15),

                  PrimaryButton(
                      text: 'Play',
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const FaceRunGamePage()))
                      }
                  )
                ]
            ),
          ),
        )
      )
    );
  }
}