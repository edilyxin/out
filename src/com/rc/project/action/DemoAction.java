package com.rc.project.action;

import java.util.ArrayList;
import java.util.List;

import com.rc.project.form.DemoForm;
import com.rc.util.BaseAction;
import com.rc.util.page.PageBean;

public class DemoAction extends BaseAction {
	
	private List list = new ArrayList();
	private DemoForm form;
	private PageBean bean;//分页标签类
	
	
	
	
	public String findForAuto(){
		
		for(int i=0;i<15;i++){
			form = new DemoForm();
			form.setF10(String.valueOf(i)+"ttttttttttttttt");
			form.setF11(String.valueOf(i)+"ttttttttttttttt");
			form.setF1(String.valueOf(i)+"ttttttttttttttt");
			form.setF2(String.valueOf(i)+"ttttttttttttttt");
			form.setF3(String.valueOf(i)+"ttttttttttttttt");
			form.setF4(String.valueOf(i)+"ttttttttttttttt");
			form.setF5(String.valueOf(i)+"ttttttttttttttt");
			form.setF6(String.valueOf(i)+"ttttttttttttttt");
			form.setF7(String.valueOf(i)+"ttttttttttttttt");
			form.setF8(String.valueOf(i)+"ttttttttttttttt");
			form.setF9(String.valueOf(i)+"ttttttttttttttt");
			list.add(form);
			System.out.print(list.size());
		}
		this.bean = new PageBean(list.size(),10);
		return "findForAuto";
	}
	
	public String find(){
		this.bean = new PageBean(list.size(),10);
		return "find";
	}
	
	public String toAdd(){
		return "add";
	}
	
	public String add(){
		return find();
	}
	
	public String toUpdate(){
		return "update";
	}
	
	public String update(){
		return find();
	}
	
	public String toDelete() throws Exception{
		return this.find();
	}
	
	public String changeValid() throws Exception{
		return this.find();
	}
	
	public String checkUnique() throws Exception{
		if(form.getF1().endsWith("1")){
			response.getWriter().print(true);
		}
		else{
			response.getWriter().print(false);	
		}
		return null;
	}
	
	public PageBean getBean() {
		return bean;
	}

	public void setBean(PageBean bean) {
		this.bean = bean;
	}

	public DemoForm getForm() {
		return form;
	}

	public void setForm(DemoForm form) {
		this.form = form;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
}
