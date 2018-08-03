package com.example.demo.config;

import com.example.demo.user.User;
import com.example.demo.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
            grantedAuthorities.add(new SimpleGrantedAuthority( "ROLE_ADMIN"  ));
        }
        else{
            grantedAuthorities.add(new SimpleGrantedAuthority( "ROLE_USER"  ));
        }
        if(user.getEmail()=="rumeysaaydin49@gmail.com"&& user.getPassword()=="123456"){
            grantedAuthorities .add(new SimpleGrantedAuthority("ROLE_YONETICI"));
        }

        return new org.springframework.security.core.userdetails.User(user.getEmail(),user.getPassword() , grantedAuthorities);

    }
}