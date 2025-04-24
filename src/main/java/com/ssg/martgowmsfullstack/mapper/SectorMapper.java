package com.ssg.martgowmsfullstack.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SectorMapper {
    void resetSectorStatus();
}
