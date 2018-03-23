package com.rysj.service;

import com.rysj.dataobject.AnchorInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-21 下午 5:30
 */
public interface AnchorInfoService {

    /**  保存艺人*/
    AnchorInfo save(AnchorInfo anchorInfo);
    /**  查询所有*/
    Page<AnchorInfo> findList(Pageable pageable);
    /**  删除艺人*/

    /**  编辑艺人*/
    /**
     * id查询
     * @param id
     * @return
     */
    AnchorInfo findOne(Integer id);
}
