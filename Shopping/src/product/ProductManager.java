package product;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class ProductManager {
	
	/*********************************************单例模式************************************/
	private static ProductManager pm = null;
	
	static {
		if(pm == null) {
			pm = new ProductManager();
			pm.setDao(new ProductDAO());
		}
	}
	
	public static ProductManager getInstance() {
		return pm;
	}
	
	private ProductManager() {}
	
	/*************************************************************************************/
	
	ProductDAO dao = null;
	
	
	public ProductDAO getDao() {
		return dao;
	}

	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}

	/*******************************************************************************************/

/*	public int findProducts(		  List<Product> list,
									  String keyword,
									  double lowNormalPrice,
									  double highNormalPrice,
									  double lowMemberPrice,
									  double highMemberPrice,
									  Date startPdate,
									  Date endPdate,
									  int categoryId,
									  int pageNo,
									  int pageSize) {
		return dao.findProducts(list,keyword, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startPdate, endPdate, categoryId, pageNo, pageSize);
	}*/
	//这是多个类别的搜索
	public int findProducts(		
			  List<Product> list,
			  String keyword,
			  double lowNormalPrice,
			  double highNormalPrice,
			  double lowMemberPrice,
			  double highMemberPrice,
			  Timestamp startPdate,
			  Timestamp endPdate,
			  int[] categoryIds,
			  int pageNo,
			  int pageSize) {
	 return dao.findProducts(list, keyword, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startPdate, endPdate, categoryIds, pageNo, pageSize);
	}
	

	
	public boolean updateProduct(Product p) {
		return this.dao.updateProduct(p);
	}
	

	
	public boolean deleteProductById(int id) {
		this.dao.deleteProductById(id);
		return true;
	}
	
/*	public boolean deleteProductByCategoryId(int categoryId) {
		return false;
	}*/
	
	public boolean addProduct(Product p) {
		return dao.addProduct(p);
	}
	/*************两个有关页码的方法，第二个是新的方法*************/
	public List<Product> getProducts() {
		return dao.getProducts();
	}
	
	public int getProduct(List<Product> products ,int pageNo,int pageSize) {
		return this.dao.getProduct(products,pageNo,pageSize);
	}
	/******************************************************************************************/
	
	public Product loadById(int id) {
		return this.dao.loadById(id);
	}
	
	
	/*
	public List<Product> getLastestProduct(int count) {
		return this.dao.getLastestProduct(count);
	}*/
 }
