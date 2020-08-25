package cn.jt.controller;


import cn.jt.entity.PageBean;
import cn.jt.entity.ReferCompound;
import cn.jt.entity.StandardSpectrum;
import cn.jt.service.ReferCompoundService;
import cn.jt.service.StandardSpectrumService;
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
    @Autowired
    private StandardSpectrumService standardSpectrumService;
    @Autowired
    private ReferCompound rc;
    @Autowired
    private StandardSpectrum ss;


    /*=======================referCompoundController===================================*/
    @RequestMapping("/referCompound")
    public ModelAndView referCompound(HttpServletRequest req) {
        //获取页码参数
        String currentPage = req.getParameter("currentPage");//当前页码
        String rows = req.getParameter("rows");//每页记录数
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "50";
        }
        //获取查询参数
        String name = req.getParameter("Name");
        String inchi = req.getParameter("Inchi");
        String formula = req.getParameter("Formula");
        //封装请求到referCompound中
        rc.setName(name);
        rc.setInchi(inchi);
        rc.setFormula(formula);
        //获取查询结果
        PageBean<ReferCompound> pb = referCompoundService.findReferCompoundAllByPage(Integer.parseInt(currentPage), Integer.parseInt(rows), rc);
        //数据存入域和页面跳转
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("rc", rc);
        modelAndView.addObject("pb", pb);
        modelAndView.setViewName("browseReferenceCompound");

        return modelAndView;
    }

    /*=======================standardSpectrumController===================================*/
    @RequestMapping("/standardSpectrum")
    public ModelAndView standardSpectrum(HttpServletRequest req) {
        //获取页码参数
        String currentPage = req.getParameter("currentPage");//当前页码
        String rows = req.getParameter("rows");//每页记录数
        if (currentPage == null || "".equals(currentPage)) {
            currentPage = "1";
        }
        if (rows == null || "".equals(rows)) {
            rows = "50";
        }
        //获取查询参数
        String name = req.getParameter("Name");
        String retentionTime = req.getParameter("RetentionTime");
        String precursorMZ = req.getParameter("PrecursorMZ");
        //封装到standardSpectrum中
        ss.setName(name);
        if (retentionTime == null || "".equals(retentionTime)) {
            ss.setRetentionTime(null);
        } else {
            ss.setRetentionTime(Double.parseDouble(retentionTime));
        }

        if (precursorMZ == null || "".equals(precursorMZ)) {
            ss.setPrecursorMZ(null);
        } else {
            ss.setPrecursorMZ(Double.parseDouble(precursorMZ));
        }
        //获取查询结果
        PageBean<StandardSpectrum> pb = standardSpectrumService.findStandardSpectrumAllByPage(Integer.parseInt(currentPage), Integer.parseInt(rows), ss);
        //数据存入域和页面跳转
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("ss", ss);
        modelAndView.addObject("pb", pb);
        modelAndView.setViewName("browseStandardSpectrum");

        return modelAndView;


    }
}
