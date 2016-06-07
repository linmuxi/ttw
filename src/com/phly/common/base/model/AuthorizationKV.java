/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.model;

/**
 * 权限key value类
 * 
 * @Description 仅仅用作keyvalue存储,用户-角色、角色-模块、角色-权限、权限-资源赋权限使用
 * @author linyong
 * @since 2015年6月11日 上午12:29:39
 */
public class AuthorizationKV {
	private String id;
	private String name;
	private String desc;

	/**
	 * @param id
	 * @param name
	 */
	public AuthorizationKV(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	/**
	 * 
	 */
	public AuthorizationKV() {
		super();
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
