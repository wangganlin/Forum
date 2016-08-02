package com.forum.util;

public class Page {
	private int pageTotal;// 总页数

	private int rowTotal;

	private static final int defaultPageSize = 10;// 默认每页记录数

	private int pageSize;// 每页记录数

	private int pageCount;// 当前页数

	private int startIndex;// 记录开始下标

	private int endIndex;// 记录结束下标

	public Page() {
		super();
	}

	/**
	 * 初始化分页
	 * 
	 * @param rowTotal
	 *            总记录数
	 * @param pageCount
	 *            当前页码号
	 */
	public Page(int rowTotal, int pageCount) {
		super();
		this.rowTotal = rowTotal;
		this.pageCount = pageCount;
		this.pageTotal = this.rowTotal / defaultPageSize + (this.rowTotal % defaultPageSize == 0 ? 0 : 1);
		this.startIndex = (pageCount-1) * defaultPageSize + 1;
		this.endIndex = this.startIndex + defaultPageSize - 1;

	}

	/**
	 * 初始化page
	 * @param rowTotal
	 *            总记录数
	 * @param pageCount
	 *            当前页码
	 * @param pageSize
	 *            每页记录数
	 */
	public Page(int rowTotal, int pageCount, int pageSize) {
		super();
		this.rowTotal = rowTotal;
		this.pageCount = pageCount;
		this.pageSize = pageSize;
		this.pageTotal = this.rowTotal / this.pageSize + (this.rowTotal % this.pageSize == 0 ? 0 : 1);
		this.startIndex = (pageCount-1) * this.pageSize + 1;
		this.endIndex = this.startIndex + this.pageSize - 1;

	}

	@Override
	public String toString() {
		return "Page [pageTotal=" + pageTotal + ", rowTotal=" + rowTotal + ", pageSize=" + pageSize + ", pageCount="
				+ pageCount + ", startIndex=" + startIndex + ", endIndex=" + endIndex + "]";
	}
	/**
	 * 获取总页数
	 * @return
	 */
	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}
	/**
	 * 获取总记录数
	 * @return
	 */
	public int getRowTotal() {
		return rowTotal;
	}
	
	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}
	/**
	 * 获取每个页面可记录的最大条数
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * 获取当前页面的页码
	 * @return
	 */
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	/**
	 * 获取记录开始下标
	 * @return
	 */
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	/**
	 * 获取记录结束下标
	 * @return
	 */
	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

}
