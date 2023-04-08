# wire_apps_test

## Product Listing and Shopping Cart Application
This is a Flutter mobile application that displays a list of products and allows the user to add products to a shopping cart.

## Design Decisions
* Stateful Widget: The ProductList widget is implemented as a stateful widget because it needs to fetch data from a remote API and update its UI accordingly.
* Future Builder: The FutureBuilder widget is used to asynchronously fetch and display product data from the remote API. It allows the app to display a loading spinner while the data is being fetched and display an error message if the fetch operation fails.
* Scoped Model: The shopping cart data is managed using a scoped model. This allows the shopping cart data to be updated from any screen in the application.
* UI Design: The user interface design is kept simple and minimalistic, with a focus on usability and readability. The product list is displayed in a ListView widget, and each product is displayed as a cardView with an image, title and price. The shopping cart page displays a list of products in the cart, along with a total price.

## Steps to Build the Application
1. Create a new Flutter project.
2. Implement the Product model class to represent a product.
3. Implement the ProductService class to fetch product data from a remote API.
4. Implement the ProductList widget to display a list of products using the FutureBuilder widget.
5. Implement the ProductDetails widget to display detailed information about a selected product.
6. Implement the shopping cart functionality using a scoped model.
7. Implement the Cart widget to display the list of products in the shopping cart.
8. Implement the CartButton widget to display a button that navigates to the Cart widget.
9. Update the UI design to improve usability and readability.
10. Test the application thoroughly and fix any issues that are found.


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
