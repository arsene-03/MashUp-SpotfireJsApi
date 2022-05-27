package com.pnd.mashup.Library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pnd.mashup.model.Lib_items;


@Mapper
public interface SpotfireMapper{
	List<Lib_items> selectLibrary();
}