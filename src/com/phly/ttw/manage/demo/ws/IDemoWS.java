package com.phly.ttw.manage.demo.ws;

import java.util.HashMap;
import java.util.List;

import javax.jws.WebService;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import com.phly.common.adapter.MapAdapter;

@WebService
public interface IDemoWS {
	public String hello(String name);
	
	//ok
	public List<DemoVO> getDemos();
	
	//ok
	public void testObj(List<DemoVO> demos);
	
	//ok
	@XmlJavaTypeAdapter(MapAdapter.class)
	public HashMap<String,Object> getMaps();
	
	//List<Map>尚无法解析，推荐使用List<VO>
	//public List<HashMap<String,Object>> getListMaps();

	//List<Map>尚无法解析，推荐使用List<VO>	
	//public void testList(List<HashMap<String,Object>> list);
	
	//ok
	public void testMap(@XmlJavaTypeAdapter(MapAdapter.class) HashMap<String,Object> param);	
	
	//ok
	public void testSimpleList(List<Object> list);
	
}
