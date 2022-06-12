import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/service_model.dart';
import 'package:personal_portfolio/provider/theme_provider.dart';
import 'package:personal_portfolio/utils/constant.dart';
import 'package:personal_portfolio/utils/service_util.dart';
import 'package:personal_portfolio/utils/sizeconfig.dart';
import 'package:personal_portfolio/view/pages/sections/services/components/service_card.dart';
import 'package:provider/provider.dart';

class ServiceTab extends StatelessWidget {
  const ServiceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
    return LayoutBuilder(
      builder: (context, constraints) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
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
