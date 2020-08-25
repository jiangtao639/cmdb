package cn.jt.mapper;


import cn.jt.entity.StandardSpectrum;

import java.util.List;

public interface StandardSpectrumMapper {
    List<StandardSpectrum> findStandardSpectrumAllByPage(StandardSpectrum standardSpectrum);
}
