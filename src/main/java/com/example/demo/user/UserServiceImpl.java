package com.example.demo.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    /*@Autowired
    private RoleRepository roleRepository;*/

    @SuppressWarnings("unchecked")
    public void save(User user) {
        user.setPassword(user.getPassword());
       // user.setRoles(new HashSet(roleRepository.findAll()));
        userRepository.save(user);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}