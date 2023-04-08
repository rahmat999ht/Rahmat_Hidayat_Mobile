import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin ImageState {
  TextButton imageEmpty(dynamic getImg) {
    return TextButton(
      onPressed: () async => await getImg(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.photo_camera,
            size: 60,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Tambahkan Foto',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget imageUpdateProfilEmpty(String image, dynamic getImage) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        InkWell(
          onTap: () async => await getImage(),
          //go to camera
          child: Image.asset(
            'assets/icons/camera02.png',
            height: 40,
          ),
        ),
      ],
    );
  }

  Widget imageUpdateProfilSucces(List<XFile> state, dynamic getImage) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.file(
            File(state.first.path),
            fit: BoxFit.cover,
            height: 120,
            width: 120,
          ),
        ),
        InkWell(
          onTap: () async => await getImage(),
          //go to camera
          child: Image.asset(
            'assets/icons/camera02.png',
            height: 40,
          ),
        ),
      ],
    );
  }

  Widget imageSuccess(List<XFile> state, void Function(int) removeImage) {
    return Container(
      height: 108,
      width: double.infinity,
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        reverse: false,
        scrollDirection: Axis.horizontal,
        itemCount: state.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(state[index].path),
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  removeImage(index);
                },
                child: const Icon(Icons.cancel),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 12,
          );
        },
      ),
    );
  }
}
