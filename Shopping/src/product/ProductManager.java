package product;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class ProductManager {
	
	/*********************************************����ģʽ************************************/
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
	//���Ƕ����������
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
	/*************�����й�ҳ��ķ������ڶ������µķ���*************/
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
