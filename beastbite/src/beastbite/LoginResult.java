package beastbite;

public class LoginResult {
    private int userid;
    private int role;
    private String message;

    public LoginResult(int userid, int role, String message) {
        this.userid = userid;
        this.role = role;
        this.message = message;
    }

    public int getUserid() {
        return userid;
    }

    public int getRole() {
        return role;
    }

    public String getMessage() {
        return message;
    }
}
