import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/shape/rounded_container.dart';
import 'package:onigami/app/common/ui/x_dividerdotted.dart';
import 'package:onigami/app/common/ui/xpicture.dart';
import 'package:onigami/app/common/utils.dart';
import 'package:onigami/app/themes/theme.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(
            color: ThemeApp.neutralColor,
          ),
        ),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<User?>(
                stream: controller.userStream,
                builder: (context, AsyncSnapshot<User?> snapshot) {
                  // make condition if user is null and return loading
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: DottedBorder(
                            borderType: BorderType.Circle,
                            strokeWidth: 4,
                            strokeCap: StrokeCap.round,
                            dashPattern: const [7, 8],
                            color: ThemeApp.primaryColor,
                            padding: const EdgeInsets.all(0),
                            child: XPicture(
                              imageUrl: snapshot.data!.photoURL ?? '',
                              radiusType: RadiusType.circle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.displayName ?? '-',
                          style: TextStyle(
                            color: ThemeApp.neutralColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const XDividerDotted(),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: controller.features.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => RoundedContainer(
                    hasShadow: false,
                    hasBorder: true,
                    child: ListTile(
                      onTap: () {
                        // controller.features[index].onTap!();
                      },
                      leading: Icon(
                        controller.features[index].icon,
                        color: ThemeApp.neutralColor,
                      ),
                      title: Text(
                        controller.features[index].name!,
                        style: TextStyle(
                          color: ThemeApp.neutralColor,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(
                        MdiIcons.chevronRight,
                        color: ThemeApp.neutralColor.withOpacity(0.5),
                      ),
                    ),
                    // padding: const EdgeInsets.all(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
