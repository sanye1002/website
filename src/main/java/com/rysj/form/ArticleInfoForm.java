package com.rysj.form;

import com.rysj.utils.RandomUtils;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-22 下午 5:47
 */
@Data
public class ArticleInfoForm implements Serializable {

    private Integer id;
    /**
     * 类型 荣耀战绩 0 艺人热讯1 业绩动态2
     */

    private Integer type;
    /**
     * 封面图
     */
    @NotEmpty(message = "封面图必须上传")
    private String smallImg;

    /**
     * 标题
     */
    @NotEmpty(message = "封面图必须上传")
    private String articleTitle;
    /**
     * 内容
     */
    @NotEmpty(message = "内容必须编写")
    private String content;





}
