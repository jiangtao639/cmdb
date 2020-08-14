package cn.jt.controller;


import cn.jt.entity.PageBean;
import cn.jt.entity.ReferCompound;
import cn.jt.service.ReferCompoundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/browse")
public class BrowseController {
    @Autowired
    private ReferCompoundService referCompoundService;



    /*=======================referCompoundController===================================*/
    @RequestMapping("/referCompound")
    public ModelAndView referCompound(HttpServletRequest req){
        //获取页码参数
        String currentPage = req.getParameter("currentPage");//当前页码
        String rows = req.getParameter("rows");//每页记录数
        if(currentPage ==null || "".equals(currentPage)){
            currentPage = "1";
        }
        if(rows ==null || "".equals(rows)){
            rows = "50";
        }
        //获取查询参数
        String name = req.getParameter("Name");
        String inchi = req.getParameter("Inchi");
        String formula = req.getParameter("Formula");
        //封装请求到referCompound中
        ReferCompound rc = new ReferCompound();
        rc.setName(name);
        rc.setInchi(inchi);
        rc.setFormula(formula);
        //获取查询结果
        PageBean<ReferCompound> pb = referCompoundService.findReferCompoundAllByPage(Integer.parseInt(currentPage), Integer.parseInt(rows), rc);
        //数据存入域和页面跳转
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("rc",rc);
        modelAndView.addObject("pb",pb);
        modelAndView.setViewName("browseReferenceCompound");

        return modelAndView;
    }
}
