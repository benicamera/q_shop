import 'package:q_shop/models/products.dart';
import 'appicons_icons.dart';
class DefaultPrefs {
    static List<Product> defProducts = [
        Product(name: "Apfel", icon: Appicons.Apfel1, cat: "Obst"),
        Product(name: "Birne", icon: Appicons.Birne1, cat: "Obst"),
        Product(name: "Banane", icon: Appicons.Banane1, cat: "Obst"),
        Product(name: "Kirsche", icon: Appicons.K, cat: "Obst"),
        Product(name: "Trauben", icon: Appicons.Trauben1, cat: "Obst"),
        Product(name: "Zitrone", icon: Appicons.Zitrone1, cat: "Obst"),

        Product(name: "Tomate", icon: Appicons.Tomate1, cat: "Gemüse"),
        Product(name: "Karotte", icon: Appicons.Karotte1, cat: "Gemüse"),
        Product(name: "Kartoffel", icon: Appicons.Kartoffeln, cat: "Gemüse"),
        Product(name: "Salat", icon: Appicons.S, cat: "Gemüse"),

        Product(name: "Lyoner", icon: Appicons.Wurst1, cat: "Fleisch"),
        Product(name: "Salami", icon: Appicons.Wurst1, cat: "Fleisch"),
        Product(name: "Schinken", icon: Appicons.Fleisch1, cat: "Fleisch"),
        Product(name: "Leberwurst", icon: Appicons.Wurst1, cat: "Fleisch"),
        Product(name: "Hühnerbrust", icon: Appicons.Huhn1, cat: "Fleisch"),
        Product(name: "Hänchenkeule", icon: Appicons.Fleisch21, cat: "Fleisch"),
        Product(name: "Putenfilet", icon: Appicons.Huhn1, cat: "Fleisch"),
        Product(name: "Schweinskotelett", icon: Appicons.Fleisch1, cat: "Fleisch"),

        Product(name: "Lachs", icon: Appicons.Fisch1, cat: "Fisch"),
        Product(name: "Forelle", icon: Appicons.Fisch1, cat: "Fisch"),

        Product(name: "Milch", icon: Appicons.Milch1, cat: "Milch"),
        Product(name: "Gouda", icon: Appicons.Kaese1, cat: "Milch"),
        Product(name: "Bergkäse", icon: Appicons.Kaese1, cat: "Milch"),
        Product(name: "Joghurt", icon: Appicons.Joghurt, cat: "Milch"),

        Product(name: "Ei", icon: Appicons.Ei1, cat: "Ei"),
        Product(name: "Osterei", icon: Appicons.Osterei, cat: "Ei"),

        Product(name: "Mehl", icon: Appicons.Mehl1, cat: "Zutaten"),
        Product(name: "Zucker", icon: Appicons.Mehl1, cat: "Zutaten"),

        Product(name: "Roggenbrot", icon: Appicons.Brot1, cat: "Backwaren"),
        Product(name: "Brötchen", icon: Appicons.Weckle1, cat: "Backwaren"),
        Product(name: "Kartoffelbrot", icon: Appicons.Brot1, cat: "Backwaren"),
        Product(name: "Vollkornbrot", icon: Appicons.Brot1, cat: "Backwaren"),
        Product(name: "Vollkorntoast", icon: Appicons.Toast1, cat: "Backwaren"),
        Product(name: "Toast", icon: Appicons.Toast1, cat: "Backwaren"),
        Product(name: "Laugenstange", icon: Appicons.Brezel1, cat: "Backwaren"),
        Product(name: "Brezel", icon: Appicons.Brezel1, cat: "Backwaren"),
        Product(name: "Baguette", icon: Appicons.Brot1, cat: "Backwaren"),
        Product(name: "Croissant", icon: Appicons.Croissant, cat: "Backwaren"),

        Product(name: "Pizza", icon: Appicons.Pizza1, cat: "Backwaren"),

        Product(name: "Spaghetti", icon: Appicons.Nudel21, cat: "Nudeln"),
        Product(name: "Fussili", icon: Appicons.Nudel1, cat: "Nudeln"),

        Product(name: "Schokolade", icon: Appicons.Bonbon1, cat: "Süßwaren"),
        Product(name: "Kekse", icon: Appicons.Keks1, cat: "Süßwaren"),
        Product(name: "Bonbons", icon: Appicons.Bonbon1, cat: "Süßwaren"),
        Product(name: "Eis", icon: Appicons.Eis1, cat: "Süßwaren"),
        Product(name: "Wassereis", icon: Appicons.Eis21, cat: "Süßwaren"),
    ];

    List<Product> getAllProducts() => defProducts;
}

