import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course_app_ui/style.dart';
import 'package:online_course_app_ui/userprofile.dart';

import 'courseDetails.dart';
import 'coursemodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor0,
              backgroundColor1,
              backgroundColor2,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: SafeArea(
            child: Container(
              width: _width,
              padding: const EdgeInsets.only(
                left: 30,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const FaIcon(FontAwesomeIcons.bars, size: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const UserProfile(),
                        ),
                      );
                    },
                    child: Text(
                      "Arab Kumar",
                      style: UserStyle,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: _width,
                    margin: const EdgeInsets.only(
                      right: 30,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Search",
                          style: GoogleFonts.poppins(
                            color: Colors.grey.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        const Spacer(),
                        const FaIcon(FontAwesomeIcons.search),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Browse by Categories",
                          style: TopicStyle,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Chips(
                              topic: "Coding",
                              isSelected: true,
                            ),
                            Chips(
                              topic: "Stacks",
                              isSelected: false,
                            ),
                            Chips(
                              topic: "BackTracking",
                              isSelected: false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Chips(
                              topic: "Linked Lists",
                              isSelected: false,
                            ),
                            Chips(
                              topic: "Recursion",
                              isSelected: false,
                            ),
                            Chips(
                              topic: "11+",
                              isSelected: false,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: _height * 0.43,
                      width: _width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Popular",
                            style: TopicStyle,
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Courses(course: courseList[0]),
                                const SizedBox(height: 20),
                                Courses(course: courseList[1]),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Courses extends StatelessWidget {
  final Course course;
  const Courses({Key? key, required this.course}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => CourseDetails(
              course: course,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            height: _height * 0.17,
            width: _height * 0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(course.courseImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    course.authorImage,
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  course.courseAuthor,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              SizedBox(
                  width: _width * 0.5,
                  child: Text(
                    course.courseName,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class Chips extends StatelessWidget {
  final String topic;
  final bool isSelected;

  const Chips({Key? key, required this.topic, required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.purple.withOpacity(0.1)
            : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: Text(
        topic,
        style: GoogleFonts.poppins(
          color: isSelected
              ? Colors.purple.withOpacity(0.7)
              : Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}