package com.example.demo;

import com.example.demo.user.User;
import com.example.demo.user.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;


@RunWith(SpringRunner.class)
@SpringBootTest

public class UserServiceTest {


    @Autowired(required = false)
    private UserService service;


    @Before
    public void userKayitTest()   {

        User user1 = new User();
        user1.setUsername("dilara");
        user1.setlastname("aydin");
        user1.setEmail("dilaraydin@gmail.com");
        user1.setPassword("1111");
        service.save(user1);

    }

    @Test
    public void test()   {

        User user1 = new User();
        user1.setUsername("yusuf");
        user1.setlastname("bayram");
        user1.setEmail("yusufbayram@gmail.com");
        user1.setPassword("1234");
        service.save(user1);

        User maybe = service.findByEmail("yusufbayram@gmail.com");
        assertEquals(maybe.getUsername(), user1.getUsername());

    }


}



