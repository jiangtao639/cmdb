package cn.jt.service.impl;

import cn.jt.entity.PageBean;
import cn.jt.entity.StandardSpectrum;
import cn.jt.mapper.StandardSpectrumMapper;
import cn.jt.service.StandardSpectrumService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("standardSpectrumService")
public class StandardSpectrumServiceImpl implements StandardSpectrumService {

    @Autowired
    private StandardSpectrumMapper standardSpectrumMapper;
    @Autowired
    private PageBean<StandardSpectrum> pb;

    @Override
    public PageBean<StandardSpectrum> findStandardSpectrumAllByPage(int currentPage, int rows, StandardSpectrum standardSpectrum) {
        //设置分页相关参数 当前页，每页显示的条数
        PageHelper.startPage(currentPage,rows);
        List<StandardSpectrum> standardSpectrumList = standardSpectrumMapper.findStandardSpectrumAllByPage(standardSpectrum);
        //获得分页相关的参数
        PageInfo<StandardSpectrum> pageInfo = new PageInfo<>(standardSpectrumList);
        long totalCount = pageInfo.getTotal();
        int totalPage = pageInfo.getPages();

        //封装pb
        pb.setTotalCount((int) totalCount);
        pb.setTotalPage(totalPage);
        pb.setList(standardSpectrumList);
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        return pb;

    }
}
