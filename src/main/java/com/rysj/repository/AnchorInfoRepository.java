package com.rysj.repository;

import com.rysj.dataobject.AnchorInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-20 下午 2:00
 */
public interface AnchorInfoRepository extends JpaRepository<AnchorInfo,Integer> {
}
