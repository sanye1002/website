package com.rysj.form;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-21 下午 5:26
 */
@Data
public class AnchorInfoForm {

    private Integer id;

    @NotEmpty(message = "昵称不能为空")
    private String nickname;

    @NotEmpty(message = "封面图必须上传")
    private String smallImg;

    private int height;

    @NotEmpty(message = "平台不能为空")
    private String platform;

    @NotEmpty(message = "直播ID不能为空")
    private String liveId;

    @NotEmpty(message = "描述内容不能为空")
    private String description;

    @NotEmpty(message = "详细内容必须编辑")
    private String content;
    
    private Integer lookNumber;

}
