package com.rysj.service.impl;

import com.rysj.dataobject.IndexCarousel;
import com.rysj.repository.IndexCarouselRepository;
import com.rysj.service.IndexCarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by 超级战机
 * 2018-03-23 22:59
 */
@Service
@Transactional
public class IndexCarouselServiceImpl implements IndexCarouselService{

    @Autowired
    private IndexCarouselRepository repository;

    @Override
    public IndexCarousel save(IndexCarousel indexCarousel) {
        return repository.save(indexCarousel);
    }

    @Override
    public void delete(Integer id) {
        repository.delete(id);
    }

    @Override
    public Page<IndexCarousel> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public List<IndexCarousel> findByShowStatus(Integer show) {
        return repository.findByShowStatus(show);
    }

    @Override
    public IndexCarousel findOne(Integer id) {
        return repository.findOne(id);
    }
}
