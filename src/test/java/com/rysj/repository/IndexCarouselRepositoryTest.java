package com.rysj.repository;

import com.rysj.dataobject.IndexCarousel;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

/**
 * Created by 超级战机
 * 2018-03-25 18:06
 */
@SpringBootTest
@RunWith(SpringRunner.class)
@Slf4j
public class IndexCarouselRepositoryTest {
    @Autowired
    private IndexCarouselRepository repository;
    @Test
    public void findByShow() throws Exception {
        IndexCarousel carousel = new IndexCarousel();
        carousel.setShow(0);
        carousel.setPath("123456");
        repository.save(carousel);
    }


}