package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-19 上午 10:08
 * 首页轮播展示表
 */
@Entity
@Data
public class IndexCarousel {
    @Id
    @GeneratedValue
    private Integer id;

    /**
     * 路径
     */
    private String pathUrl ;
    /**
     * 展示 0不展示 1 展示 默认0
     */
    private Integer showStatus ;

    public IndexCarousel() {
    }
}
