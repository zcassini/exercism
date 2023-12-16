public class ElonsToyCar {
    private int totalDistanceDriven = 0;
    private int remainingCharge = 100;

    public static ElonsToyCar buy() {
        return new ElonsToyCar();
    }

    public String distanceDisplay() {
        return String.format("Driven %s meters", totalDistanceDriven);
    }

    public String batteryDisplay() {
        if (remainingCharge <= 0) return "Battery empty";
        return String.format("Battery at %d%%", remainingCharge);
    }

    public void drive() {
        if (remainingCharge > 0) {
             totalDistanceDriven += 20;
             remainingCharge -= 1;
        }
    }
}
