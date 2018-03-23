package com.rysj.controller;


import com.rysj.VO.ResultVO;
import com.rysj.utils.ResultVOUtil;
import com.rysj.utils.UploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-16 上午 11:06
 */
@RestController
@RequestMapping("/upload")
@Slf4j
public class UploadController {

    @PostMapping("/img/{type}")
    private ResultVO<Map<String, String>> uploadFile(HttpServletRequest request,
                                                     @PathVariable String type,
                                                     MultipartFile file) throws FileNotFoundException {
        Map<String, String> map = new HashMap<>();
        //线上path

        /*String path = request.getSession().getServletContext()
                .getRealPath("\\upload\\" +type+"\\");*/
        //测试path


        File upload = new File(new File(ResourceUtils.getURL("classpath:")
                .getPath()).getAbsolutePath(),"static/upload/"+type);
        String path = upload.getAbsolutePath();
        log.info("path={}",upload.getAbsolutePath() );
       // log.info("filename={}", new ProjectUrl().getUpLoadUrl());
        //调用upload utils
        String src = UploadUtil.uploadFile(file, path,type);
        if (src != null) {
            map.put("src", src);
            return ResultVOUtil.success(map);
        } else {
            return ResultVOUtil.error(100, "上传失败");
        }

    }
}
