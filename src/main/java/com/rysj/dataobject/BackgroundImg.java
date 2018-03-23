package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-19 上午 10:16
 * 背景表
 */
@Entity
@Data
public class BackgroundImg {

    @Id
    @GeneratedValue
    private Integer id;
    /**
     * 底部背景图片
     */
    private String footImg;
    /**
     * 关于我们背景
     */
    private String aboutUs;
    /**
     * 关于团队背景
     */
    private String aboutTeam;
    /**
     * 签约艺人背景
     */
    private String signAnchor;
    /**
     * 案例展示背景
     */
    private String caseShow;
    /**
     *艺人招募背景
     */
    private String recruitmentImg;
    /**
     * 业界动态背景
     */
    private String industryInformation;
    /**
     * 人才招聘背景
     */
    private String contactUs;
    /**
     * 商务合作背景
     */
    private String businessCooperation;

    public BackgroundImg() {
    }
}
