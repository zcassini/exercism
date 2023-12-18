
class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public int[] getLastWeek() {
        return birdsPerDay;
    }

    public int getToday() {
        return birdsPerDay[birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        birdsPerDay[birdsPerDay.length -1] += 1;
    }

    public boolean hasDayWithoutBirds() {
       for (int birds : birdsPerDay)
        if (birds == 0) return true;
        
       return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        if (numberOfDays > birdsPerDay.length) numberOfDays = birdsPerDay.length;
        int sum = 0;

        for (int i = 0; i < numberOfDays; i++) sum += birdsPerDay[i];
        
        return sum;
    }

    public int getBusyDays() {
        int count = 0;
        for (int birds : birdsPerDay) if (birds >= 5) count += 1;
        return count;
    }
}
