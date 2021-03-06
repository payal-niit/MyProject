package com.webdesign.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.webdesign.dao.CartItemDAO;
import com.webdesign.model.CartItem;
import com.webdesign.model.Category;

@Repository
public class CartIemDAOImpl implements CartItemDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	public void addToBuyNow(CartItem cartItem) {
		sessionFactory.getCurrentSession().saveOrUpdate(cartItem);
		
	}
	

	
	@SuppressWarnings("unchecked")
	public List<CartItem> listCartItem()
	{
		List<CartItem> listCartItem=sessionFactory.getCurrentSession().createQuery("from CartItem").getResultList();
		return listCartItem;
		
	}
	
	@SuppressWarnings("unchecked")
	public String cartItemList()
	{
		List<CartItem> listCartItem=sessionFactory.getCurrentSession().createQuery("from CartItem").getResultList();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String json = gson.toJson(listCartItem);
		return json;
	}

	
	
	public CartItem getByCartItemId(int cartItemId)
	{
		String query = "from CartItem where cartItemId= "+cartItemId;
		@SuppressWarnings({  "unchecked" })
		List<CartItem> cartItemList=sessionFactory.getCurrentSession().createQuery(query).getResultList();
	    if(cartItemList!=null && !cartItemList.isEmpty())
	    {
	    	return cartItemList.get(0);
	    }
	    else 
	    	{
	    	return null;
	    	}
	    	}
	public void delete(int cartItemId)
	{
		CartItem removeCart = new CartItem();
		removeCart.setCartItemId(cartItemId);
		this.sessionFactory.getCurrentSession().delete(removeCart);
	}
	
	public void setFlag(int cartItemId)
	{
		String query="update CartItem set flag=true where cartItemId= "+cartItemId;
		this.sessionFactory.getCurrentSession().createQuery(query).executeUpdate();
	}
		
	}
