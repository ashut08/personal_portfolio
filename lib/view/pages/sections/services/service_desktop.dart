import 'package:flutter/material.dart';
import 'package:AshuTech/models/service_model.dart';
import 'package:AshuTech/provider/theme_provider.dart';
import 'package:AshuTech/utils/constant.dart';
import 'package:AshuTech/utils/service_util.dart';
import 'package:AshuTech/utils/sizeconfig.dart';
import 'package:AshuTech/view/pages/sections/services/components/service_card.dart';
import 'package:provider/provider.dart';

class ServiceDesktop extends StatelessWidget {
  const ServiceDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.screenHeight;
    var width = SizeConfig.screenWidth;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        size10,
        size10,
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Text(
                "Services".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: height! * 0.055,
                  color: themeProvider.lightTheme
                      ? Colors.black.withOpacity(0.2)
                      : Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text(
                "What I Offer",
                style: TextStyle(
                  fontSize: height * 0.032,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        size10,
        size10,
        size10,
        _buildServiceCard(ServiceUtils.serviceUtils)
      ],
    );
  }

  Widget _buildServiceCard(List<ServiceModel> serviceModel) {
    // return Wrap(
    //   direction: Axis.horizontal,
    //   alignment: WrapAlignment.center,
    //   crossAxisAlignment: WrapCrossAlignment.center,
    //   runSpacing: AppDimensions.normalize(10),
    //   children:serviceModel
    //       .map<Widget>(
    //         (
    //           e,
    //         ) =>
    //           ServiceCard(image: e)
    //       )
    //       .toList(),
    // );
    return LayoutBuilder(
      builder: (context, constraints) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: serviceModel.length,
        itemBuilder: (context, i) {
          return ServiceCard(
            image: serviceModel[i].serviceImage,
            serviceName: serviceModel[i].serviceName,
            serviceDescription: serviceModel[i].serviceDescription,
          );
        },
      ),
    );
  }
}
