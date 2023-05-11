import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/data.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 0,
        backgroundColor: themeData.colorScheme.background.withOpacity(0),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      child: Row(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Assets.img.stories.story8
                                .image(width: 84, height: 84)),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('@kiyanzade'),
                              const SizedBox(height: 4),
                              Text(
                                'Sadegh Kiyanzade',
                                style: themeData.textTheme.bodyText1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Mobile Developer',
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    color: themeData.colorScheme.primary),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 4),
                      child: Text(
                        'About me',
                        style: themeData.textTheme.headline6,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: Text(
                          'I am passionate about my work. Because I love what I do, I have a steady source of motivation that drives me to do my best. In my last job, this passion led me to challenge myself daily and learn new skills that helped me to do better work. For example, I taught myself how to use Photoshop to improve the quality of our photos and graphics. I soon became the go-to person for any design needs.'),
                    ),
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 64,
                right: 64,
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.3))
                      ],
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff2151CD),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '52',
                                style: themeData.textTheme.headline5!.copyWith(
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Post',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '250',
                              style: themeData.textTheme.headline5!.copyWith(
                                  color: themeData.colorScheme.onPrimary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Following',
                              style: themeData.textTheme.bodyText1!.copyWith(
                                  color: themeData.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4.5K',
                              style: themeData.textTheme.headline5!.copyWith(
                                  color: themeData.colorScheme.onPrimary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Followers',
                              style: themeData.textTheme.bodyText1!.copyWith(
                                  color: themeData.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        'My Posts',
                        style: themeData.textTheme.headline6,
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Assets.img.icons.grid.svg()),
                    IconButton(
                        onPressed: () {}, icon: Assets.img.icons.table.svg()),
                  ]),
                ),
                for (var i = 0; i < posts.length; i++) Post(post: posts[i]),
                const SizedBox(
                  height: 32,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
