package com.rysj.repository;

import com.rysj.dataobject.IndexCarousel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-20 下午 1:36
 */
public interface IndexCarouselRepository extends JpaRepository<IndexCarousel,Integer>{

    List<IndexCarousel> findByShowStatus(Integer show);
}
