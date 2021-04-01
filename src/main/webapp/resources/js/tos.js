function emptyCheck(){
	if(document.writeform.tos_content.value==""){
		alert("내용을 입력하세요");
		document.writeform.tos_content.focus();
		return false;
	}
};