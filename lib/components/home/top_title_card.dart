import 'package:e_club/components/home/home_action_item.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';

class TopTitleCard extends StatefulWidget {
  const TopTitleCard({
    super.key,
  });

  @override
  State<TopTitleCard> createState() => _TopTitleCardState();
}

class _TopTitleCardState extends State<TopTitleCard> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    void toggleMontoVisibility() {
      setState(() {
        obscureText = !obscureText;
      });
    }

    return Container(
      width: double.infinity,
      height: 350,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF00E51),
            Color(0xFFFF6720),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'GR',
                      style: TextStyle(
                          color: AppColors.redPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                'Oi, João!',
                style:
                    TextStyle(color: AppColors.backgroundColor, fontSize: 20),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  obscureText ? 'Gs. ••••••••' : 'Gs. 324.700',
                  style: TextStyle(
                    color: AppColors.backgroundColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.backgroundColor,
                ),
                onPressed: toggleMontoVisibility,
              )
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HomeActionItem(
                    imagePath: "assets/images/convertRs.png",
                    label: "Converter R\$",
                    onTap: () {},
                  ),
                  SizedBox(width: 12),
                  HomeActionItem(
                    imagePath: "assets/images/recargas.png",
                    label: "Recargas",
                    onTap: () {},
                  ),
                  SizedBox(width: 24),
                  HomeActionItem(
                    imagePath: "assets/images/creditos.png",
                    label: "Créditos",
                    onTap: () {},
                  ),
                  SizedBox(width: 12),
                  HomeActionItem(
                    imagePath: "assets/images/pagamento.png",
                    label: "Pagamentos",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
