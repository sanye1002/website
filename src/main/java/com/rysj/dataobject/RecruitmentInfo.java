package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-19 上午 10:09
 * 艺人招募表
 */
@Entity
@Data
public class RecruitmentInfo {

    @Id
    @GeneratedValue
    private Integer id;
    /**
     *内容
     */
    private String content;
    /**
     * 展示 0不展示 1 展示 默认0
     */
    private Integer show = 0;

    public RecruitmentInfo() {
    }
}
