package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-19 上午 10:09
 */
@Entity
@Data
public class TeamDetail {
    @Id
    @GeneratedValue
    private Integer id;

    private String path;

    public TeamDetail() {
    }
}
