package com.phly.ttw.manage.supplier.ws;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

import com.phly.ttw.manage.supplier.model.SupplierModel;

public class SupplierClientWS {

	public static void main(String[] args) throws Exception {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setAddress("http://localhost:8080/ttw/webservice/SupplierWS?wsdl");
		factory.setServiceClass(ISupplierWS.class);
		ISupplierWS service = (ISupplierWS) factory.create();
		SupplierModel supplier = new SupplierModel();
		supplier.setSupplierId("324124");
		supplier.setSupEmail("cqwlzc2010@163.com");
		supplier.setSupName("zhangsan");
		supplier.setSupNo("C23423");
		supplier.setContractCode("ceshibianma");
		System.out.println(service.insertSupplierToWwt(supplier));
	}
}
