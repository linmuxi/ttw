package com.phly.ttw.manage.order.ws;

import java.util.List;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.phly.ttw.manage.order.model.OrderModel;

public class OrderClientWS {

	public static void main(String[] args) throws Exception {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setAddress("http://localhost:8080/ttw/webservice/OrderWS?wsdl");
		factory.setServiceClass(IOrderWS.class);
		IOrderWS service = (IOrderWS) factory.create();
		List<OrderModel> models = service.getOrderFromWwtByDate("2015-08-15");
		System.out.println(models.size());
	}
}
