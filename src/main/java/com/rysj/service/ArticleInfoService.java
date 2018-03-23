package com.rysj.service;

import com.rysj.dataobject.AnchorInfo;
import com.rysj.dataobject.ArticleInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-22 下午 6:01
 */
public interface ArticleInfoService {

    /**
     * 保存/更新
     * @param articleInfo
     * @return
     */
    ArticleInfo save(ArticleInfo articleInfo);

    /**
     * 查询所有
     * @param pageable
     * @return
     */
    Page<ArticleInfo> findAll(Pageable pageable);

    /**
     * 删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 查找
     * @param id
     * @return
     */
    ArticleInfo findOne(Integer id);

}
