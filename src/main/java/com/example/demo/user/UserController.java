package com.example.demo.user;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sun.awt.AppContext;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;
import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ServletContext appContext;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String register(Model model) {
        User user = new User();
        return "/user/kayitOl";
    }





    @RequestMapping( value = "/addAlien",method = RequestMethod.GET )
    public String addAlien()  {

        return "/user/kayitOl";
    }

    @RequestMapping( value = "/addAlien",method = RequestMethod.POST )
    public String postAlien(@RequestParam("firstname") String adi, @RequestParam("lastname") String soyad ,
                            @RequestParam("file") MultipartFile file ) throws IOException {
        User user = new User();
        user.setname(adi);
        user.setlastname(soyad);

        byte[] fileContent = file.getBytes()    ;
        user.setProfilePic(fileContent);
        userRepository.save(user);
        return "/user/kayitOl";
    }





    @RequestMapping(value = {"/lists"}, method = RequestMethod.GET)
    public ModelAndView listAlien() {

        ModelAndView model = new ModelAndView("/user/listele");

        List<User> userList= new ArrayList<>();
        userList = (List<User>) userRepository.findAll();

        model.addObject("lists", userList);
        return model;
    }





    @RequestMapping(value = {"/profile/{id}"}, method = RequestMethod.GET)
    public String addPicture(@PathVariable("id") int id, Model model) {

        User user = userRepository.findUserById(id);
        String base64Encoded="";
        byte[] encodeBase64 =   Base64.encodeBase64(user.getProfilePic());

        try {
             base64Encoded = new String(encodeBase64, "UTF-8");
            model.addAttribute("foto",base64Encoded);


        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        model.addAttribute("user",user);
        return "/user/profile";
    }





    @RequestMapping(value = {"/profile/{id}/delete"})
    public String deleteUser(@PathVariable("id") int id,Model model) {

        userRepository.deleteById(id);
        List<User> userList = new ArrayList<>();
        userList = (List<User>) userRepository.findAll();
        model.addAttribute ("lists", userList);
        return "/user/listele";
    }

}
