package cn.jt.service;

import cn.jt.entity.PageBean;
import cn.jt.entity.StandardSpectrum;

public interface StandardSpectrumService {
    PageBean<StandardSpectrum> findStandardSpectrumAllByPage(int currentPage, int rows, StandardSpectrum standardSpectrum);

}
