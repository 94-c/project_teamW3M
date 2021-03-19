package com.spring.w3m.upload.user;
import java.io.File;

public class Test {
	public AwsS3 awsS3 = AwsS3.getInstance();
	
	public static void main(String[] args) {
		Test test = new Test();
		
		File file = new File("C:\\Users\\bus27\\OneDrive\\문서\\카카오톡 받은 파일\\KakaoTalk_20210112_175739634.jpg");
		String key = "img/mainlogo.png";
		
		test.upload(file, key);
	}
	
	public void upload(File file, String key) {
		awsS3.upload(file, key);
	}
}
