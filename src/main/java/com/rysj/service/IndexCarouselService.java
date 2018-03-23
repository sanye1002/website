package com.rysj.service;

import com.rysj.dataobject.IndexCarousel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-23 下午 4:09
 */
public interface IndexCarouselService {
    /**
     * 更新保存
     * @param indexCarousel
     * @return
     */
    IndexCarousel save(IndexCarousel indexCarousel);

    /**
     * 删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 查询所有
     * @param pageable
     * @return
     */
    Page<IndexCarousel> findAll(Pageable pageable);
}
