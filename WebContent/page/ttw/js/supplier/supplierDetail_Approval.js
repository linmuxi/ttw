$(function(){
    SupplierAction.getSupplier(function(data){
    	if(data.flag){
    		var vo = data.result;
    		$("#vo").val(vo);
    		/*$("#supplierId").val(vo.supplierId);
    		$("#supNo").val(vo.supNo);
    		$("#contractCode").val(vo.contractCode);
    		$("#cmbPeopleName").val(vo.cmbPeopleName);
    		$("#supName").val(vo.supName);
    		$("#supEmail").val(vo.supEmail);
    		$("#supPhone").val(vo.supPhone);
    		$("#supFaxes").val(vo.supFaxes);
    		$("#supAddress").val(vo.supAddress);
    		$("#userId").val(vo.userId);
    		$("#bankAccountName").val(vo.bankAccountName);
    		$("#bankAccountNo").val(vo.bankAccountNo);
    		$("#bankAddress").val(vo.bankAddress);
    		$("#linkPeopleName").val(vo.linkPeopleName);
    		$("#linkPeoplePhone").val(vo.linkPeoplePhone);
    		$("#linkPeopleQQ").val(vo.linkPeopleQQ);
    		$("#linkPeopleEmail").val(vo.linkPeopleEmail);
    		$("#linkPeopleAddress").val(vo.linkPeopleAddress);
    		$("#headPeopleCardNo").val(vo.headPeopleCardNo);
    		$("#headPeopleName").val(vo.headPeopleName);
    		$("#headPeoplePhone").val(vo.headPeoplePhone);
    		$("#headPeopleQQ").val(vo.headPeopleQQ);
    		$("#headPeopleEmail").val(vo.headPeopleEmail);
    		$("#remark").val(vo.remark);*/
    	}
    });
});