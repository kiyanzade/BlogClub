
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/gen/fonts.gen.dart';

import 'data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, Sadegh',
                        style: themeData.textTheme.subtitle1,
                      ),
                      // Image.asset(
                      //   'assets/img/icons/notification.png',
                      //   width: 32,
                      //   height: 32,
                      // ),
                      Assets.img.icons.notification
                          .image(width: 32, height: 32),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                  child: Text(
                    'Explore today`s',
                    style: themeData.textTheme.headline4,
                  ),
                ),
                _StoryList(stories: stories, themeData: themeData),
                const SizedBox(
                  height: 16,
                ),
                const _CategoryList(),
                const _PostList(),
                const SizedBox(height: 32),
              ],
            )),
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(color: Color(0xff376AED)),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return _Post(post: post);
            })
      ],
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
            blurRadius: 10,
            color: Color(0x1a5282FF),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/img/posts/small/${post.imageFileName}'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: const TextStyle(
                      fontFamily: FontFamily.avenir,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff376AED),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(post.title,
                      style: Theme.of(context).textTheme.subtitle2),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                        color: Theme.of(context).textTheme.bodyText2!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.likes,
                          style: Theme.of(context).textTheme.bodyText2),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(
                        CupertinoIcons.clock,
                        size: 16,
                        color: Theme.of(context).textTheme.bodyText2!.color,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.time,
                          style: Theme.of(context).textTheme.bodyText2),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: 16,
                            color: Theme.of(context).textTheme.bodyText2!.color,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          category: categoryList[realIndex],
        );
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8,
        aspectRatio: 1.2,
        initialPage: 0,
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        top: 100,
        right: 65,
        left: 65,
        bottom: 24,
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color(0xaa0D253C),
            )
          ]),
        ),
      ),
      Positioned.fill(
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              'assets/img/posts/large/${category.imageFileName}',
              fit: BoxFit.cover,
            ),
          ),
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
          foregroundDecoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Color(0xff0D253C),
                  Colors.transparent,
                ]),
            borderRadius: BorderRadius.circular(32),
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
      Positioned(
          bottom: 48,
          left: 42,
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Colors.white),
          ))
    ]);
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
    required this.themeData,
  });

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImagViewed() : _profileImageUnviewed(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            story.name,
          )
        ],
      ),
    );
  }

  Widget _profileImageUnviewed() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
          Color(0xff376AED),
          Color(0xff49B0E2),
          Color(0xff9CECFB),
        ]),
      ),
      child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.all(5),
          child: _profileImage()),
    );
  }

  Widget _profileImagViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: const Color(0xff7B8BB2),
        dashPattern: [5, 3],
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}
