package cn.jt.service.impl;

import cn.jt.entity.PageBean;
import cn.jt.entity.ReferCompound;
import cn.jt.mapper.ReferCompoundMapper;
import cn.jt.service.ReferCompoundService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("referCompoundService")
public class ReferCompoundServiceImpl implements ReferCompoundService {

    @Autowired
    private ReferCompoundMapper referCompoundMapper;
    @Autowired
    private PageBean<ReferCompound> pb;

    @Override
    public PageBean<ReferCompound> findReferCompoundAllByPage(int currentPage, int rows, ReferCompound referCompound) {

        //设置分页相关参数 当前页，每页显示的条数
        PageHelper.startPage(currentPage,rows);
        List<ReferCompound> referCompoundList = referCompoundMapper.findReferCompoundAllByPage(referCompound);

        //获得分页相关的参数
        PageInfo<ReferCompound> pageInfo = new PageInfo<>(referCompoundList);
        long totalCount = pageInfo.getTotal();
        int totalPage = pageInfo.getPages();
        //封装pb
        pb.setTotalCount((int) totalCount);
        pb.setTotalPage(totalPage);
        pb.setList(referCompoundList);
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        return pb;


    }
}
