import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// NOTE: This type of variables are defined separately in the project.
/// Most probably at the config directory. This is just for demonstration purposes.
class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slides = <SlideInfo>[
  SlideInfo(
      'Look for food',
      'Nisi non cupidatat fugiat amet exercitation tempor. Consequat Lorem elit ipsum exercitation cupidatat reprehenderit exercitation proident consequat nostrud. Voluptate nostrud dolor ex quis nostrud nisi fugiat nostrud. Labore amet quis duis laborum proident. Cupidatat quis culpa elit sint cillum duis nisi.',
      'assets/images/1.png'),
  SlideInfo(
      'Fast shipping',
      'Laboris dolor enim sit Lorem fugiat. Esse voluptate ipsum laborum deserunt qui tempor esse consectetur labore consectetur. Cupidatat qui id quis laboris ut irure eiusmod incididunt. Culpa ullamco laboris exercitation ex ullamco cupidatat laborum. Duis ea elit quis quis deserunt sint et laborum. Elit ullamco cupidatat pariatur ipsum eu.',
      'assets/images/2.png'),
  SlideInfo(
      'Enjoy your food',
      'Aute id qui aute in velit dolor sint eiusmod tempor in nulla. Eiusmod proident aute in Lorem duis proident qui sunt ullamco incididunt labore. Nostrud aute minim nisi cillum cupidatat cupidatat eiusmod enim reprehenderit ut do duis. Do pariatur in minim anim sunt Lorem reprehenderit eu et qui. Aliquip elit elit sit enim cillum magna adipisicing. Ad adipisicing voluptate occaecat cupidatat eu pariatur qui velit do non.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final currentPage = pageViewController.page ?? 0;

      if (!endReached && currentPage >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// NOTE: This is for making sure that any type of predefined color within the device not overlap styling needed for the Intro
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () => context.pop(), child: const Text('Skip')),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                        onPressed: () => {
                              setState(() {
                                pageViewController
                                    .jumpToPage(pageViewController.initialPage);
                                endReached = false;
                              })
                            },
                        child: const Text('Start')),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

/// NOTE: This also could be well defined in a separate file at /widgets directory in a project
class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 10),
              Text(title, style: titleStyle),
              const SizedBox(height: 20),
              Text(caption, style: captionStyle),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
