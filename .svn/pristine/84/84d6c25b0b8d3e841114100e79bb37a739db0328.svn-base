var checkSubmitFlg = false;
$(function() {
	lhgdialog.tips('加载中....',1000);
	SupplierAction.getSupplier(function(data) {
		if (data.flag) {
			var vo = data.result;
			$("#supplierId").val(vo.supplierId);
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
			$("#remark").val(vo.remark);
			lhgdialog.tips('加载完成');
		}else{
			lhgdialog.tips('此用户未设置账户信息或者账户信息加载失败，请联系管理员。',5);
		}
	});
});

//提交表单
function submitForm() {
	if (!checkSubmitFlg) {
		// 第一次提交
		checkSubmitFlg = true;
		if("" == $("#supNo").val() || $("#supNo").val() == null){
			lhgdialog.alert("供应商编号不能为空。");
			return false;
		}
		$("body").mask("正在提交中....请稍后....");
		var arr = $("#supplierForm").serializeObject();
		SupplierAction.updateSupplier(arr, function(data) {
			if (data && data.result) {
				$("body").unmask();
				lhgdialog.tips('申请更新操作成功,等待审批通过后信息变更生效', 8);
			} else {
				$("body").unmask();
				lhgdialog.alert("操作失败," + data.remark);
			}
		});
		return true;
	} else {
		// 重复提交
		lhgdialog.tips('请勿重复提交!', 5);
		return false;
	}
}



