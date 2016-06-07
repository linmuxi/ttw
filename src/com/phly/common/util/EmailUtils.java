/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.util.Date;
import java.util.Properties;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.phly.common.exceptionhandler.exception.BaseException;
import com.phly.ttw.manage.member.model.MemberVO;

/**
 *邮件发送工具类
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月29日 下午4:47:25
 */
public class EmailUtils {

	private final static Logger logger = LoggerFactory.getLogger(EmailUtils.class);
	private static String EMAIL_HOSTNAME = null;//邮件服务器地址
	private static String EMAIL_USERNAME = null;//邮件服务器用户名
	private static String EMAIL_PASSWORD = null;//邮件服务器密码
	public static String EMAIL_SUBJECT_RESERT=null;//邮件标题
	public static String EMAIL_SUBJECT_PASSWORD_FIND=null;//邮件标题
	public static String EMAIL_MSG_RESERT=null;//邮件内容
	public static String EMAIL_MSG_PASSWORD_FIND=null;//邮件内容
	public static String SUPPLIER_PASSWORD=null;
	public static String PASSWORD_FIND_URL = null;
	
	static{
		Properties properties =  (Properties) ApplicationContextUtil.getApplicationContext().getBean("propertiesFactoryBean");
		EMAIL_HOSTNAME = properties.getProperty("email.host.name");
		EMAIL_USERNAME = properties.getProperty("email.user.name");
		EMAIL_PASSWORD = properties.getProperty("email.user.password");
		EMAIL_SUBJECT_RESERT = properties.getProperty("email.supplier.text.subject.resert");
		EMAIL_MSG_RESERT = properties.getProperty("email.supplier.text.msg.resert");
		EMAIL_SUBJECT_PASSWORD_FIND = properties.getProperty("email.member.text.subject.pw_find");
		EMAIL_MSG_PASSWORD_FIND = properties.getProperty("email.member.text.msg.pw_find");
		PASSWORD_FIND_URL = properties.getProperty("email.member.pw_find.url");
	}
	
	
	/**
	 * 发送邮件
	 * @param toAddress 邮件地址
	 * @param subject 邮件标题
	 * @param message 邮件内容
	 * @return
	 */
	public static boolean sendHtmlMail(String toAddress,String subject,String message){
		boolean sendFlag = false;
		try {
			HtmlEmail htmlEmail = new HtmlEmail();
			htmlEmail.setHostName(EMAIL_HOSTNAME);// 你的邮件服务器的地址
			htmlEmail.setAuthentication(EMAIL_USERNAME,EMAIL_PASSWORD);
			htmlEmail.setCharset("UTF-8");
			htmlEmail.setFrom(EMAIL_USERNAME);// 发件人
			htmlEmail.addTo(toAddress);//收件
			// 设置收件人，如果想添加多个收件人，将此语句多写几次即可。其中参数1，代表收件人邮件地址；
			htmlEmail.setSubject(subject);
			htmlEmail.setContent(message,"text/html;charset=utf8");
			htmlEmail.setMsg(message);
			htmlEmail.send();// 发送邮件
			sendFlag = true;
		} catch (EmailException e) {
			logger.error(EmailUtils.class.getName() + " sendHtmlMail  发送邮件异常异常：" + e);
			throw new BaseException(EmailUtils.class.getName() + " sendHtmlMail  发送邮件异常异常：" + e);
		}
		return sendFlag;
	}
	
	/***
	 * 密码重置
	 * @param supName
	 * @param account
	 * @param password
	 * @return
	 */
	public static String getMessage_resetPassWord(String supName,String account,String password){
		String message = EmailUtils.EMAIL_MSG_RESERT;
		String m1 = message.replace("#supplierName#", supName);
		String m2 = m1.replace("#account#", account);
		String m3 =m2.replace("#updateTime#", DateUtil.pattern("yyyy-MM-dd hh:mm:ss", new Date()));
		String m4 = m3.replace("#password#", password);
		return m4;
	}
	

	/***
	 * 找回会员密码
	 * @param supName
	 * @param account
	 * @param password
	 * @return
	 */
	public static String getMessage_passWord_find(MemberVO vo,String url){
		String message = EmailUtils.EMAIL_MSG_PASSWORD_FIND;
		String m1 = message.replace("#memberName#", vo.getName());
		String desMsg="";
		try {
			desMsg = DesUtil.encrypt(vo.getEmail());
		}  catch (Exception e) {
			e.printStackTrace();
			logger.error("会员密码找回邮件参数加密异常：" + e.getMessage());
		}
		String m2 = m1.replace("#url#", url.concat("?vs="+desMsg));
		return m2;
	}
	
	
}
