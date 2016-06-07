/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.adapter;

import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.annotation.adapters.XmlAdapter;

import com.phly.common.converter.MapConvertor;

/**
 * map适配器
 * @Description: ws传递map参数解组码
 * @author linyong
 * @since 2015-6-24 上午10:53:11
 */
public class MapAdapter extends XmlAdapter<MapConvertor, Map<String, Object>> {

	/**
	 * Convert a value type to a bound type
	 * @param map
	 * @return
	 * @throws Exception
	 * @see javax.xml.bind.annotation.adapters.XmlAdapter#unmarshal(java.lang.Object)
	 */
	@Override
	public Map<String, Object> unmarshal(MapConvertor map) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		for (MapConvertor.MapEntry e : map.getEntries()) {
			result.put(e.getKey(), e.getValue());
		}
		return result;
	}

	/**
	 * Convert a bound type to a value type.
	 * @param map
	 * @return
	 * @throws Exception
	 * @see javax.xml.bind.annotation.adapters.XmlAdapter#marshal(java.lang.Object)
	 */
	@Override
	public MapConvertor marshal(Map<String, Object> map) throws Exception {
		MapConvertor convertor = new MapConvertor();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			MapConvertor.MapEntry e = new MapConvertor.MapEntry(entry);
			convertor.addEntry(e);
		}
		return convertor;
	}

}
