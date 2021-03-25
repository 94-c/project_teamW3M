package com.spring.w3m.upload.common;
import java.io.File;

public class Test {
	public AwsS3 awsS3 = AwsS3.getInstance();
	
	public static void main(String[] args) {
		Test test = new Test();
		/* 업로드 테스트
		File file = new File("C:\\Users\\bus27\\OneDrive\\문서\\카카오톡 받은 파일\\KakaoTalk_20210112_175739634.jpg");
		String key = "img/mainlogo.png";		
		test.upload(file, key);
		*/
		
		// 삭제 테스트
		String del_key = "chicken.jpeg";
		test.delete(del_key);
	}
	
	public void upload(File file, String key) {
		awsS3.upload(file, key);
	}
	public void delete(String key) {
		awsS3.delete(key);
	}
}
