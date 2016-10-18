package com.webdesign.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webdesign.daoimpl.ProductDAOImpl;
import com.webdesign.model.Product;


@Service
@Transactional
public class ProductService
{@Autowired
	private ProductDAOImpl productDAO;

	@Transactional
	public void createProduct(Product product)
	{
		productDAO.createProduct(product);
	}
@Transactional
   public String listProduct()
   {
	return this.productDAO.listProduct();
   }
@Transactional
public Product getById(int productId)
{
	return this.productDAO.getById(productId);
}

public void delete(int productId)
{
	productDAO.delete(productId);
}
}