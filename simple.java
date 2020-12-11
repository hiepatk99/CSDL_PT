import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Collections;
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

    public static void main(String arg[]) throws Exception {
        System.out.println("---------Welcome to Program!---------");
        List<simple> listData = new ArrayList<simple>();
        String cont = "y";
        Scanner input = new Scanner(System.in);
        String func;
        while (cont.toUpperCase().equals("Y")) {
            System.out.println("List Function:\n1. Add Product\n2. Show all Product\n3. Delete Product\n"
                    + "4. Edit Product\n5. Find Product\n6. Sort Product\n7. Export Data\n9. Exit");
            System.out.print("Please choose Function: ");
            func = input.nextLine();
            switch (func) {
                case "1":
                    listData = AddData(listData);
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
                case "7":
                    ExportData(listData);
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

    public static List<simple> AddData(List<simple> listProduct) {
        Scanner inputString = new Scanner(System.in);
        Scanner inputInt = new Scanner(System.in);
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
                    simple newData = new simple(newId);
                    System.out.print("Enter Name Product: ");
                    String newName = inputString.nextLine();
                    newData.pName = newName;
                    System.out.print("Enter Price Product: ");
                    int newPrice = inputInt.nextInt();
                    newData.pPrice = newPrice;
                    System.out.print("Enter Quantity Product: ");
                    int newQty = inputInt.nextInt();
                    newData.Qty = newQty;
                    listProduct.add(newData);
                    mapData.put(newId, newData);
                    System.out.println("---Add Success---");
                    System.out.println("Press y to continue insert data. Press any key to exit");
                    cont = inputString.nextLine();
                }
            } catch (Exception e) {
                System.out.println("------Insert Product - Error------\nPress any key to continue.");
                inputString.nextLine();
                return listProduct;
            }
        }

        System.out.println("------Insert Product - End------\nPress any key to continue.");
        inputString.nextLine();
        return listProduct;
    }

    public static void DisplayData(List<simple> listProduct) {
        System.out.println("------Display Product - Start------");
        if (listProduct == null || listProduct.isEmpty()) {
            System.out.println("No data in list Product");
        } else {
            System.out.println(
                    "Id\t|\tName\t|\tPrice\t|\tQuantity\n________________________________________________________________");
            for (int i = 0; i < listProduct.size(); i++) {
                simple item = new simple(listProduct.get(i));
                System.out.println(item.pId + "\t|\t" + item.pName + "\t|\t" + item.pPrice + "\t|\t" + item.Qty);
            }
        }
        System.out.println("------Display Product - End------\nPress any key to continue.");
        Scanner cont = new Scanner(System.in);
        cont.nextLine();
    }

    public static List<simple> DeleteData(List<simple> listProduct) {
        System.out.println("------Delete Product - Start------");
        Scanner input = new Scanner(System.in);
        try {
            String cont = "y";
            while (cont.toUpperCase().equals("Y")) {
                System.out.print("Enter ID Product: ");
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
                    System.out.print("No Product has ID = " + idProduct + "\n");
                }
                System.out.println("Press y to continue delete data. Press any key to exit");
                cont = input.nextLine();
            }

        } catch (Exception e) {
            System.out.println("------Delete Product - Error------\nPress any key to continue.");
            input.nextLine();
            return listProduct;
        }
        System.out.println("------Delete Product - End------\nPress any key to continue.");
        input.nextLine();
        return listProduct;
    }

    public static List<simple> EditData(List<simple> listProduct) {
        System.out.println("------Edit Product - Start------");
        Scanner inputString = new Scanner(System.in);
        Scanner inputInt = new Scanner(System.in);
        try {
            String cont = "y";
            while (cont.toUpperCase().equals("Y")) {
                System.out.println("Enter ID Product: ");
                String idProduct = inputString.nextLine();
                boolean resultFlag = false;
                for (int i = 0; i < listProduct.size(); i++) {
                    if (idProduct.equals(listProduct.get(i).pId)) {
                        System.out.print("Enter new Name Product: ");
                        String newName = inputString.nextLine();
                        listProduct.get(i).pName = newName;
                        System.out.print("Enter new Name Product: ");
                        int newPrice = inputInt.nextInt();
                        listProduct.get(i).pPrice = newPrice;
                        System.out.print("Enter new Name Product: ");
                        int newQty = inputInt.nextInt();
                        listProduct.get(i).Qty = newQty;
                        resultFlag = true;
                        System.out.println("---Edit Product Success---");
                    }
                }
                if (!resultFlag) {
                    System.out.println("No Product has ID = " + idProduct);
                }
                System.out.println("Press y to continue edit data. Press any key to exit");
                cont = inputString.nextLine();
            }
        } catch (Exception e) {
            System.out.println("------Edit Product - Error------\nPress any key to continue.");
            inputString.nextLine();
            return listProduct;
        }
        System.out.println("------Edit Product - End------\nPress any key to continue.");
        inputString.nextLine();
        return listProduct;
    }

    public static void DisplayProduct(List<simple> listProduct) {
        System.out.println("------Find Product - Start------");
        Scanner input = new Scanner(System.in);
        try {
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
        } catch (Exception e) {
            System.out.println("------Find Product - Error------\nPress any key to continue.");
            input.nextLine();
        }
        System.out.println("------Find Product - End------\nPress any key to continue.");
        input.nextLine();
    }

    public static List<simple> SortData(List<simple> listProduct) {
        for (int i = 0; i < listProduct.size() - 1; i++) {
            for (int j = i + 1; j < listProduct.size(); j++) {
                if (listProduct.get(i).pPrice > listProduct.get(j).pPrice) {
                    Collections.swap(listProduct, i, j);
                }
            }
        }
        System.out.println("------Sort Product - Success------\nPress any key to continue.");
        Scanner cont = new Scanner(System.in);
        cont.nextLine();
        return listProduct;
    }

    public static int ExportData(List<simple> listProduct) throws Exception {
        try {
            File file = new File("lolololo.txt");
            if (!file.exists()) {
                boolean isCreateSuccess = file.createNewFile();
                if (!isCreateSuccess) {
                    System.out.println("---Create file export error.---");
                    return 0;
                }
            }
            OutputStream outPut = new FileOutputStream(file);
            OutputStreamWriter writeData = new OutputStreamWriter(outPut);
            for (simple item : listProduct) {
                writeData.write(item.toString());
                writeData.write("\n");
            }
            writeData.flush();
            System.out.println("------Export Product - Success------\nPress any key to continue.");
            Scanner cont = new Scanner(System.in);
            cont.nextLine();
            return 0;
        } catch (Exception e) {
            System.out.println("------Export Product - Error-------\nPress any key to continue.");
            Scanner cont = new Scanner(System.in);
            cont.nextLine();
            return 0;
        }
    }

    public String toString() {
        return this.pId + "/" + this.pName + "/" + this.pPrice + "/" + this.Qty;

    }
}