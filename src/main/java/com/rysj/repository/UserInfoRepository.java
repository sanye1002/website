package com.rysj.repository;

import com.rysj.dataobject.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-20 下午 2:07
 */
public interface UserInfoRepository extends JpaRepository<UserInfo,Integer> {

}
