import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screen/screen.dart';
import '../user/address/address.dart';
import 'component/order_summary.dart';
import 'component/top_bar.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: const OrderAppBar(),
      body: cart.itemCount == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No items in the cart',style:  GoogleFonts.roboto(fontSize : 17,)),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContainerPage(), // Replace with your home screen widget
                        ),
                      );
                      Provider.of<NavigationProvider>(context,
                          listen: false)
                      .setIndex(0);
                    },
                    child: const Text(
                      'Shop Now',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, i) => CartItemWidget(
                      id: cartItems[i].id,
                      name: cartItems[i].name,
                      quantity: cartItems[i].quantity,
                      price: cartItems[i].price,
                      imagePath: cartItems[i].imagePath,
                      productId: cart.items.keys.toList()[i],
                    ),
                  ),
                ),
                OrderSummary(
                  totalAmount: cart.totalAmount,
                  onOrderNow: () {
                     Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContainerPage(), // Replace with your home screen widget
                        ),
                      );
                  },
                ),
              ],
            ),
    );
  }
}
