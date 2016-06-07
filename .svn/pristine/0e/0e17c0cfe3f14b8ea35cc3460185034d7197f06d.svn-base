/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.demo.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.ttw.manage.demo.facade.DemoFacade;
import com.phly.ttw.manage.demo.vo.DemoVO;

/**
 * 测试action类
 * 
 * @Description: Controller springmvc调用,RemoteProxy dwr调用
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
@Controller
@RemoteProxy
public class DemoAction {

	@Resource
	private DemoFacade demoFacade;

	/** 使用SpringMVC调用 */

	@RequestMapping("/demo/hello1")
	public String hello1(String name){
		System.out.println("hello1:"+name);
		return "/demo/demo1.jsp";
	}

	@RequestMapping("/demo/hello2")
	public String hello2(DemoVO vo,HttpServletRequest request){
		System.out.println("hello2:"+vo);
		return "redirect:/demo/hello1?name=fromhello2";
		//return "forward:/xx/x";
		//return "redirect:/xx";//防止表单重复提交，使用重定向跳转页面,不能重定向到WEB-INF目录下
	}

	@RequestMapping("/demo/hello3")
	@ResponseBody
	public Map<String,Object> hello3(Map<String,Object> pmap){
		System.out.println("hello3:"+pmap);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", 101);
		map.put("sex", true);
		map.put("date", new Date());
		map.put("name", "张三");
		return map; //将map转换成json
	}

	@RequestMapping("/demo/hello4")
	@ResponseBody
	public String hello4(Map<String,Object> pmap,HttpServletRequest request){
		System.out.println("hello4:"+pmap);
		return "test "+new Date();
	}

	@RequestMapping("/demo/hello5")
	@ResponseBody
	public String hello5(DemoVO demoVO){
		System.out.println("hello5:"+demoVO);
		return "test hello5"+new Date();
	}

	@RequestMapping("/demo/query6")
	public String query6(){
		System.out.println("query6");
		return "/demo/demo1.jsp";
	}
	
	@RequestMapping("/demo/testCache")
	@ResponseBody
	public List<HashMap<String,Object>> query(Map<String,Object> pmap,HttpServletRequest request){
		return this.demoFacade.query(pmap);
	}
	
	/** 使用SpringMVC调用 end */


	/** 使用dwr调用 */
	@RemoteMethod
	public List<DemoVO> queryUsers(DemoVO demoVO){
		System.out.println("queryUsers:"+demoVO);
		List<DemoVO> dataList = new ArrayList<DemoVO>();
		DemoVO u1 = new DemoVO();
		u1.setName("李四1");
		u1.setDate(new Date());
		dataList.add(u1);
		return dataList;
	}
	/** 使用dwr调用 end */

	/** 测试freemarker */
	@RequestMapping("/demo/index.html")
	public String index(HttpServletRequest request,HttpServletResponse response,ModelMap map){
		//在这里对数据进行缓存，避免重复查询数据
		map.put("name", "张三");
		map.put("title", "你知道吗？小日本要逆天了！！！");
		map.put("date", new Date());
		return "demo.ftl";
		
	}
	/** 测试freemarker end */
}
