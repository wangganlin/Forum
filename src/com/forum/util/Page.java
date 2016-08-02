package com.forum.util;

public class Page {
	private int pageTotal;// ��ҳ��

	private int rowTotal;

	private static final int defaultPageSize = 10;// Ĭ��ÿҳ��¼��

	private int pageSize;// ÿҳ��¼��

	private int pageCount;// ��ǰҳ��

	private int startIndex;// ��¼��ʼ�±�

	private int endIndex;// ��¼�����±�

	public Page() {
		super();
	}

	/**
	 * ��ʼ����ҳ
	 * 
	 * @param rowTotal
	 *            �ܼ�¼��
	 * @param pageCount
	 *            ��ǰҳ���
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
	 * ��ʼ��page
	 * @param rowTotal
	 *            �ܼ�¼��
	 * @param pageCount
	 *            ��ǰҳ��
	 * @param pageSize
	 *            ÿҳ��¼��
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
	 * ��ȡ��ҳ��
	 * @return
	 */
	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}
	/**
	 * ��ȡ�ܼ�¼��
	 * @return
	 */
	public int getRowTotal() {
		return rowTotal;
	}
	
	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}
	/**
	 * ��ȡÿ��ҳ��ɼ�¼���������
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * ��ȡ��ǰҳ���ҳ��
	 * @return
	 */
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	/**
	 * ��ȡ��¼��ʼ�±�
	 * @return
	 */
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	/**
	 * ��ȡ��¼�����±�
	 * @return
	 */
	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

}
