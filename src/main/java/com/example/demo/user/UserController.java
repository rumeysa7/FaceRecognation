package com.example.demo.user;

import com.example.demo.util.EmailUtil;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletContext;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;


import java.util.Properties;
import java.util.UUID;
import javax.mail.Session;



@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ServletContext appContext;

    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public String register(Model model) {
        User user = new User();
        return "/user/anaSayfa";
    }


    @RequestMapping(value = "/addAlien", method = RequestMethod.GET)
    public String addAlien() {
        return "/user/kayitOl";
    }

    @RequestMapping(value = "/addAlien", method = RequestMethod.POST)
    public String postAlien(@RequestParam("firstname") String adi,
                            @RequestParam("lastname") String soyad,
                            @RequestParam("email") String mail,
                            @RequestParam("password") String sifre,
                            @RequestParam("file") MultipartFile file) throws IOException {


        //UUID Universally Unique Identifier kelimelerinin kısaltmasıdır. Evrensel benzersiz tanımlayıcı anlamına gelmektedir.
        //UUID'ler de bir çeşit random sayı üreteci sayılabilir. Bir UUID 36 karakter uzunluğundadır.
        String temprorayUUID;
        temprorayUUID = UUID.randomUUID().toString();

        User user = new User();
        user.setUsername(adi);
        user.setlastname(soyad);
        user.setActCode(temprorayUUID);
        user.setEmail(mail);
        user.setPassword(sifre);

        byte[] fileContent = file.getBytes();
        user.setProfilePic(fileContent);

        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder() ;
        String encodePass = passwordEncoder.encode(user.getPassword());
    user.setPassword(encodePass);

        userRepository.save(user);

        String emailID = mail;


        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true");


        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ruka.testind@gmail.com", "163311022");
            }
        };
        Session session = Session.getInstance(props, auth);

        EmailUtil.sendEmail(session, emailID, "Aktivasyon Kodu",
                "Hesabınızın aktifleştirilmesi için bu linke " +
                        "tıklayınız:http://www.localhost:1111/orders?actCode="+temprorayUUID);


        return "/user/kayitOl";
    }





    @RequestMapping(value = {"/lists"}, method = RequestMethod.GET)
    public ModelAndView listAlien() {

        ModelAndView model = new ModelAndView("/user/listele");

        List<User> userList = new ArrayList<>();
        userList = (List<User>) userRepository.findAll();

        model.addObject("lists", userList);
        return model;
    }





    @RequestMapping(value = {"/profile/{id}"}, method = RequestMethod.GET)
    public String addPicture(@PathVariable("id") int id, Model model) {

        User user = userRepository.findUserById(id);
        String base64Encoded = "";
        byte[] encodeBase64 = Base64.encodeBase64(user.getProfilePic());

        try {
            base64Encoded = new String(encodeBase64, "UTF-8");
            model.addAttribute("foto", base64Encoded);


        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        model.addAttribute("user", user);
        return "/user/profile";
    }





    @RequestMapping(value = {"/profile/{id}/delete"})
    public String deleteUser(@PathVariable("id") int id, Model model) {

        userRepository.deleteById(id);
        List<User> userList = new ArrayList<>();
        userList = (List<User>) userRepository.findAll();
        model.addAttribute("lists", userList);
        return "/user/listele";
    }


    //http://www.localhost:1111/orders?actCode=7d0e5460-222f-412e-8fe3-4a1eec5bf31e
    @RequestMapping(value = {"/orders"} , method = RequestMethod.GET)
    public String code(@RequestParam("actCode") String active) {

            User a= new User();

            a = userRepository.findByActCode(active);

            // equalsIgnoreCase() Metodu: Temel olarak girilen string türünde bir ifadenin bir
            // başka string türünden ifade ile aynı olup olmadığını gösterir
            if (!a.getActCode().equalsIgnoreCase("")) {

                a.setValid(true);
                userRepository.save(a);
            }
        return "/login";
   }

}