class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder cleanIdentifier = new StringBuilder();
        Boolean upCaseNextChar = false;

        for (int i = 0; i < identifier.length(); i++) {
            char currentChar = identifier.charAt(i);

            if (currentChar == ' ') {
                cleanIdentifier.append('_');
            } else if (Character.isISOControl(currentChar)) {
                cleanIdentifier.append("CTRL");
            } else if (currentChar == '-') {
                upCaseNextChar = true;
            } else if (Character.isLetter(currentChar)
                    && (currentChar < 'α' || currentChar > 'ω')) {
                if (upCaseNextChar) {
                    currentChar = Character.toUpperCase(currentChar);
                    upCaseNextChar = false;
                }
                cleanIdentifier.append(currentChar);
            }
        }
        return cleanIdentifier.toString();
    }
}
