// To parse this JSON data, do
//
//     final supermarketSales = supermarketSalesFromJson(jsonString);

import 'dart:convert';

List<SupermarketSales> supermarketSalesFromJson(String str) => List<SupermarketSales>.from(json.decode(str).map((x) => SupermarketSales.fromJson(x)));

String supermarketSalesToJson(List<SupermarketSales> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupermarketSales {
    String invoiceId;
    String branch;
    String city;
    String customerType;
    String gender;
    String productLine;
    double unitPrice;
    int quantity;
    double tax5;
    double total;
    String date;
    String time;
    String payment;
    double cogs;
    double grossMarginPercentage;
    double grossIncome;
    double rating;

    SupermarketSales({
        required this.invoiceId,
        required this.branch,
        required this.city,
        required this.customerType,
        required this.gender,
        required this.productLine,
        required this.unitPrice,
        required this.quantity,
        required this.tax5,
        required this.total,
        required this.date,
        required this.time,
        required this.payment,
        required this.cogs,
        required this.grossMarginPercentage,
        required this.grossIncome,
        required this.rating,
    });

    factory SupermarketSales.fromJson(Map<String, dynamic> json) => SupermarketSales(
        invoiceId: json["Invoice ID"],
        branch: json["Branch"],
        city: json["City"],
        customerType: json["Customer type"],
        gender: json["Gender"],
        productLine: json["Product line"],
        unitPrice: json["Unit price"]?.toDouble(),
        quantity: json["Quantity"],
        tax5: json["Tax 5%"]?.toDouble(),
        total: json["Total"]?.toDouble(),
        date: json["Date"],
        time: json["Time"],
        payment: json["Payment"],
        cogs: json["cogs"]?.toDouble(),
        grossMarginPercentage: json["gross margin percentage"]?.toDouble(),
        grossIncome: json["gross income"]?.toDouble(),
        rating: json["Rating"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "Invoice ID": invoiceId,
        "Branch": branch,
        "City": city,
        "Customer type": customerType,
        "Gender": gender,
        "Product line": productLine,
        "Unit price": unitPrice,
        "Quantity": quantity,
        "Tax 5%": tax5,
        "Total": total,
        "Date": date,
        "Time": time,
        "Payment": payment,
        "cogs": cogs,
        "gross margin percentage": grossMarginPercentage,
        "gross income": grossIncome,
        "Rating": rating,
    };
}
