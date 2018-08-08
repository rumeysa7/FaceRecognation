package com.example.demo.config;

import com.example.demo.user.User;
import com.example.demo.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email);


        Set<GrantedAuthority> grantedAuthorities = new HashSet();



        if(user.isValid()){
            grantedAuthorities.add(new SimpleGrantedAuthority( "ROLE_USER"  ));
        }
        else{
            grantedAuthorities.add(new SimpleGrantedAuthority( "ROLE_GUEST" ));
        }
        if(user.getEmail().equalsIgnoreCase("rumeysaaydin49@gmail.com")){
           grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        }

        return new org.springframework.security.core.userdetails.User(user.getEmail(),user.getPassword() , grantedAuthorities);

    }
}