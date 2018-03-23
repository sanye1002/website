package com.rysj.utils;

import com.rysj.VO.ResultVO;
import com.rysj.enums.ResultEnum;

/**
 * @Author: 八哥
 * @computer：Administrator
 * @create 2018-03-19 下午 2:58
 */
public class ResultVOUtil {

    public static ResultVO success(Object object){
        ResultVO resultVO = new ResultVO();
        resultVO.setCode(ResultEnum.SUCCESS.getCode());
        resultVO.setMessage(ResultEnum.SUCCESS.getMessage());
        resultVO.setData(object);
        return resultVO;
    }
    public static ResultVO success(){
        ResultVO resultVO = new ResultVO();
        resultVO.setCode(ResultEnum.SUCCESS.getCode());
        resultVO.setMessage(ResultEnum.SUCCESS.getMessage());
        resultVO.setData(null);
        return resultVO;
    }
    public static ResultVO error(Integer code,String message){
        ResultVO resultVO = new ResultVO();
        resultVO.setCode(code);
        resultVO.setMessage(message);
        return resultVO;
    }
}
