import 'package:q_shop/models/products.dart';

class DefaultPrefs {
    static List<Product> defProducts = [
        Product(name: "Apfel", iconCode: "0xe901", cat: "Obst"),
        Product(name: "Birne", iconCode: "0xe901", cat: "Obst"),
        Product(name: "Banane", iconCode: "0xe901", cat: "Obst"),
        Product(name: "Kirsche", iconCode: "0xe901", cat: "Obst"),
        Product(name: "Trauben", iconCode: "0xe901", cat: "Obst"),
        Product(name: "Zitrone", iconCode: "0xe901", cat: "Obst"),

        Product(name: "Tomate", iconCode: "0xe901", cat: "Gemüse"),
        Product(name: "Karotte", iconCode: "0xe901", cat: "Gemüse"),
        Product(name: "Kartoffel", iconCode: "0xe901", cat: "Gemüse"),
        Product(name: "Salat", iconCode: "0xe901", cat: "Gemüse"),

        Product(name: "Lyoner", iconCode: "0xe901", cat: "Fleisch"),
        Product(name: "Salami", iconCode: "0xe901", cat: "Fleisch"),
        Product(name: "Schinken", iconCode: "0xe901", cat: "Fleisch"),
        Product(name: "Leberwurst", iconCode: "0xe901", cat: "Fleisch"),
        Product(name: "Hühnerbrust", iconCode: "0xe901", cat: "Fleisch"),
        Product(name: "Hänchenkeule", iconCode: "0xe901", cat: "Fleisch"),
        Product(name: "Putenfilet", iconCode: "0xe901", cat: "Fleisch"),
        Product(name: "Schweinskotelett", iconCode: "0xe901", cat: "Fleisch"),

        Product(name: "Lachs", iconCode: "0xe901", cat: "Fisch"),
        Product(name: "Forelle", iconCode: "0xe901", cat: "Fisch"),

        Product(name: "Milch", iconCode: "0xe901", cat: "Milch"),
        Product(name: "Gouda", iconCode: "0xe901", cat: "Milch"),
        Product(name: "Bergkäse", iconCode: "0xe901", cat: "Milch"),

        Product(name: "Ei", iconCode: "0xe901", cat: "Ei"),
        Product(name: "Osterei", iconCode: "0xe901", cat: "Ei"),

        Product(name: "Roggenbrot", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Brötchen", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Kartoffelbrot", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Vollkornbrot", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Vollkorntoast", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Toast", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Laugenstange", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Brezel", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Baguette", iconCode: "0xe901", cat: "Backwaren"),
        Product(name: "Croissant", iconCode: "0xe901", cat: "Backwaren"),

        Product(name: "Spaghetti", iconCode: "0xe901", cat: "Nudeln"),
        Product(name: "Fussili", iconCode: "0xe901", cat: "Nudeln"),
    ];

    List<Product> getAllProducts() => defProducts;
}

