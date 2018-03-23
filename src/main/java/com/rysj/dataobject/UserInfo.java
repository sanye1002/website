package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-19 上午 10:10
 */
@Entity
@Data
public class UserInfo {

    @Id
    @GeneratedValue
    private Integer userId;

    private String username;

    private String password;

    private String phone;

    private String avatar;

    public UserInfo() {
    }
}
