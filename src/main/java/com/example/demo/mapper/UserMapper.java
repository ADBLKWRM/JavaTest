package com.example.demo.mapper;

import com.example.demo.pojo.Role;
import com.example.demo.pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    User findUserByUsername(String username);

    List<Role> findRoleByUid(Integer uid);

    List<User> findUserAll(String username,Integer enable);

    Integer delUser(Integer uid);
}
