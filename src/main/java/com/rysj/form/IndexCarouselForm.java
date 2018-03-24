package com.rysj.form;

import lombok.Data;

/**
 * Created by 超级战机
 * 2018-03-23 23:23
 */
@Data
public class IndexCarouselForm {

    private Integer id;

    /**
     * 路径
     */
    private String path;
    /**
     * 展示 0不展示 1 展示 默认0
     */
    private Integer show;
}
