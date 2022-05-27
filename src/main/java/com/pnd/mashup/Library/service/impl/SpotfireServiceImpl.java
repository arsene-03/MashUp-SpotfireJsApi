package com.pnd.mashup.Library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pnd.mashup.Library.mapper.SpotfireMapper;
import com.pnd.mashup.Library.service.SpotfireService;

import com.pnd.mashup.model.Lib_items;


@Service
public class SpotfireServiceImpl implements SpotfireService {

	@Autowired
	SpotfireMapper spotfireMapper;
	
	
	@Override
	public List<Lib_items> selectLibrary() {
		List<Lib_items> itemLists = spotfireMapper.selectLibrary();
		return itemLists;
	}

	
}

