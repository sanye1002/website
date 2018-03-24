package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.ArticleInfo;
import com.rysj.exception.WebException;
import com.rysj.form.ArticleInfoForm;
import com.rysj.service.ArticleInfoService;
import com.rysj.utils.RandomUtils;
import com.rysj.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.awt.print.Pageable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-22 下午 6:08
 */
@Controller
@Slf4j
@RequestMapping("/oa/article")
public class ArticleInfoController {

    @Autowired
    private ArticleInfoService service;

    @GetMapping("/index")
    public ModelAndView index(Map<String,Object> map){
        map.put("pageId",3);
        return new ModelAndView("oa/view/articleAdd",map);
    }
    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String,Object>> save(@Valid ArticleInfoForm articleInfoForm,
                                             BindingResult bindingResult){
        Map<String,Object> map = new HashMap<>();
        if (bindingResult.hasErrors()){
            log.info("【保存文章】 失败信息={}",bindingResult.getFieldError().getDefaultMessage());
            return ResultVOUtil.error(100,bindingResult.getFieldError().getDefaultMessage());
        }
        ArticleInfo articleInfo = new ArticleInfo();
       try {
           if (articleInfo.getId()!=null){
               articleInfo = service.findOne(articleInfoForm.getId());
           }
           BeanUtils.copyProperties(articleInfoForm,articleInfo);
           if (articleInfoForm.getId()==null){
               articleInfo.setLookNumber(RandomUtils.getRandom());
               articleInfo.setCreateTime(new Date(System.currentTimeMillis()));
           }
           service.save(articleInfo);
       }catch (WebException w){
           return ResultVOUtil.error(100,w.getMessage());
       }
        map.put("url", "/oa/article/index");
        return ResultVOUtil.success(map);
    }

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page",defaultValue = "1") Integer page,
                             @RequestParam(value = "size",defaultValue = "12") Integer size,
                             Map<String,Object> map){
        PageRequest request = new PageRequest(page-1,size);
        Page<ArticleInfo> articleInfoPage = service.findAll(request);
        map.put("pageId",4);
        map.put("pageContent",articleInfoPage);
        map.put("url","/oa/article/list");
        map.put("size",size);
        map.put("currentPage",page);
        return new ModelAndView("oa/view/articleList",map);
    }


}
