class MicroBlog {
    public String truncate(String input) {
        // var cp = Math.min(input.codePointCount(0, input.length()), 5);
        var cp = Math.min(5, input.codePoints().count());
        StringBuilder sb = new StringBuilder();

        int charCount = 0;
        int counter = 0;
        // while (counter < cp) {
        for (int i = 0; i < cp; i++) {
            sb.appendCodePoint(input.codePointAt(charCount));
            counter += 1;
            charCount += Character.charCount(input.codePointAt(charCount));

        }
        
        return sb.toString();
    }
}
