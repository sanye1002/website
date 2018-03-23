package com.rysj.dataobject;

import com.rysj.utils.RandomUtils;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by my
 * 2018-03-14 17:28
 */
@Entity
@Data
public class AnchorInfo implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;

    private String nickname;

    private String smallImg;

    private Integer height;

    private String platform;

    private String liveId;

    private String description;

    private String content;

    private Integer lookNumber;

    /**
     * 2.0
     */
    //private Integer show = 0;

    public AnchorInfo() {
        
    }
}
