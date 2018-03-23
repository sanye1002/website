package com.rysj.dataobject;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-19 上午 10:07
 * 文章表
 */
@Entity
@Data
public class ArticleInfo {

    @Id
    @GeneratedValue
    private Integer id;

    /**
     * 类型 荣耀战绩 0 艺人热讯1 业绩动态2
     */
    private Integer type;
    /**
     * 封面图
     */
    private String smallImg;
    /**
     * 人气
     */
    private Integer lookNumber;
    /**
     * 标题
     */
    private String articleTitle;
    /**
     * 内容
     */
    private String content;
    /**
     * 时间
     */

    private Date createTime;

    public ArticleInfo() {

    }
}
