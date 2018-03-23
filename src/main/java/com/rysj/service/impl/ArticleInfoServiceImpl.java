package com.rysj.service.impl;

import com.rysj.dataobject.AnchorInfo;
import com.rysj.dataobject.ArticleInfo;
import com.rysj.repository.ArticleInfoRepository;
import com.rysj.service.ArticleInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-23 上午 9:34
 */
@Service
@Transactional
public class ArticleInfoServiceImpl implements ArticleInfoService{

    @Autowired
    private ArticleInfoRepository repository;

    @Override
    public ArticleInfo save(ArticleInfo articleInfo) {
        return repository.save(articleInfo);
    }

    @Override
    public Page<ArticleInfo> findAll(Pageable pageable) {
        Page<ArticleInfo> articleInfoPage = repository.findAll(pageable);
        List<ArticleInfo> articleInfoList = articleInfoPage.getContent();

        return new PageImpl<>(articleInfoList,pageable,articleInfoPage.getTotalElements());
    }

    @Override
    public void delete(Integer id) {
        repository.delete(id);
    }

    @Override
    public ArticleInfo findOne(Integer id) {
        return repository.findOne(id);
    }
}
