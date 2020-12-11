import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

public class simple {
    private String pId;
    private String pName;
    private Integer pPrice;
    private Integer Qty;

    public simple(String id) {
        this.pId = id;
    }

    public simple(simple item) {
        this.pId = item.pId;
        this.pName = item.pName;
        this.pPrice = item.pPrice;
        this.Qty = item.Qty;
    }

    public static void main(String arg[]) {
        System.out.println("---------Welcome to Program!---------");
        List<simple> listData = new ArrayList();
        String cont = "y";
        Scanner input = new Scanner(System.in);
        while (cont.toUpperCase().equals("Y")) {
            System.out.println("List Function:\n1. Add Product\n2. Show all Product\n3. Delete Product\n"
                    + "4. Edit Product\n5.Find Product\n6. Sort Product\n9. Exit\nPlease choose function: ");
            String func = input.nextLine();
            switch (func) {
                case "1":
                    listData = AddData(listData, input);
                    break;
                case "2":
                    DisplayData(listData);
                    break;
                case "3":
                    listData = DeleteData(listData);
                    break;
                case "4":
                    listData = EditData(listData);
                    break;
                case "5":
                    DisplayProduct(listData);
                    break;
                case "6":
                    listData = SortData(listData);
                    break;
                case "9":
                    cont = "";
                    break;
                default:
                    System.out.println("Please choose correct function.");
                    break;
            }
        }
        input.close();
        System.out.println("---------Program End---------");
    }

    public static List<simple> AddData(List<simple> listProduct, Scanner input) {
        if (listProduct.size() == 30) {
            System.out.println("List Data has 30 Products.");
        } else {
            System.out.println("------Insert Product - Start------");
            String cont = "y";
            try {
                Map<String, simple> mapData = new HashMap<>();
                for (int i = 0; i < listProduct.size(); i++) {
                    mapData.put(listProduct.get(i).pId, listProduct.get(i));
                }
                while (cont.toUpperCase().equals("Y")) {
                    Random Rand = new Random();
                    String newId = "0";
                    while (mapData.containsKey(newId)) {
                        newId = Integer.toString(Rand.nextInt(50));
                    }
                    Scanner inputData = new Scanner(System.in);
                    simple newData = new simple(newId);
                    System.out.println("Enter Name Product: ");
                    String newName = inputData.nextLine();
                    newData.pName = newName;
                    System.out.println("Enter Price Product: ");
                    int newPrice = inputData.nextInt();
                    newData.pPrice = newPrice;
                    System.out.println("Enter Quantity Product: ");
                    int newQty = inputData.nextInt();
                    newData.Qty = newQty;
                    listProduct.add(newData);
                    mapData.put(newId, newData);
                    inputData.close();
                    System.out.println("---Add Success---");
                    System.out.println("Press y to continue insert data. Press any key to exit");
                    cont = inputData.nextLine();
                }
            } catch (Exception e) {
                System.out.println("------Insert Product - Error------");
                return listProduct;
            }
        }

        System.out.println("------Insert Product - End------");
        return listProduct;
    }

    public static void DisplayData(List<simple> listProduct) {
        System.out.println("------Display Product - Start------");
        if (listProduct == null || listProduct.isEmpty()) {
            System.out.println("No data in list Product");
        } else {
            System.out.println("Id\t\tName\t\tPrice\t\tQuantity");
            for (int i = 0; i < listProduct.size(); i++) {
                simple item = new simple(listProduct.get(i));
                System.out.println(item.pId + "\t\t" + item.pName + "\t\t" + item.pPrice + "\t\t" + item.Qty);
            }
        }
        System.out.println("------Display Product - End------");
    }

    public static List<simple> DeleteData(List<simple> listProduct) {
        System.out.println("------Delete Product - Start------");
        try {
            Scanner input = new Scanner(System.in);
            String cont = "y";
            while (cont.toUpperCase().equals("Y")) {
                System.out.println("Enter ID Product: ");
                String idProduct = input.nextLine();
                boolean resultFlag = false;
                for (int i = 0; i < listProduct.size(); i++) {
                    if (idProduct.equals(listProduct.get(i).pId)) {
                        listProduct.remove(i);
                        resultFlag = true;
                        System.out.println("---Delete Success---");
                    }
                }
                if (!resultFlag) {
                    System.out.println("No Product has ID = " + idProduct);
                }
                System.out.println("Press y to continue delete data. Press any key to exit");
                cont = input.nextLine();
            }

            input.close();
        } catch (Exception e) {
            System.out.println("------Delete Product - Error------");
            return listProduct;
        }
        System.out.println("------Delete Product - End------");
        return listProduct;
    }

    public static List<simple> EditData(List<simple> listProduct) {
        System.out.println("------Edit Product - Start------");
        try {
            Scanner input = new Scanner(System.in);
            String cont = "y";
            while (cont.toUpperCase().equals("Y")) {
                System.out.println("Enter ID Product: ");
                String idProduct = input.nextLine();
                boolean resultFlag = false;
                for (int i = 0; i < listProduct.size(); i++) {
                    if (idProduct.equals(listProduct.get(i).pId)) {
                        System.out.println("Enter new Name Product: ");
                        String newName = input.nextLine();
                        listProduct.get(i).pName = newName;
                        System.out.println("Enter new Name Product: ");
                        int newPrice = input.nextInt();
                        listProduct.get(i).pPrice = newPrice;
                        System.out.println("Enter new Name Product: ");
                        int newQty = input.nextInt();
                        listProduct.get(i).Qty = newQty;
                        resultFlag = true;
                        System.out.println("---Edit Product Success---");
                    }
                }
                if (!resultFlag) {
                    System.out.println("No Product has ID = " + idProduct);
                }
                System.out.println("Press y to continue edit data. Press any key to exit");
                cont = input.nextLine();
            }
            input.close();
        } catch (Exception e) {
            System.out.println("------Edit Product - Error------");
            return listProduct;
        }
        System.out.println("------Edit Product - End------");
        return listProduct;
    }

    public static void DisplayProduct(List<simple> listProduct) {
        System.out.println("------Find Product - Start------");
        try {
            Scanner input = new Scanner(System.in);
            String cont = "y";
            while (cont.toUpperCase().equals("Y")) {
                System.out.println("Enter Product Name: ");
                String nameProduct = input.nextLine();
                boolean resultFlag = false;
                for (int i = 0; i < listProduct.size(); i++) {
                    if (nameProduct.equals(listProduct.get(i).pName)) {
                        System.out.println("ID: " + listProduct.get(i).pId);
                        System.out.println("Name: " + listProduct.get(i).pName);
                        System.out.println("Price: " + listProduct.get(i).pPrice);
                        System.out.println("Quantity: " + listProduct.get(i).Qty);
                        resultFlag = true;
                    }
                }
                if (!resultFlag) {
                    System.out.println("No Product has name = " + nameProduct);
                }
                System.out.println("Press y to continue show data. Press any key to exit");
                cont = input.nextLine();
            }
            input.close();
        } catch (Exception e) {
            System.out.println("------Find Product - Error------");
        }
        System.out.println("------Find Product - End------");
    }

    public static List<simple> SortData(List<simple> listProduct) {
        System.out.println("------Sort Product - Start------");
        for (int i = 0; i < listProduct.size() - 1; i++) {
            for (int j = i + 1; j < listProduct.size(); j++) {
                if (listProduct.get(i).Qty > listProduct.get(i).Qty) {
                    Swap(listProduct.get(i), listProduct.get(j));
                }
            }
        }
        System.out.println("------Sort Product - End------");
        return listProduct;
    }

    public static void Swap(simple p1, simple p2) {
        simple temp = new simple(p1);
        p2 = temp;
        temp = p1;
    }
}