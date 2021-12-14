package com.sist.dao;

import java.util.ArrayList;

import com.sist.vo.ProductVO;

public class ProductRepository {
	
	//상품목록을 담을 ArrayList를 멤버변수로 선언
	private ArrayList<ProductVO> listOfProducts = new ArrayList<ProductVO>();
	
	//상품 상세정보를 반환하는 메소드
	public ProductVO getProductById(String productId) {
		ProductVO productById = null;
		for(int i=0; i<listOfProducts.size(); i++) {
			ProductVO product = listOfProducts.get(i);
			if(product != null &&
					product.getProductId() != null &&
					product.getProductId().equals(productId)) 
			{
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public ProductRepository() {
		ProductVO phone = new ProductVO("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display," + "8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitInStock(1000);
		phone.setCondition("New");
		
		ProductVO notebook = new ProductVO("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation, " + "Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitInStock(1000);
		notebook.setCondition("Refurbished");
		
		ProductVO tablet = new ProductVO("P1236", "Galaxy Tab s", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, super AMOLED display, " + "Octa-Core Processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitInStock(1000);
		tablet.setCondition("Old");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	public ArrayList<ProductVO> getAllProducts(){
		return listOfProducts;
	}
}
