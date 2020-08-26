package cn.jt.mapper;

import cn.jt.entity.ReferCompound;


import java.util.List;

public interface ReferCompoundMapper {

    List<ReferCompound> findReferCompoundAllByPage(ReferCompound referCompound);

    ReferCompound findReferCompoundById(String ID);

}

