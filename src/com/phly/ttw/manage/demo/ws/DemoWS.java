package com.phly.ttw.manage.demo.ws;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.jws.WebService;

@WebService(endpointInterface = "com.phly.ttw.manage.demo.ws.IDemoWS", serviceName = "DemoWS", portName = "DemoWSPort")
public class DemoWS implements IDemoWS {

	@Override
	public String hello(String name) {
		System.out.println(">>测试" + name);
		return "测试" + name;
	}

	@Override
	public List<DemoVO> getDemos() {
		List<DemoVO> dataList = new ArrayList<DemoVO>();
		DemoVO u1 = new DemoVO();
		u1.setName("测试1");
		u1.setDate(new Date());
		DemoVO u2 = new DemoVO();
		u2.setName("测试2");
		u2.setDate(new Date());
		dataList.add(u1);
		dataList.add(u2);
		return dataList;
	}

	@Override
	public HashMap<String, Object> getMaps() {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("name", "12212");
		map.put("aa", 1221);
		return map;
	}
	
	public void testMap(HashMap<String,Object> param){
		System.out.println("<<<"+param);
	}

	@Override
	public void testSimpleList(List<Object> list) {
		System.out.println("List:"+list);
	}

	@Override
	public void testObj(List<DemoVO> demos) {
		System.out.println(">>>"+demos);
	}
}
