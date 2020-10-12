package com.example.demo.controller;

import com.example.demo.pojo.ResponseResult;
import com.example.demo.pojo.User;
import com.example.demo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    UserService userService;

    @RequestMapping("/admin")
    @ResponseBody
    public String admin(){
            return "admin角色";
    }
    @RequestMapping("/user")
    @ResponseBody
    public String user(){
        return "user角色";
    }
    @RequestMapping("/dba")
    @ResponseBody
    public String dba(){
        return "dba角色";
    }

    @RequestMapping("/dba/liang")
    @ResponseBody
    public String liang(){
        return "两个角色才可以访问";
    }

    @RequestMapping({"/dba/index","/"})
    public String index(Model model,String username,Integer enable){
        List<User> userAll = userService.findUserAll(username,enable);
        model.addAttribute("userAll",userAll);
        model.addAttribute("username",username);
        model.addAttribute("enable",enable);
        return "index";
    }

    @RequestMapping("/dba/del")
    @ResponseBody
    public ResponseResult del(Integer uid){
        Integer i = userService.delUser(uid);
            return  new ResponseResult(200,"");
    }

}
