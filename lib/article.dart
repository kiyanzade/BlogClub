import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: themeData.colorScheme.primary.withOpacity(0.5),
                blurRadius: 20,
              ),
            ]),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'Like Button Clicked!');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              SizedBox(
                width: 8,
              ),
              Text(
                '1.9K',
                style: TextStyle(
                    color: themeData.colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                title: const Text('Article'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text('Four Things Every Woman Needs To Know',
                        style: themeData.textTheme.headline4),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 16),
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Assets.img.stories.story9
                            .image(width: 48, height: 48, fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reza Ahmadi',
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text('2m ago'),
                            ]),
                      ),
                      IconButton(
                        onPressed: () {
                          showSnackBar(context, 'Share Button Clicked!');
                        },
                        icon: Icon(CupertinoIcons.share),
                        color: themeData.colorScheme.primary,
                      ),
                      IconButton(
                        onPressed: () {
                          showSnackBar(context, 'Bookmark Button Clicked!');
                        },
                        icon: Icon(CupertinoIcons.bookmark),
                        color: themeData.colorScheme.primary,
                      ),
                    ]),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Assets.img.background.singlePost.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      "What it means to be a man",
                      style: themeData.textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Text(
                        'It’s not easy to be a man. Men face unique pressures and stereotypes in today’s world. There’s the clumsy, passive fool who does whatever other people tell him. Or, there’s the macho, arrogant jerk who does whatever he wants, with no thought to how his actions might impact someone else. Is this really what it means to be a man? How can masculinity be defined?  Instead of looking to the examples we find in entertainment, let’s consider the truth of God’s Word. It’s not easy to be a man. Men face unique pressures and stereotypes in today’s world. There’s the clumsy, passive fool who does whatever other people tell him. Or, there’s the macho, arrogant jerk who does whatever he wants, with no thought to how his actions might impact someone else. Is this really what it means to be a man? How can masculinity be defined?  Instead of looking to the examples we find in entertainment, let’s consider the truth of God’s WordIt’s not easy to be a man. Men face unique pressures and stereotypes in today’s world. There’s the clumsy, passive fool who does whatever other people tell him. Or, there’s the macho, arrogant jerk who does whatever he wants, with no thought to how his actions might impact someone else. Is this really what it means to be a man? How can masculinity be defined?  Instead of looking to the examples we find in entertainment, let’s consider the truth of God’s Word'),
                  )
                ]),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),
                  ])),
            ),
          )
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
