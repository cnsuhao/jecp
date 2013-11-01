package net.loyin.pageModel;

import java.io.Serializable;
import java.util.List;

/**
 * easyui的datagrid模型
 * 
 * @author loyin
 */
public class DataGrid implements Serializable {

	private static final long serialVersionUID = 6732325477388107799L;
	/** 总记录数 */
	private int total;
	/** 每行记录 */
	private List<?> rows;
	/** 底部列 */
	private List<?> footer;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

	public List<?> getFooter() {
		return footer;
	}

	public void setFooter(List<?> footer) {
		this.footer = footer;
	}

}
