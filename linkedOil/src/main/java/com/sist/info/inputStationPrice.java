package com.sist.info;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class inputStationPrice {
	public static void main(String[] args) {
		 List<List<String>> ret = new ArrayList<List<String>>();
		BufferedReader br = null;
		
		try {
			br = Files.newBufferedReader(Paths.get("C:\\data\\stationPrice.csv"), Charset.forName("UTF-8"));
			String line = "";
			
			while((line = br.readLine())!=null) {
				//CSV 1���� �����ϴ� ����Ʈ
                List<String> tmpList = new ArrayList<String>();
                String array[] = line.split(",");
                //�迭���� ����Ʈ ��ȯ
                tmpList = Arrays.asList(array);
                System.out.println(tmpList.get(0));
                ret.add(tmpList);
			}
		} catch (Exception e) {
			System.out.println("���ܹ߻�:" + e.getMessage());
		}finally {
			try {
				if(br != null) br.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
