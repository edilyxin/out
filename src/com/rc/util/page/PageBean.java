package com.rc.util.page;

public class PageBean {
	
	public static final int PAGE_SIZE =10;
	 
	private int totalResults;  //�ܼ�¼��
	
	private int pageSize; //ÿҳ��ʾ�ļ�¼��
	
	private int currentPage = 1; // ��ǰҳĬ��Ϊ1
	
	public PageBean(){
		
	}
	public PageBean(int totalResults, int pageSize) {
		super();
		this.totalResults = totalResults;
		this.pageSize = pageSize;
	}
	
	//�Ƿ�����һҳ
	public boolean hasNextPage(){
		return currentPage < this.getTotalPages();
	}
	
	//�Ƿ�����һҳ
	public boolean hasPreviousPage(){
		return currentPage > 1;
	}
	
	//�õ��ܼ�¼��
	public int getTotalResults(){
		return this.totalResults;
	}
	
	//�õ���ǰҳ
	public int getCurrentPage(){
		return this.currentPage;
	}
	//���õ�ǰҳ
	public void setCurrentPage(int currentPage){
		this.currentPage = currentPage;
	}
	
	//���ÿҳ��ʾ��¼��
	public int getPageSize(){
		return this.pageSize;
	}
	
	//����ÿҳ��ʾ��¼��
	public void setPageSize(int pageSize){
		this.pageSize = pageSize;
	}
	
	
	//�õ���ʼ��ʾ��¼��
	public int getStartResult(){
		return (this.currentPage - 1) * pageSize;
	}
	
	//�����ܵ�ҳ��
	public int getTotalPages(){
		return (int)Math.ceil(totalResults / (double)pageSize);
	}

	public void setTotalResults(int totalResults) {
		this.totalResults = totalResults;
	}
	
	public String getPageSQLA(){
		StringBuffer sb = new StringBuffer();
		sb.append("select * from  (select a.*,rownum rn from ( ");
		return sb.toString();
	}
	
	public String getPageSQLB(){
		StringBuffer sb = new StringBuffer();
		sb.append(" )a ")
		.append(" where rownum <=").append(this.getCurrentPage()*this.getPageSize())
		.append(" ) where rn >= ").append((this.getCurrentPage()-1)*this.getPageSize()+1);	
		return sb.toString();
	}
	
	
}
