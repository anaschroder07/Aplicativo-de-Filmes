import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trabalho1/main.dart';

import 'avaliar.dart';

final List<String> filmes = [
  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTvfkYNcjh7mncO6XPUlv611d5yqHUkGZMjGq8PXmKzGqeyC23A",
  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQE5yMnEb0MQgXjw_a2VustPbw6LJ7wGnPo6Cx4g3uzeJyVEhXH",
  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQEuGqzqbuqNJxbBunRYMRTjFzroETQjfVTuFjX9SZ2Z8RJpoZq",
  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR49CYQ7XWOfxWvS7oEfnyzrtA4l4y9AqB7XYdvIr3SwhRfEv4y",
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS1OrTLKBY-OtpVJPYcfKHx4SkAtllloSmdhf51iB820cUmdwzb",
  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRT_19Rz8gH_okvE6ZWs0ribMr_hMa5CspEsA04V-SLhPKPDaSc",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGJmpojhOWQFz93yVXm24txNjXKQMIu60CZMep0NMb&usqp=CAE&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlv4l4a8cwicapG4q1R3syDlepV7O-7-P2VhcSgJHWYjiKgnss"
];

class Catalogo extends StatelessWidget {
  const Catalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CarouselSlider(
          items: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[0]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[1]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[2]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[3]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[4]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[5]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[7]),
            ),
          ],
          options: CarouselOptions(
              height: 200,
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              viewportFraction: 0.3,
              autoPlay: true),
        ),
        CarouselSlider(
          items: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[7]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[5]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[4]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[3]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[2]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[1]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Avaliar()));
              },
              child: Image.network(filmes[0]),
            ),
          ],
          options: CarouselOptions(
              height: 200,
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              viewportFraction: 0.3,
              autoPlay: true),
        ),
      ],
    );
  }
}
