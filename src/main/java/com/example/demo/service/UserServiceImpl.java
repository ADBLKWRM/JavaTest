package com.example.demo.service;

import com.example.demo.mapper.UserMapper;
import com.example.demo.pojo.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.findUserByUsername(username);
        if(user == null){
            throw  new UsernameNotFoundException("用户不存在");
        }
        user.setRoles(userMapper.findRoleByUid(user.getUid()));
        return user;
    }

    @Override
    public List<User> findUserAll(String username,Integer enable) {
        List<User> list=userMapper.findUserAll(username,enable);
        for (User user:list){
            user.setRoles(userMapper.findRoleByUid(user.getUid()));
        }
        return list;
    }

    @Override
    public Integer delUser(Integer uid) {
        return userMapper.delUser(uid);
    }
}
