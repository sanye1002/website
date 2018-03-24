package com.rysj.controller.oa;

import com.rysj.VO.ResultVO;
import com.rysj.dataobject.IndexCarousel;
import com.rysj.exception.WebException;
import com.rysj.form.IndexCarouselForm;
import com.rysj.service.IndexCarouselService;
import com.rysj.utils.ResultVOUtil;
import jdk.nashorn.internal.objects.annotations.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 超级战机
 * 2018-03-23 23:08
 */
@Controller
@Slf4j
@RequestMapping("/oa/carousel")
public class IndexCarouselController {

    @Autowired
    private IndexCarouselService service;

    @PostMapping("/save")
    @ResponseBody
    public ResultVO<Map<String,Object>> save(@Valid IndexCarouselForm carouselForm,
                                             BindingResult bindingResult){
        Map<String,Object> map = new HashMap<>();
        if (bindingResult.hasErrors()){
            log.info("【保存轮播图片】 失败信息={}",bindingResult.getFieldError().getDefaultMessage());
            return ResultVOUtil.error(100,bindingResult.getFieldError().getDefaultMessage());
        }
        IndexCarousel indexCarousel = new IndexCarousel();
        try {
            if (carouselForm.getId()!=null){
                indexCarousel = service.findOne(carouselForm.getId());
            }


        }catch (WebException e){
            
        }

        return ResultVOUtil.success();
    }

    @GetMapping("/list")
    public ModelAndView list(@RequestParam(value = "page",defaultValue = "12") Integer page,
                             @RequestParam(value = "size",defaultValue = "1") Integer size,
                             Map<String,Object> map){

        return new ModelAndView("oa/view/indexCarousel",map);
    }
}
