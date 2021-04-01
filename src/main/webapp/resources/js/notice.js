		
function emptyCheck(){
			
	if(document.writeform.nt_title.value==""){
		alert("제목을 입력하세요");
		document.writeform.nt_title.focus();
		return false;
	}
	if(document.writeform.nt_content.value==""){
		alert("내용을 입력하세요");
		document.writeform.nt_content.focus();
		return false;
	}
};
        	
        	
