import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

public class simple {
    private String pId;
    private String pName;
    private Integer pPrice;
    private Integer Qty;

    public simeple() {
    }

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
        System.out.println("Hello");
    }

    public List<simple> AddData(List<simple> listProduct) {
        if (listProduct == 30) {
            System.out.println("List Data has 30 Products.");
        } else {
            System.out.println("------Insert Product - Start------");
            String cont = "y";
            Scanner input = new Scanner(System.in);
            Map<String, simple> mapData = new Map();
            for (int i = 0; i < listProduct.size(); i++) {
                mapData.put(listProduct.get(i).pId, listProduct.get(i));
            }
            while (cont.equals("y")) {
                Random Rand = new Random();
                String newId = "0";
                while (mapData.containsKey(newId)) {
                    newId = Integer.toString(Rand.nextInt(50));
                }
                simple newData = new simple(newId);
                System.out.println("Enter new Name Product: ");
                String newName = input.nextLine();
                newData.pName = newName;
                System.out.println("Enter new Name Product: ");
                int newPrice = input.nextInt();
                newData.pPrice = newPrice;
                System.out.println("Enter new Name Product: ");
                int newQty = input.nextInt();
                newData.Qty = newQty;
                listProduct.add(newData);
                mapData.put(newId, newData);
                System.out.println("---Add Success---");
                System.out.println("Press y to continue. Press any key to exit");
            }
        }
        System.out.println("------Insert Product - End------");
        return listProduct;
    }

    public void DisplayData(List<simple> listProduct) {
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

    public List<simple> DeleteData(List<simple> listProduct) {
        System.out.println("------Delete Product - Start------");
        try {
            Scanner input = new Scanner(System.in);
            System.out.println("Enter ID Product: ");
            String idProduct = input.nextLine();
            boolean resultFlag = false;
            for (int i = 0; i < listProduct.size(); i++) {
                if (idProduct.equals(listProduct.get(i).pId)) {
                    listProduct.remove(i);
                    resultFlag = true;
                }
            }
            if (!resultFlag) {
                System.out.println("No Product has ID = " + idProduct);
            }

            input.close();
        } catch (Exception e) {
            System.out.println("------Delete Product - Error------");
        }
        System.out.println("------Delete Product - End------");
        return listProduct;
    }

    public List<simple> EditData(List<simple> listProduct) {
        System.out.println("------Edit Product - Start------");
        try {
            Scanner input = new Scanner(System.in);
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
                }
            }
            if (!resultFlag) {
                System.out.println("No Product has ID = " + idProduct);
            }
            input.close();
        } catch (Exception e) {
            System.out.println("------Edit Product - Error------");
        }
        System.out.println("------Edit Product - End------");
        return listProduct;
    }

    public void DisplayProduct(List<simple> listProduct) {
        System.out.println("------Find Product - Start------");
        try {
            System.out.println("Enter Product Name: ");
            Scanner input = new Scanner(System.in);
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
            input.close();
        } catch (Exception e) {
            System.out.println("------Find Product - Error------");
        }
        System.out.println("------Find Product - End------");
    }

    public List<simple> SortData(List<simple> listProduct) {
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

    public void Swap(simple p1, simple p2) {
        simple temp = new simple(p1);
        p2 = temp;
        temp = p1;
    }
}