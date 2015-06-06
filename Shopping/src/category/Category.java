package category;

import java.util.*;

public class Category {
	private int id;
	private int pid;
	private String name;
	private String descr;
	private boolean leaf;
	private int grade;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public static void addTop(String name,String descr) {
		Category c = new Category();
		//c.setId(-1);
		c.setPid(0);
		c.setName(name);
		c.setDescr(descr);
		c.setLeaf(true);
		c.setGrade(1);
		//add(c);
		CategoryDAO.addTop(c);
	}
	
	public static Category loadById(int id) {
		
    	return CategoryDAO.loadById(id);
    }
	
	
	public static void addChild(int pid,String name,String descr,int grade) {
		Category c = new Category();
		c.setPid(pid);
		c.setName(name);
		c.setDescr(descr);
		c.setLeaf(true);
		c.setGrade(grade+1);
		//add(c);
		CategoryDAO.addChild(c);
	}
	
	
	
	 public static List<Category> getCategories() {
		 List<Category> categories = new ArrayList<Category>();
	    	CategoryDAO.getCategories(categories,0);//参数，categories放入DAO中进行处理
	    	return categories;
	 }
	 
	 public static List<Category> getCategories(int categoryId) {
		 List<Category> categories = new ArrayList<Category>();
	    	CategoryDAO.getCategories(categories,categoryId);//参数，categories放入DAO中进行处理
	    	return categories;
	 }
	 
    public static void deleteCategory(int id,int pid) {
    	CategoryDAO.deleteCategory(id,pid);
    	CategoryDAO.update(pid);
    }
	 
    public static void changeCategory(int id,String name,String descr) {
    	CategoryDAO.changeCategory(id,name,descr);
    }
    

	    
}
