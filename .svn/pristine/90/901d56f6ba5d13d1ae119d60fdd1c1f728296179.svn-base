package com.phly.ttw.manage.member.ws;

import java.util.List;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.phly.ttw.manage.member.model.MemberModel;

public class MemberClientWS {

	public static void main(String[] args) throws Exception {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setAddress("http://localhost:8080/ttw/webservice/MemberWS?wsdl");
		factory.setServiceClass(IMemberWS.class);
		IMemberWS service = (IMemberWS) factory.create();
		List<MemberModel> models = service.getMemberFromWwtByDate("2015-08-15");
		System.out.println(models.size()+"bbbbbb");
	}
}
