package com.example.demo.user;

import javax.persistence.*;
import java.util.Arrays;


@Entity
@Table(name = "Alien")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id;
    private String name;
    private  String lastname;
    private String email;
    private String actCode;
    private boolean valid = false;


    @Lob
    private byte[] profilePic;

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getlastname() {
        return lastname;
    }

    public void setlastname(String lastname) {
        this.lastname = lastname;
    }

    public int getid() {
        return id;
    }

    public void setid(int id) {
        this.id = id;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }

    public byte[] getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    public String getActCode() { return actCode; }

    public void setActCode(String actCode) { this.actCode = actCode; }

    public boolean isValid() { return valid; }

    public void setValid(boolean valid) { this.valid = valid; }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", lastname='" + lastname + '\'' +
                ", email='" + email + '\'' +
                ", actCode='" + actCode + '\'' +
                ", valid=" + valid +
                ", profilePic=" + Arrays.toString(profilePic) +
                '}';
    }
}
