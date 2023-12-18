public class Lasagna {
    public static int expectedMinutesInOven() {
        return 40;
    }
    
    public static int remainingMinutesInOven(int actualMinutes) {
        return expectedMinutesInOven() - actualMinutes;
    }

    public static int  preparationTimeInMinutes(int layers) {
        return 2 * layers;
    }

    public static int totalTimeInMinutes(int layers, int actualMinutes) {
        return preparationTimeInMinutes(layers) + actualMinutes;
    }
}
