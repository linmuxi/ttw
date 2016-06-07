package com.phly.ttw.manage.demo.ws;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

public class ClientWS {

	public static void main(String[] args) {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setAddress("http://localhost:8080/ttw/webservice/DemoWS?wsdl");
		factory.setServiceClass(IDemoWS.class);
		//IDemoWS service = (IDemoWS) factory.create();
	}
}
