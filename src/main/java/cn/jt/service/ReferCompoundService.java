package cn.jt.service;

import cn.jt.entity.PageBean;
import cn.jt.entity.ReferCompound;


public interface ReferCompoundService {
    PageBean<ReferCompound> findReferCompoundAllByPage(int currentPage, int rows, ReferCompound referCompound);
}
