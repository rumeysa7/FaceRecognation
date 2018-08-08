package com.example.demo.user;


public interface UserService {

    void save(User user);

    User findByEmail(String email);
}
